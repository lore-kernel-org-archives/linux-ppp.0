From: Matt Domsch <Matt_Domsch@dell.com>
Date: Tue, 20 Jul 2004 20:46:36 +0000
Subject: Re: [1/2]: ppp_mppe inclusion
Message-Id: <20040720204636.GB27576@lists.us.dell.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, Jul 20, 2004 at 03:45:40PM -0500, Matt Domsch wrote:
> This mail will be followed by two patches, for comment on proposed
> solution.  I've compiled this, but am not able to test this week.
> 
> 1: ppp_generic.patch adds three new fields to struct compressor,
> allowing ppp_generic.c to allocate additional skb space for
> compression/decompression routines that may need such, and a
> 'must_compress' flag to be used to avoid sending non-encrypted packets
> when SC_CCP_UP is not set.

-- 
Matt Domsch
Sr. Software Engineer, Lead Engineer
Dell Linux Solutions linux.dell.com & www.dell.com/linux
Linux on Dell mailing lists @ http://lists.us.dell.com

You can import this changeset into BK by piping this whole message to
'| bk receive [path to repository]' or apply the patch as usual.

=================================

ChangeSet@1.1849, 2004-07-20 16:27:00-04:00, Matt_Domsch@dell.com
  PPP: add fields to struct compressor, use them in ppp-generic.c
  
  Add fields to struct compressor to allocate extra skb space
  for compression/decompression, and a flag to drop packets
  if CCP is down but required by the compression (encryption) alg.


 drivers/net/ppp_generic.c |   76 ++++++++++++++++++++++++++++++++--------------
 include/linux/ppp-comp.h  |   14 ++++++++
 2 files changed, 67 insertions(+), 23 deletions(-)


diff -Nru a/drivers/net/ppp_generic.c b/drivers/net/ppp_generic.c
--- a/drivers/net/ppp_generic.c	2004-07-20 16:36:44 -04:00
+++ b/drivers/net/ppp_generic.c	2004-07-20 16:36:44 -04:00
@@ -1008,6 +1008,51 @@
 	ppp_xmit_unlock(ppp);
 }
 
