From: Paul Mackerras <paulus@samba.org>
Date: Thu, 25 Nov 2004 21:27:39 +0000
Subject: Re: some change in ppp 2.4.3: tcflush failed: Bad file descriptor
Message-Id: <16806.20043.227563.455844@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200411231157.43347.arekm@pld-linux.org>
In-Reply-To: <200411231157.43347.arekm@pld-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Arkadiusz Miskiewicz writes:

> Shouldn't pppd kill old pty "command" before running new one?

pppd will close its side of the pty device, leading to the program
running on the other side (the script specified in the pty option)
getting an end-of-file on its standard input.  It should clean up and
exit when it gets that.

Alternatively you can use a disconnect script to kill it, if your pty
command is too lame to exit on EOF.

Paul.

