From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 18 Nov 2004 12:04:29 +0000
Subject: Re: Socket doesn't get EOF
Message-Id: <16796.36813.379818.814193@carlson.workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <41998875.2020305@blazemail.com>
In-Reply-To: <41998875.2020305@blazemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

K-sPecial writes:
> Well, yes and no. In the way of the bot, not drasticly. Although the 
> other day I was programming some perl that needed to know when the 
> computer was online and when it wasn't. I realy didn't give it as much 
> thought as I could have, but resorted to the resolution of a popular 
> name server, such as internic.net. This of course can also have problems 
> 
> when your DNS server(s) happens to not cooperate. Honestly i'm sure this 
> isn't the correct manor to go about such a thing, but for what I needed 
> it for, it should suffice. I was going to test for interfaces being up, 
> which would work in the case of pppd, just not in the case of say DSL 
> where your interface can obviously still be up yet your modem isn't online.

SIOCGIFCONF can tell you if you have interfaces available.

Even if the interfaces are up and the modem is "on line," that doesn't
mean that any particular host is actually reachable.  That sort of
global knowledge just isn't knowable, except in retrospect: if the
connection times out, then that host obviously can't be reached.

> But as to your question, I would say there is, when you just need to 
> know, period, if you can successfuly access a remote node via the 
> Internet, and don't actualy need the support of an exact cause.

That's what timeouts are for.  You can use the existing default
timeout provided by TCP, or (if that's too long) you can set up your
own timer with alarm() or similar functions.

-- 
James Carlson                                 <carlsonj@workingcode.com>
