From: James Cameron <james.cameron@hp.com>
Date: Sat, 25 Mar 2006 06:36:59 +0000
Subject: Re: killing a pptp tunnel with a single ping
Message-Id: <20060325063659.GA3071@fax.sno.cpqcorp.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <20060324232128.GA23810@wonderland.linux.it>
In-Reply-To: <20060324232128.GA23810@wonderland.linux.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I've tried but failed to reproduce this.  Could you obtain and post the
pppd debug dump log showing the negotiation of the tunnel?  That will
help to narrow the scope.

I've also done a test that excludes pptp, by using pppd over ssh, such
as:

# echo "test test test *" >> /etc/ppp/chap-secrets
# ssh peer 'echo "test test test *" >> /etc/ppp/chap-secrets'
# pppd noauth silent require-mppe name test remotename test debug dump
  logfd 2 nodetach pty "ssh -t -e none peer pppd name test
  require-mschap-v2 require-mppe 10.0.5.1:10.0.5.2"

But the ping as described did nothing wrong.  2.6.16 kernel.org.

Then again, what's the -M dont?  My ping (Debian) doesn't have that.

-- 
James Cameron
