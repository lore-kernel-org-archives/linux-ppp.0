From: Matt Domsch <Matt_Domsch@dell.com>
Date: Wed, 13 Oct 2004 02:49:17 +0000
Subject: Re: [pptp-devel] ppp_mppe status for 2.6.x kernels
Message-Id: <20041013024917.GA16659@lists.us.dell.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20041012220528.GA7876@lists.us.dell.com>
In-Reply-To: <20041012220528.GA7876@lists.us.dell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, Oct 12, 2004 at 05:05:28PM -0500, Matt Domsch wrote:
> Quick update on the state of ppp_mppe in kernel 2.6.x.  Works for me,
> but more testers are needed, please test and post your results to
> these lists.
>
> BK:
> http://mdomsch.bkbits.net/linux-2.6-mppe

It would help if I actually freed the newly allocated sha_pad
struct...  I pushed this into the above BK tree.

Oleg, Frank, I'm going to need to get a "Signed-of-by:" line for each
of you for final patch submission.  See
linux/Documentation/SubmittingPatches for the format and what you're
agreeing to.

Thanks,
Matt

-- 
Matt Domsch
Sr. Software Engineer, Lead Engineer
Dell Linux Solutions linux.dell.com & www.dell.com/linux
Linux on Dell mailing lists @ http://lists.us.dell.com

ChangeSet@1.2167, 2004-10-12 18:00:10-05:00, Matt_Domsch@dell.com
  ppp_mppe: free sha_pad properly
  
  Signed-off-by: Matt Domsch <Matt_Domsch@dell.com>


 ppp_mppe.c |    3 +++
 1 files changed, 3 insertions


diff -Nru a/drivers/net/ppp_mppe.c b/drivers/net/ppp_mppe.c
--- a/drivers/net/ppp_mppe.c	2004-10-12 21:44:58 -05:00
+++ b/drivers/net/ppp_mppe.c	2004-10-12 21:44:58 -05:00
@@ -708,6 +708,8 @@
 
 	if (answer = 0)
 		printk(KERN_INFO "PPP MPPE Compression module registered\n");
+	else
+		kfree(sha_pad);
 
 	return answer;
 }
@@ -715,6 +717,7 @@
 static void __exit ppp_mppe_cleanup(void)
 {
 	ppp_unregister_compressor(&ppp_mppe);
+	kfree(sha_pad);
 }
 
 module_init(ppp_mppe_init);

