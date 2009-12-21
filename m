From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 21 Dec 2009 14:51:14 +0000
Subject: Re: pppoe uplink goes down several times a day, what is wrong
Message-Id: <4B2F8B62.1020204@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4B2F74DC.4040204@powercraft.nl>
In-Reply-To: <4B2F74DC.4040204@powercraft.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Jelle de Jong wrote:
>> If it happens this way every time, then I would suspect that your ISP
>> may have set a time limit on connections.  Some ISPs are known for doing
>> such things, especially those that have a dial-up background.  They view
>> their service as being "on-demand" and thus an always-connected client
>> is one that's abusing the terms of service.  (That having everyone
>> connected all the time costs no more than having them connect on demand
>> doesn't seem to factor into those calculations.  There's no technical
>> accounting for business rules ...)
> 
> The disconnection interval seems random, as you can see the logs
> showed two disconnects this day.
> 
> # grep -i pppd /var/log/syslog | grep -i time
> Dec 21 06:37:24 sammy pppd[2954]: Connect time 2681.4 minutes.
> Dec 21 08:32:56 sammy pppd[2954]: Connect time 115.1 minutes.
> 
> The connection is a G.SHDSL 2048:2048 1:1 business connection very
> expensive by the biggest ISP in our country (not saying the ISP is
> good) I don't think they have a connection time limit?

OK; that certainly narrows things down.

>> If it seems to be "random" rather than a fixed interval, then that's
>> probably not the problem.  It's possible that the ISP's server is
>> crashing occasionally or that it's experiencing some sort of
>> communications problem or that the path between you and that server (the
>> ATM network) is itself unreliable.  The key information that's needed to
>> identify such a problem would be on the ISP's systems (or may need some
>> investigation and analysis).
> 
> I changed the Siemens 5890 provided by the ISP with a DrayTek Vigor
> 3100. The Siemens modem did NAT and was not transparent enough. But by
> doing this the support level provided by the ISP drops to a minimum...

If this is a commercial application (rather than something you just hack
around with), I'd certainly recommend staying with whatever the ISP is
best equipped to support.

I understand the appeal of getting unadulterated packets right to your
system -- most of those stand-alone NAT devices can be downright evil --
but when you run into a problem like this that requires the ISP's
involvement, you're bound to run into trouble.

Just the same, it's well worth asking for help from them in tracking
down the problem.

>> The bottom line, I think, is that your ISP is the only entity that can
>> investigate and solve the problem properly.  If your ISP doesn't take
>> your complaints about reliability seriously, then it's time to find a
>> new one.
> 
> I got a vendor locking, The current DSL is pre-fibre solution because
> the completion of the fibre internet connection is taking longer then
> anticipated, and the ISP is the only fibre capable provider in the
> Netherlands for the location of the new office.

I see.

>> (As for PPPoE, I'd certainly recommend avoiding that if you can. It's a
>> horrible mess as a protocol. In this case, though, I don't think it's
>> to blame for your problems.)
> 
> Is there a way to be more sure about PPPoE not being the issue. Can
> there be something wrong with the LCP Echo-Request messages?

You could trace all of the packets on the wire with something like
ethereal or tcpdump.  It'll likely change timing enough that the problem
won't happen anymore, and it'll be hard to examine in any case, but
without help from your ISP, I don't see much alternative.

The information your ISP could provide would be any error messages they
see on their servers or from their ATM gear that corresponds with the
approximate time you're seeing the disconnect.

They should be able (and willing) to do at least that without having to
have any sort of special gear on your site.  If they're not willing to
examine their own log files, are you sure you want to do business with them?

> I know PPPoE is a horrible mess. I prefer 1483 bridged IP LLC, but I
> can't use it in this case.

I understand the pain.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
