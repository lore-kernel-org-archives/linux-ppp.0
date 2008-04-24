From: James Cameron <james.cameron@hp.com>
Date: Thu, 24 Apr 2008 03:50:28 +0000
Subject: Re: question for ip packet
Message-Id: <20080424035028.GE4395@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200804241041005531107@fiberhome.com.cn>
In-Reply-To: <200804241041005531107@fiberhome.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Apr 24, 2008 at 10:41:00AM +0800, ?????? wrote:
> 1. after pppd has negotiated the link, what it tell information to the
> kernel network ppp code, which make kernel transmit IP packets
> directly?

Briefly, in function tty_establish_ppp() in sys-linux.c, an ioctl(2)
syscall sets the TTY into PPP discipline (N_PPP).  Once the interface is
up, the kernel transmits network packets through the PPP link.

> 2. where to receive the IP packets from ppp kernel?  how to know the
> ip packet come from not other device but PPP?

I don't understand.  It is very clear the packets are from the PPP link
because they can be captured from the new network interface.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
