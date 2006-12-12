From: Yan Burman <burman.yan@gmail.com>
Date: Tue, 12 Dec 2006 19:13:08 +0000
Subject: [PATCH 2.6.19] ppp: replace kmalloc+memset with kzalloc
Message-Id: <1165950788.10231.8.camel@localhost>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-ppp@vger.kernel.org, trivial@kernel.org

Replace kmalloc+memset with kzalloc

Signed-off-by: Yan Burman <burman.yan@gmail.com>

diff -rubp linux-2.6.19-rc5_orig/drivers/net/ppp_async.c linux-2.6.19-rc5_kzalloc/drivers/net/ppp_async.c
--- linux-2.6.19-rc5_orig/drivers/net/ppp_async.c	2006-11-09 12:16:21.000000000 +0200
+++ linux-2.6.19-rc5_kzalloc/drivers/net/ppp_async.c	2006-11-11 22:44:04.000000000 +0200
@@ -159,12 +159,11 @@ ppp_asynctty_open(struct tty_struct *tty
 	int err;
 
 	err = -ENOMEM;
-	ap = kmalloc(sizeof(*ap), GFP_KERNEL);
+	ap = kzalloc(sizeof(*ap), GFP_KERNEL);
 	if (ap = 0)
 		goto out;
 
 	/* initialize the asyncppp structure */
-	memset(ap, 0, sizeof(*ap));
 	ap->tty = tty;
 	ap->mru = PPP_MRU;
 	spin_lock_init(&ap->xmit_lock);
diff -rubp linux-2.6.19-rc5_orig/drivers/net/ppp_deflate.c linux-2.6.19-rc5_kzalloc/drivers/net/ppp_deflate.c
--- linux-2.6.19-rc5_orig/drivers/net/ppp_deflate.c	2006-11-09 12:16:21.000000000 +0200
+++ linux-2.6.19-rc5_kzalloc/drivers/net/ppp_deflate.c	2006-11-11 22:44:04.000000000 +0200
@@ -121,12 +121,11 @@ static void *z_comp_alloc(unsigned char 
 	if (w_size < DEFLATE_MIN_SIZE || w_size > DEFLATE_MAX_SIZE)
 		return NULL;
 
-	state = (struct ppp_deflate_state *) kmalloc(sizeof(*state),
-							GFP_KERNEL);
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (state = NULL)
 		return NULL;
 
-	memset (state, 0, sizeof (struct ppp_deflate_state));
 	state->strm.next_in   = NULL;
 	state->w_size         = w_size;
 	state->strm.workspace = vmalloc(zlib_deflate_workspacesize());
@@ -341,11 +340,10 @@ static void *z_decomp_alloc(unsigned cha
 	if (w_size < DEFLATE_MIN_SIZE || w_size > DEFLATE_MAX_SIZE)
 		return NULL;
 
-	state = (struct ppp_deflate_state *) kmalloc(sizeof(*state), GFP_KERNEL);
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (state = NULL)
 		return NULL;
 
-	memset (state, 0, sizeof (struct ppp_deflate_state));
 	state->w_size         = w_size;
 	state->strm.next_out  = NULL;
 	state->strm.workspace = kmalloc(zlib_inflate_workspacesize(),
diff -rubp linux-2.6.19-rc5_orig/drivers/net/ppp_mppe.c linux-2.6.19-rc5_kzalloc/drivers/net/ppp_mppe.c
--- linux-2.6.19-rc5_orig/drivers/net/ppp_mppe.c	2006-11-09 12:16:21.000000000 +0200
+++ linux-2.6.19-rc5_kzalloc/drivers/net/ppp_mppe.c	2006-11-11 22:44:04.000000000 +0200
@@ -200,12 +200,10 @@ static void *mppe_alloc(unsigned char *o
 	    || options[0] != CI_MPPE || options[1] != CILEN_MPPE)
 		goto out;
 
-	state = (struct ppp_mppe_state *) kmalloc(sizeof(*state), GFP_KERNEL);
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (state = NULL)
 		goto out;
 
-	memset(state, 0, sizeof(*state));
-
 	state->arc4 = crypto_alloc_blkcipher("ecb(arc4)", 0, CRYPTO_ALG_ASYNC);
 	if (IS_ERR(state->arc4)) {
 		state->arc4 = NULL;
diff -rubp linux-2.6.19-rc5_orig/drivers/net/ppp_synctty.c linux-2.6.19-rc5_kzalloc/drivers/net/ppp_synctty.c
--- linux-2.6.19-rc5_orig/drivers/net/ppp_synctty.c	2006-11-09 12:16:21.000000000 +0200
+++ linux-2.6.19-rc5_kzalloc/drivers/net/ppp_synctty.c	2006-11-11 22:44:04.000000000 +0200
@@ -207,13 +207,12 @@ ppp_sync_open(struct tty_struct *tty)
 	struct syncppp *ap;
 	int err;
 
-	ap = kmalloc(sizeof(*ap), GFP_KERNEL);
+	ap = kzalloc(sizeof(*ap), GFP_KERNEL);
 	err = -ENOMEM;
 	if (ap = 0)
 		goto out;
 
 	/* initialize the syncppp structure */
-	memset(ap, 0, sizeof(*ap));
 	ap->tty = tty;
 	ap->mru = PPP_MRU;
 	spin_lock_init(&ap->xmit_lock);



