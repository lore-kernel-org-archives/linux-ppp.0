From: Chris Fowler <cfowler@outpostsentinel.com>
Date: Fri, 18 Apr 2008 18:56:39 +0000
Subject: Re: modem session behavior
Message-Id: <1208544999.192.4.camel@D8GRPY71>
List-Id: <linux-ppp.vger.kernel.org>
References: <16169308.post@talk.nabble.com>
In-Reply-To: <16169308.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I'm running ppp on a dual core P4.  I'm interested to know what problems
you are seeing.  I run ppp in demand mode.  We use it heavily.  I was
running it on FC2 with 2.6.10 but now I've switched to CentOS 5
2.6.18.... kernel.

In demand mode we have a program that is ran as if-down and if-up.  This
is because another device can call in and gain the same address as the
interface waiting.  The program downs the other interface and will up a
down interface when ppp dies.  It is hard to explain but it makes 2
devices work in demand mode with each other.


On Fri, 2008-04-18 at 11:41 -0700, bfc wrote:
> I should follow this up for search purposes.  This was Redhat bug 440121,
> a problem with the serial driver on SMP machines.  That explains all the
> troubles I posted about.  I'm sure it affects other distros, too, but
> I suspect not many people are using higher end machines for PPP?
> 
> 
> James Cameron-2 wrote:
> > 
> > ATH hangs up.  Perhaps the loss of CTS and DSR from the modem causes the
> > kernel and your terminal emulator to see nothing more.
> > 
> > Either configure the system to ignore the loss of CTS and DSR, or
> > configure the modem not to drop CTS and DSR during a hangup.  Then try
> > again.
> > 
> > I've no idea why you want to see anything more after ATH though.
> > 
> > -- 
> > James Cameron
> > http://ftp.hp.com.au/sigs/jc/
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > 
> > 
> 

