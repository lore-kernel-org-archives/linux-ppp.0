From: Christopher Fowler <cfowler@outpostsentinel.com>
Date: Wed, 09 Mar 2005 21:31:13 +0000
Subject: Blowfish encryption
Message-Id: <1110403872.18073.330.camel@linux.linxdev.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello,

I've been thinking about encryption in pppd.  By reading my emails
you've probably have an idea of what we do with pppd.  Since I don't use
pppd to attach a windows desktop to a Linux server I was thinking about
maybe an implementation of Blowfish type encryption between two pppd
processes.  There could be a command line argument that runs on
encryption and the two processes could determine in the LCP phase that
they are to encrypt all data between them.    This is mainly for those
individuals who think that the phone company will tap their line and see
their data.  Not very useful in tunnels since programs like vtun do the
encryption for pppd.  

Is this something that might be feasible?  I'm not looking to add
certificate based encryption like SSL but encryption like SSH, Vtun and
others.  Would a windows connection croak if it dialed into my box and
my box wanted to use encryption?  Would the windows ppp process be smart
enough to reject that request?  Has anything like this been tried yet?

Thanks,
Chris


