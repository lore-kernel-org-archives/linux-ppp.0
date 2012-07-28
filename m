From: Paul Mackerras <paulus@samba.org>
Date: Sat, 28 Jul 2012 10:07:01 +0000
Subject: Re: DCD and EOF
Message-Id: <20120728100701.GA23552@bloggs.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAK9rZUB745VY28ptj29dNDCXVGg0CAF3H0_iDZoTkbpNwQmA9A@mail.gmail.com>
In-Reply-To: <CAK9rZUB745VY28ptj29dNDCXVGg0CAF3H0_iDZoTkbpNwQmA9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Fri, Jul 27, 2012 at 07:49:32PM -0300, Edgard Lima wrote:
> So where is this EOF check in the PPPD code?

The read() calls in read_packet() (pppd/sys-linux.c) will return 0
on EOF.

> How could I be sure the serial device driver answer with EOF when DCD
> line is up? Could you please point out this on serial driver code?

In the Linux kernel, ppp_asynctty_hangup() should get called when DCD
is deasserted.  That should cause a 0-length skbuff to get queued up
in the receive queue, which will cause the read() in pppd to return 0,
which is the normal EOF indication.

Are you observing that pppd is not noticing when DCD gets deasserted?
If so, what kernel version are you using (I presume it's Linux since
you're asking on the linux-ppp mailing list), and what version of pppd?

Paul.
