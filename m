From: Oleg Makarenko <mole@quadra.ru>
Date: Sun, 05 Sep 2004 18:23:15 +0000
Subject: Re: [pptp-devel] Re: [2/2]: ppp_mppe inclusion
Message-Id: <413B5993.604@quadra.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------030801030407090005020108"
List-Id: <linux-ppp.vger.kernel.org>
References: <20040720204723.GC27576@lists.us.dell.com>
In-Reply-To: <20040720204723.GC27576@lists.us.dell.com>
To: linux-ppp@vger.kernel.org

This is a multi-part message in MIME format.
--------------030801030407090005020108
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Matt

Matt Domsch wrote:

>On Mon, Aug 30, 2004 at 05:42:05PM -0500, Matt Domsch wrote:
>  
>
>>On Fri, Jul 30, 2004 at 11:33:09PM +0400, Oleg Makarenko wrote:
>>    
>>
>>>2.  For some reason you can not use non GFP_KERNEL memory and scatter 
>>>lists or at least mix them in crypto_digest().  That is why sha_pad is 
>>>now in struct state {}.
>>>      
>>>
>
>Can you describe what happens when you do?
>  
>

please try the attached patch for tcrypt.c to see what is going on 
yourself.  modrpobe the resulting module with mode=2 parameter to test 
sha1 and see how it fails the tests.

For mode=0 (or without any parameter) you should get kernel panic.

=oleg







--------------030801030407090005020108
Content-Type: text/x-patch;
 name="tcrypt.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="tcrypt.diff"

--- tcrypt.c.orig	2004-08-14 09:37:38.000000000 +0400
+++ tcrypt.c	2004-09-05 21:11:19.000000000 +0400
@@ -58,6 +58,8 @@
 static char *xbuf;
 static char *tvmem;
 
+static char tvmem_buf[TVMEMSIZE];
+
 static char *check[] = {
 	"des", "md5", "des3_ede", "rot13", "sha1", "sha256", "blowfish",
 	"twofish", "serpent", "sha384", "sha512", "md4", "aes", "cast6", 
@@ -820,7 +822,8 @@
 static int __init
 init(void)
 {
-	tvmem = kmalloc(TVMEMSIZE, GFP_KERNEL);
+	tvmem = &tvmem_buf[0];
+
 	if (tvmem == NULL)
 		return -ENOMEM;
 
@@ -833,7 +836,6 @@
 	do_test();
 
 	kfree(xbuf);
-	kfree(tvmem);
 	return 0;
 }
 

--------------030801030407090005020108--
