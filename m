From: James Cameron <james.cameron@hp.com>
Date: Sun, 16 May 2004 23:29:33 +0000
Subject: Re: has anyone gotten PPP and MPPE working with kernel 2.6.x yet??
Message-Id: <20040516232933.GD27992@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1084670191.4575.151.camel@bast.picotech.net>
In-Reply-To: <1084670191.4575.151.camel@bast.picotech.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Sat, May 15, 2004 at 07:16:31PM -0600, Jeffrey D. Means wrote:
> pppd options in effect: [...]
> plugin radius.so # (from /etc/ppp/options.pptpd) [...]
> sent [CHAP Success id=0xf1 "S'686CD047B851E473605718551CC73DA16E58FA"]
> MPPE required, but keys are not available. Possible plugin problem?
> sent [LCP TermReq id=0x4 "MPPE required but not available"]
> rcvd [LCP TermAck id=0x4 "MPPE required but not available"]

The radius plugin did not provide key material during the
authentication, and so MPPE cannot be started.

> In my mind this looks like a bug with the 2.6 kernel or could it be a
> bug with pppd??

In my mind it looks to be a bug with the radius plugin, or a
misconfiguration of the radius pppd options leading to the result
observed.  I don't see any evidence of kernel being the cause, yet.

(Perhaps it worked before but didn't after upgrade of only the kernel?
If you upgraded pppd or the radius plugin, I'd suspect it more than the
kernel.)

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
