From: Paul Mackerras <paulus@samba.org>
Date: Fri, 26 Nov 2004 00:51:02 +0000
Subject: Re: some change in ppp 2.4.3: tcflush failed: Bad file descriptor
Message-Id: <16806.32246.147129.888448@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200411231157.43347.arekm@pld-linux.org>
In-Reply-To: <200411231157.43347.arekm@pld-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Arkadiusz Miskiewicz writes:

> Looking into pppoa code I see that read() of 0 is handled (exit(0) in such 
> case). Did anything change between 2.4.2 and 2.4.3 in this area? 2.4.2 causes 
> that pppoa terminates properly while 2.4.3 not.

Interesting.  2.4.3 has some changes to make sure that we don't leak
file descriptors or leave them open when we shouldn't, but maybe
there's still a bug.  Can you send me the whole strace log?

> isn't tcflush failing a reason for a pppoa to not terminate?

Nope.

Paul.
