From: jfj <jfj@freemail.gr>
Date: Mon, 18 Sep 2006 19:39:11 +0000
Subject: Re: pppd security
Message-Id: <450EF5DF.3050802@freemail.gr>
List-Id: <linux-ppp.vger.kernel.org>
References: <450EBBCE.5030204@freemail.gr>
In-Reply-To: <450EBBCE.5030204@freemail.gr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


James Carlson wrote:

> No more or less so than it's possible to do the same via an Ethernet
> adapter.


 > /dev/ppp provides a datalink layer interface to the system. The
 > security on such interfaces (in general) ought to be the same.

So it is possible to dump UDP packets to /dev/ppp (and /dev/eth (and PPP
packets to /dev/tty)). More or less...

If I understand correctly, the only program that is supposed to use
/dev/ppp is pppd, to establish the connection. After that the packets
go there through the internal TCP/IP stack. And noone else should
be messing with /dev/ppp normally.

If so, does it sound like a feasible idea to hack the kernel to forbid
opening the /dev/ppp device to other processes, once pppd is working?

Another idea is to rename /dev/ppp to /dev/secretppp and hack pppd
to use that instead?

Other ideas to lock access to /dev/ppp?

Thanks,

jerald

