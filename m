From: K-sPecial <spam@blazemail.com>
Date: Wed, 17 Nov 2004 23:41:48 +0000
Subject: Re: Socket doesn't get EOF
Message-Id: <419BE1BC.9060206@blazemail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <41998875.2020305@blazemail.com>
In-Reply-To: <41998875.2020305@blazemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

carlsonj@workingcode.com wrote:
> K-sPecial writes:
> 
>>Thanks, that was very informative, it made sense and I much appreciate 
>>the prompt response. I have added a timeout on the socket and will get a 
>>glimpse of what happens next time pppd dies.
> 
> 
> You can also have pppd clobber the application via the
> /etc/ppp/ip-down script.  I'd suggest that doing so is a mistake.  If
> the link comes back (it was just a short glitch), then the application
> fails for no reason.  If the network is designed with multiple paths,
> then there's really no good way to know when (or if) to kill the
> application.
> 
> Moreover, you'd have no way to know if some intermediate router
> failed, and you'd likely want to have the application "notified" in
> some way if that were to happen for the same reason that you want pppd
> to kill the application.  If you can't detect router failure in
> practice, is there much additional value to detecting local interface
> failure?
> 

Well, yes and no. In the way of the bot, not drasticly. Although the 
other day I was programming some perl that needed to know when the 
computer was online and when it wasn't. I realy didn't give it as much 
thought as I could have, but resorted to the resolution of a popular 
name server, such as internic.net. This of course can also have problems 

when your DNS server(s) happens to not cooperate. Honestly i'm sure this 
isn't the correct manor to go about such a thing, but for what I needed 
it for, it should suffice. I was going to test for interfaces being up, 
which would work in the case of pppd, just not in the case of say DSL 
where your interface can obviously still be up yet your modem isn't online.

But as to your question, I would say there is, when you just need to 
know, period, if you can successfuly access a remote node via the 
Internet, and don't actualy need the support of an exact cause.

--K-sPecial

[ http://xzziroz.freeshell.org
   irc://xzziroz.dtdns.net       ]


