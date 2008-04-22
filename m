From: bfc <chappaquasuite@yahoo.com>
Date: Tue, 22 Apr 2008 16:08:12 +0000
Subject: Re: modem session behavior
Message-Id: <16824945.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <16169308.post@talk.nabble.com>
In-Reply-To: <16169308.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


The problem was that sometimes the serial driver wouldn't send the data
loaded into
the FIFO.  Conversations with the modem would hang (and chat would
eventually time
out) -- or the connection would be made between modems, but I'd get a LCP
timeout
error -- from the same cause.

You may only get bit by this with particular UART hardware -- ours was
detected
(correctly) as a 16550A.  You should be able to find out what yours is by
either
grep 'serial' from /var/log/messages, or setserial -a /dev/ttyS0.  The
problem
did not occur on another machine with a NS16550A detected.

The problem kernel we had was 2.6.18 (and various minor versions up to
2.6.18-89).



cfowler-2 wrote:
> 
> I'm running ppp on a dual core P4.  I'm interested to know what problems
> you are seeing.  I run ppp in demand mode.  We use it heavily.  I was
> running it on FC2 with 2.6.10 but now I've switched to CentOS 5
> 2.6.18.... kernel.
> 
> In demand mode we have a program that is ran as if-down and if-up.  This
> is because another device can call in and gain the same address as the
> interface waiting.  The program downs the other interface and will up a
> down interface when ppp dies.  It is hard to explain but it makes 2
> devices work in demand mode with each other.
> 
> 
> On Fri, 2008-04-18 at 11:41 -0700, bfc wrote:
>> I should follow this up for search purposes.  This was Redhat bug 440121,
>> a problem with the serial driver on SMP machines.  That explains all the
>> troubles I posted about.  I'm sure it affects other distros, too, but
>> I suspect not many people are using higher end machines for PPP?
>> 
>> 
>> James Cameron-2 wrote:
>> > 
>> > ATH hangs up.  Perhaps the loss of CTS and DSR from the modem causes
>> the
>> > kernel and your terminal emulator to see nothing more.
>> > 
>> > Either configure the system to ignore the loss of CTS and DSR, or
>> > configure the modem not to drop CTS and DSR during a hangup.  Then try
>> > again.
>> > 
>> > I've no idea why you want to see anything more after ATH though.
>> > 
>> > -- 
>> > James Cameron
>> > http://ftp.hp.com.au/sigs/jc/
>> > --
>> > To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
>> > the body of a message to majordomo@vger.kernel.org
>> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> > 
>> > 
>> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 

-- 
View this message in context: http://www.nabble.com/modem-session-behavior-tp16169308p16824945.html
Sent from the linux-ppp mailing list archive at Nabble.com.

