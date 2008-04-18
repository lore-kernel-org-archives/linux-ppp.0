From: bfc <chappaquasuite@yahoo.com>
Date: Fri, 18 Apr 2008 18:41:14 +0000
Subject: Re: modem session behavior
Message-Id: <16764006.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <16169308.post@talk.nabble.com>
In-Reply-To: <16169308.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


I should follow this up for search purposes.  This was Redhat bug 440121,
a problem with the serial driver on SMP machines.  That explains all the
troubles I posted about.  I'm sure it affects other distros, too, but
I suspect not many people are using higher end machines for PPP?


James Cameron-2 wrote:
> 
> ATH hangs up.  Perhaps the loss of CTS and DSR from the modem causes the
> kernel and your terminal emulator to see nothing more.
> 
> Either configure the system to ignore the loss of CTS and DSR, or
> configure the modem not to drop CTS and DSR during a hangup.  Then try
> again.
> 
> I've no idea why you want to see anything more after ATH though.
> 
> -- 
> James Cameron
> http://ftp.hp.com.au/sigs/jc/
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 

-- 
View this message in context: http://www.nabble.com/modem-session-behavior-tp16169308p16764006.html
Sent from the linux-ppp mailing list archive at Nabble.com.