+static inline struct sk_buff *
+pad_compress_skb(struct ppp *ppp, struct sk_buff *skb)
+{
+	struct sk_buff *new_skb;
+	int len;
+	int new_skb_size = ppp->dev->mtu + ppp->xcomp->comp_skb_extra_space + ppp->dev->hard_header_len;
+	int compressor_skb_size = ppp->dev->mtu + ppp->xcomp->comp_skb_extra_space + PPP_HDRLEN;
+	new_skb = alloc_skb(new_skb_size, GFP_ATOMIC);
+	if (!new_skb) {
+		printk(KERN_ERR "PPP: no memory (comp pkt)\n");
+		return NULL;
+	}
+	if (ppp->dev->hard_header_len > PPP_HDRLEN)
+		skb_reserve(new_skb,
+			    ppp->dev->hard_header_len - PPP_HDRLEN);
+
+	/* compressor still expects A/C bytes in hdr */
+	len = ppp->xcomp->compress(ppp->xc_state, skb->data - 2,
+				   new_skb->data, skb->len + 2,
+				   compressor_skb_size);
+	if (len > 0 && (ppp->flags & SC_CCP_UP)) {
+		kfree_skb(skb);
+		skb = new_skb;
+		skb_put(skb, len);
+		skb_pull(skb, 2);	/* pull off A/C bytes */
+	} else if (len = 0) {
+		/* didn't compress, or CCP not up yet */
+		kfree_skb(new_skb);
+		new_skb = NULL;
+	} else {
+		/*
+		 * (len < 0)
+		 * MPPE requires that we do not send unencrypted
+		 * frames.  The compressor will return -1 if we
+		 * should drop the frame.  We cannot simply test
+		 * the compress_proto because MPPE and MPPC share
+		 * the same number.
+		 */
+		printk(KERN_ERR "ppp: compressor dropped pkt\n");
+		kfree_skb(new_skb);
+		new_skb = NULL;
+	}
+	return new_skb;
+}
+
 /*
  * Compress and send a frame.
  * The caller should have locked the xmit path,
@@ -1098,29 +1143,13 @@
 	/* try to do packet compression */
 	if ((ppp->xstate & SC_COMP_RUN) && ppp->xc_state != 0
 	    && proto != PPP_LCP && proto != PPP_CCP) {
-		new_skb = alloc_skb(ppp->dev->mtu + ppp->dev->hard_header_len,
-				    GFP_ATOMIC);
-		if (new_skb = 0) {
-			printk(KERN_ERR "PPP: no memory (comp pkt)\n");
+		if (!(ppp->flags & SC_CCP_UP) && ppp->xcomp->must_compress) {
+			printk(KERN_ERR "ppp: compression required but down - pkt dropped.\n");
 			goto drop;
 		}
-		if (ppp->dev->hard_header_len > PPP_HDRLEN)
-			skb_reserve(new_skb,
-				    ppp->dev->hard_header_len - PPP_HDRLEN);
-
-		/* compressor still expects A/C bytes in hdr */
-		len = ppp->xcomp->compress(ppp->xc_state, skb->data - 2,
-					   new_skb->data, skb->len + 2,
-					   ppp->dev->mtu + PPP_HDRLEN);
-		if (len > 0 && (ppp->flags & SC_CCP_UP)) {
-			kfree_skb(skb);
-			skb = new_skb;
-			skb_put(skb, len);
-			skb_pull(skb, 2);	/* pull off A/C bytes */
-		} else {
-			/* didn't compress, or CCP not up yet */
-			kfree_skb(new_skb);
-		}
+		skb = pad_compress_skb(ppp, skb);
+		if (!skb)
+			goto drop;
 	}
 
 	/*
@@ -1140,7 +1169,8 @@
 	return;
 
  drop:
-	kfree_skb(skb);
+	if (skb)
+		kfree_skb(skb);
 	++ppp->stats.tx_errors;
 }
 
@@ -1628,7 +1658,7 @@
 		goto err;
 
 	if (proto = PPP_COMP) {
-		ns = dev_alloc_skb(ppp->mru + PPP_HDRLEN);
+		ns = dev_alloc_skb(ppp->mru + ppp->rcomp->decomp_skb_extra_space + PPP_HDRLEN);
 		if (ns = 0) {
 			printk(KERN_ERR "ppp_decompress_frame: no memory\n");
 			goto err;
diff -Nru a/include/linux/ppp-comp.h b/include/linux/ppp-comp.h
--- a/include/linux/ppp-comp.h	2004-07-20 16:36:44 -04:00
+++ b/include/linux/ppp-comp.h	2004-07-20 16:36:44 -04:00
@@ -111,6 +111,13 @@
 
 	/* Used in locking compressor modules */
 	struct module *owner;
+	/* Extra skb space needed by the compressor algorithm */
+	unsigned int comp_skb_extra_space;
+	/* Extra skb space needed by the decompressor algorithm */
+	unsigned int decomp_skb_extra_space;
+	/* if must_compress is set, but ppp->flags != SC_CCP_UP
+	 * then drop the packet */
+	unsigned int must_compress;
 };
 
 /*
@@ -189,6 +196,13 @@
 #define DEFLATE_METHOD(x)	((x) & 0x0F)
 #define DEFLATE_MAKE_OPT(w)	((((w) - 8) << 4) + DEFLATE_METHOD_VAL)
 #define DEFLATE_CHK_SEQUENCE	0
+
+/*
+ * Definitions for MPPE.
+ */
+
+#define CI_MPPE                        18      /* config option for MPPE */
+#define CILEN_MPPE             6       /* length of config option */
 
 /*
  * Definitions for other, as yet unsupported, compression methods.

=================================

This BitKeeper patch contains the following changesets:
1.1849
## Wrapped with gzip_uu ##


M'XL( %R"_4   [58:7/;-A#]+/Z*33*36HX.7CI=>>S*;I*)G6B<>/JA[G @
M$A0YXE4 M.-6^>]=@*1$6Y:=HY$U% DN'AX6NXL'OX!+3MFX<4Z$<$[2F+N!
M]@+>I%R,&QZ-HHZ;QMAPD:;8T(T]96%VY\MNG&6T&X5)_KEM=GH:&LV(< .X
MIHR/&T;'6K>(VXR.&Q>GKR_/CB\T;3*!:4"2!?U(!4PFFDC9-8D\?D1$$*5)
M1S"2\)@*(L=>K4U7IJZ;^-<S!I;>ZZ^,OFX/5J[A&0:Q#>KIICWLVUH<)HOT
MB$:"=H+\SPK[K[LXMCXPA@@P-$8KO6\:AG8"1L<8VB/0[:X^Z)HZ&/VQ.1CK
M>ENW\0HU!QU5CH%7)K1U[3?X?Z<PU5R8S69C()X'?D@1&$< +ECN"D#$C%'.
M4]:"G%,0 8TA3"#+LO:")I2%;L=%!/P>/]Y?-I(H2ETB*-#/2!KX<@X\(R[%
MWCY:5,9AFG0]6GMJ 4D\(.!'9"%Q/)9F@!V75'#L&_HPG<X@Y."E-PG,<P&,
M_IV'C'HPOY6<Z]"P1Q.7W68"[YM(:='1WD'/&EC:;!,J6OL;/YJF$UT[?&)Q
MPL2-<J^,Y*YTHB36">IK-;+UE64,^^:*CEQ[J+MSZGN&WQN1!\/B44P,/0EK
M]FU[9?8Q#IYDZ+%0YE0WH4)B.>M%KE&T\6YE]7H]?>62OH5/(SHB+D;TX&&*
MCX+6.1J6/AJJI-W9Y>DD_L$I:!G)HZ5_%(<N2Q<8K1*TEMM/3*9O8K;K!L+W
M>]9PI'+='M[-]/[8MA_-])X%;=/Z*;E^3I94I7+J/Y"D";TIDUAF1;$<'Z#-
M;M07PWRV>V6^(V?>&N@IL'L:%T2$F,D)1C&M>/&E,\]]'_9Q23RG8NE@V=@K
M+7!\V,=+:ZL+&C6U?[7&_7:<H 0XT!IA(B"B27E7MCL\_(?"1-6W0X]>MP]C
MD<.KXOFSI- ^E%=EJZJ8HRI89:*Z!(1Y3D")1YFS&6'CY1\<"*NU\^;DXNST
M/2*7O!%)%5?EG/I<6O#Z]YES_.G#^=MI4S+Q8>]9:= $=% C8\ANN??N].*]
M<WIQ <_5;I"D$-,X9;>P)VE MA3-J^2YA&@P*G*6P/O+LS-\_%* [IP^'-88
M-[&[I(:.H.R:5E1;V-P _.Q&:=1#K0KK='=KT<N%V$4X<:245=P..Y.L?0+
MRN5F%7@,]KM:0\),MCPL^^^5C8Z,0_094D(:1! <UE3D)+N2;/&F-)*8KVHV
M#ZQRY?;"%SJ\?%EZ2VYG'%["QZF#^Y=S.6L6*[+T&:5%F.,B'10N0^:;V%4^
MS'(A#5HRBIN;QB@J6LWF@721;,!<]VLND;[X C3"(E#QPHJK%X-C%R_TDE\V
M =L"=*_<8)-40)[!+2HI"5'C60649+&)R"I BJ$*<+S ?C'FKSAD\7@^FYU6
M6S:JAX (N*&XF:L1.<6]/T_*39MZ11>?D9CR#L"GVNZ./&]D%)0!VC;D_&YH
MT8,':1YYA7:0DD A(, ?V)\D:J0PSB+4"Y2+HDM=.3@92U%ZS*E+9/54E*4J
MP9LI8A-&-WTX(D.2QW/*.JJU^U">80R,Z]0ELPPE"Z9:E6E?ZV&MRLEUB'S!
M##DQL+R"C576T&TPL:?*_EW!)P.SGAQQSL6ZZA;!\<0DI+K:*"^484J/M>6,
MJMEUBJE):@,P!I*;:8&UCO&M2E]4]W+FBK\J[<AED9924,'9%A@2#7_-(M]*
MN_O9=&+T+4/9%K_H3XX#8]%Q-B54^2%FZXK,"I<4JO31FHPC2/VR2Y4]+5]^
M3",J]9+S(PS!.>FD;/$HGJ4/47U9O0$>35 "VX5<Z7VC6C'LGW4PJ9TIL(YO
MRY6;(,0CGU0A\H!8)']"L4:XY2M,2P@725H["J1X8340I70*<7Q/Z>SRW'<)
M'<."@=JS3N^>?13?[8,*3@Z/)BD+11"K^I$G'">"AI66N!^%!U^!OCE5/8[_
M<)P7(V!JW:D,\MS%J6BIA*^5EF>336W1RLJ8;,IO<7S;'OH.]@$Z;F2@XZXT
MW#H0XX3Z81+*HQM71T99ACN:1+G27GCR)87I6T=5YQT?8UC\*OF0^.$"4G46
M7.-)M T6IO0V7!_6&+B3+40@U?1=- 19_T_"#:B[Y'D\F5/#-JEG:_\!KG(1
%>PH1    
 
