From: Paul Mackerras <paulus@samba.org>
Date: Tue, 04 May 2004 23:13:14 +0000
Subject: Re: ppp MULTILINK issue / problem
Message-Id: <16536.9098.18883.602260@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <BCBD226C.57C%tchen@on-go.com>
In-Reply-To: <BCBD226C.57C%tchen@on-go.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Thomas Chen writes:

> in the userland pppd main loop, it calls get_input
> and in get_input, if the packet length is 0, it assume the link
> is bad and print out "Modem Hangup"

The 0 return value from get_input is an "end of file" indication.  The
serial driver should return an EOF if it detects that the CD signal
has dropped.  Make sure you use the "modem" option to pppd and that
you have CD and DTR hooked up correctly to the modem.  It is possible
to get the serial driver to send a SIGHUP but pppd doesn't rely on
that (because it isn't possible to get the tty device to be pppd's
controlling terminal in all cases).

> should kernel ppp automaitcally disassociate the link or wait for
> the userland PPPD to call ioctl to do that ???

When pppd gets the 0 return value from get_input, it will do the ioctl
to disconnect the link from the bundle.

Paul.
