From: Matt Domsch <Matt_Domsch@dell.com>
Date: Mon, 30 Aug 2004 22:42:05 +0000
Subject: Re: [pptp-devel] Re: [2/2]: ppp_mppe inclusion
Message-Id: <20040830224205.GA31278@lists.us.dell.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040720204723.GC27576@lists.us.dell.com>
In-Reply-To: <20040720204723.GC27576@lists.us.dell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Fri, Jul 30, 2004 at 11:33:09PM +0400, Oleg Makarenko wrote:
> Great work, Matt. Thank you for your patches. Any chances to see them 
> integrated in 2.6 any time soon?

That'll depend on how many people are testing it I suppose. :-)  I've
just now gotten back to this, sorry for the delay.
 
> The only problem is that they do not work for me and never did :) I get 
> kernel panic with your patches and wonder how others don't get the same 
> result?
> 
> Please find attached somewhat (I hope) improved patches that finaly do 
> work for me

Thanks much.  I've merged these into my bk tree at
http://mdomsch.bkbits.net/linux-2.6-mppe

along with this simple patch which makes use of setup_sg() rather than
hand-coding it four times.

ChangeSet@1.1803.13.4, 2004-08-30 15:29:05-04:00, Matt_Domsch@dell.com
  ppp_mppe: use setup_sg() in get_hew_key_from_sha(), bump version


 ppp_mppe.c |   27 +++++----------------------
 1 files changed, 5 insertions(+), 22 deletions(-)


diff -Nru a/drivers/net/ppp_mppe.c b/drivers/net/ppp_mppe.c
--- a/drivers/net/ppp_mppe.c	2004-08-30 17:37:29 -04:00
+++ b/drivers/net/ppp_mppe.c	2004-08-30 17:37:29 -04:00
@@ -61,7 +61,7 @@
 MODULE_DESCRIPTION("Point-to-Point Protocol Microsoft Point-to-Point Encryption support");
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_ALIAS("ppp-compress-" __stringify(CI_MPPE));
-MODULE_VERSION("1.0.0");
+MODULE_VERSION("1.0.1");
 
 static void
 setup_sg(struct scatterlist *sg, const void *address, unsigned int length)
@@ -122,28 +122,11 @@
 static void get_new_key_from_sha(struct ppp_mppe_state * state, unsigned char *InterimKey)
 {
 	struct scatterlist sg[4];
-	char *p;
-	
 
-	p = state->master_key;
-	sg[0].page = virt_to_page(p);
-	sg[0].offset = offset_in_page(p);
-	sg[0].length = state->keylen;
-
-	p = state->SHApad1;
-	sg[1].page = virt_to_page(p);
-	sg[1].offset = offset_in_page(p);
-	sg[1].length = sizeof(state->SHApad1);
-
-	p = state->session_key;
-	sg[2].page = virt_to_page(p);
-	sg[2].offset = offset_in_page(p);
-	sg[2].length = state->keylen;
-
-	p = state->SHApad2;
-	sg[3].page = virt_to_page(p);
-	sg[3].offset = offset_in_page(p);
-	sg[3].length = sizeof(state->SHApad2);
+	setup_sg(&sg[0], state->master_key, state->keylen);
+	setup_sg(&sg[1], state->SHApad1, sizeof(state->SHApad1));
+	setup_sg(&sg[2], state->session_key, state->keylen);
+	setup_sg(&sg[3], state->SHApad2, sizeof(state->SHApad2));
 
 	crypto_digest_digest (state->sha1, sg, 4, state->sha1_digest);
 


> 2.  For some reason you can not use non GFP_KERNEL memory and scatter 
> lists or at least mix them in crypto_digest().  That is why sha_pad is 
> now in struct state {}.

OK for now I suppose.  I'll ask the crypto folks what's up with that.
I obviously prefer to have that stuff in a .rodata section allocated
once, rather than "waste" 80 bytes per connection.

Thanks for being patient with me and for your continued testing.

-- 
Matt Domsch
Sr. Software Engineer, Lead Engineer
Dell Linux Solutions linux.dell.com & www.dell.com/linux
Linux on Dell mailing lists @ http://lists.us.dell.com
