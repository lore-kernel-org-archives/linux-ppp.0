From: Guy Rouillier <guy-rouillier@speakeasy.net>
Date: Thu, 18 Nov 2004 22:57:58 +0000
Subject: PPP 2.4.3 still isn't 64-bit conformant
Message-Id: <20041118175758.00004de4@ma1033>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I noticed on the pptpclient site that 2.4.3 has been released, so I
downloaded it to see if the changes we discussed back in June to make it
work with 64-bit OSes had been incorporated.  Unfortunately, that does
not seem to be the case; the new release still has assumptions in
SHA1.c/.h for a 32-bit data types.  What more do I have to do to get the
size-neutral data types permanently into this code?  Thanks.

-- 
Guy Rouillier
