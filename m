From: James Carlson <carlson@workingcode.com>
Date: Tue, 13 Apr 2004 13:30:18 +0000
Subject: Re: PPP connect hangs at "getlogname (AUTO_PPP), read:"
Message-Id: <16507.60266.663808.1577@c-24-147-210-59.ne.client2.attbi.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Robert P. J. Day writes:
> 04/13 08:51:28 yS3   tio_set_flow_control( HARD )
> 04/13 08:51:28 yS3   print welcome banner (/etc/issue)
> 04/13 08:51:28 yS3   getlogname (AUTO_PPP), read:

At this point, mgetty is waiting to hear from the peer.  If it appears
to be hung, then this means one or more of the following:

	- serial cable is bad

	- peer isn't running PPP

	- serial configuration is wrong somewhere (incorrect bit rate,
          number of bits per character, or parity)

Since you were able to talk to the modem (getting a "CONNECT" string),
I'd guess that the first option isn't the problem.  The other two are
possibilities.

You might want to start slow by disabling mgetty and using cu or
miniterm to talk to the serial port.  Once you get get bytes to go
back and forth between the peers (which is at the root of the current
problem), then mgetty should do its job and start up pppd.

> /AutoPPP/ -     a_ppp   /usr/sbin/pppd -chap -pap debug

It's not getting that far -- mgetty is not getting anything at all
from the peer.

-- 
James Carlson                                  <carlson@workingcode.com>
