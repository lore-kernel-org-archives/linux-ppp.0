From: "Matthew N. Dodd" <mdodd@patton.com>
Date: Tue, 09 Nov 2004 17:12:46 +0000
Subject: Multilink and ppp_input_error().
Message-Id: <00b701c4c67f$554c8180$67160a0a@ATLANTIC>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----=_NextPart_000_00B8_01C4C655.6C767980"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org

This is a multi-part message in MIME format.

------=_NextPart_000_00B8_01C4C655.6C767980
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Has anyone else noticed that drivers/net/ppp_generic.c:ppp_input_error()
is effectively a NOP?  pppd/main.c:get_input() treats a zero length
packet as a hangup indication but if you trace out the call to
ppp_do_recv() in ppp_input_error() the zero length frame is never sent
to the file descriptor.  Further, calling an input function for the PPP
device isn't useful as the intent is to deliver the error to a specific
PPP channel.

I'm using the attached patch.

Comments?

--
Matthew N. Dodd <mdodd@patton.com>
Software Engineer, Patton Electronics
7622 Rickenbacker Dr., Gaithersburg,  MD 20879
(301) 975-1000x184

------=_NextPart_000_00B8_01C4C655.6C767980
Content-Type: application/octet-stream;
	name="ppp.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="ppp.patch"

Index: ppp_generic.c=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
RCS file: /home/cvs/linux/drivers/net/ppp_generic.c,v=0A=
retrieving revision 1.23.2.6=0A=
diff -u -u -1 -5 -r1.23.2.6 ppp_generic.c=0A=
--- ppp_generic.c	13 Aug 2003 17:19:19 -0000	1.23.2.6=0A=
+++ ppp_generic.c	9 Nov 2004 17:08:49 -0000=0A=
@@ -1361,31 +1361,38 @@=0A=
 void=0A=
 ppp_input_error(struct ppp_channel *chan, int code)=0A=
 {=0A=
 	struct channel *pch =3D chan->ppp;=0A=
 	struct sk_buff *skb;=0A=
 =0A=
 	if (pch =3D=3D 0)=0A=
 		return;=0A=
 =0A=
 	read_lock_bh(&pch->upl);=0A=
 	if (pch->ppp !=3D 0) {=0A=
 		skb =3D alloc_skb(0, GFP_ATOMIC);=0A=
 		if (skb !=3D 0) {=0A=
 			skb->len =3D 0;		/* probably unnecessary */=0A=
 			skb->cb[0] =3D code;=0A=
-			ppp_do_recv(pch->ppp, skb, pch);=0A=
+=0A=
+			/* Queue to channel. */=0A=
+			skb_queue_tail(&pch->file.rq, skb);=0A=
+			/* drop old frames if queue too long */=0A=
+			while (pch->file.rq.qlen > PPP_MAX_RQLEN=0A=
+				&& (skb =3D skb_dequeue(&pch->file.rq)) !=3D 0)=0A=
+				kfree_skb(skb);=0A=
+			wake_up_interruptible(&pch->file.rwait);=0A=
 		}=0A=
 	}=0A=
 	read_unlock_bh(&pch->upl);=0A=
 }=0A=
 =0A=
 /*=0A=
  * We come in here to process a received frame.=0A=
  * The receive side of the ppp unit is locked.=0A=
  */=0A=
 static void=0A=
 ppp_receive_frame(struct ppp *ppp, struct sk_buff *skb, struct channel =
*pch)=0A=
 {=0A=
 	if (skb->len >=3D 2) {=0A=
 #ifdef CONFIG_PPP_MULTILINK=0A=
 		/* XXX do channel-level decompression here */=0A=

------=_NextPart_000_00B8_01C4C655.6C767980--

