From: Abdul J <postabdul@yahoo.com>
Date: Mon, 07 Feb 2005 21:18:38 +0000
Subject: Re: Multilink in ppp-2.4.3
Message-Id: <20050207211838.53397.qmail@web30505.mail.mud.yahoo.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050201230627.51274.qmail@web30502.mail.mud.yahoo.com>
In-Reply-To: <20050201230627.51274.qmail@web30502.mail.mud.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi Paul,

Thanks for replying to my post. Below is my response
to your questions. Please let me know if you need any
further details. 

--- Paul Mackerras <paulus@samba.org> wrote:

> Abdul J writes:
> 
> > For example, if I have two dial-up connection
> > multilinked together. Even if the first link is
> > dropped, since the second link is active the
> interface
> > ppp0 is active and the connection still exists.
> But
> > the problem is I am unable to redial the dropped
> link
> > because the pppd process is still running on that
> link
> > and the serial port is locked. If I try to redial
> the
> > first link, I get an error:
> > Feb 1 17:48:33 dhcp034 pppd[3417]: tcgetattr: No
> such
> > device or address (line 907)
> 
> Do you get that error on the end that is dialling
> out, or the end that
> you are dialling in to?
> 

I get the error on the side from which I am dialing
out(lets say, client). Also there is a problem (that I
did not observe before) on the side that I dial in to
(lets say, server). So let me clarify the situation
again so that I do not give any wrong information.

When the primary/first link is dropped, both the sides
see the modem hangup and I get the same log message on
both client and server as shown below.

Feb  7 15:12:00 dhcp034 pppd[3195]: Hangup (SIGHUP)
Feb  7 15:12:00 dhcp034 pppd[3195]: Modem hangup
Feb  7 15:12:00 dhcp034 pppd[3195]: Link terminated.

But on the client side, the pppd process is still
running. A quick list of processes confirms this. And
when I try to redial the dropped link from the client
side, I get the following error

Feb  7 15:17:24 dhcp034 pppd[3386]: pppd 2.4.3 started
by root, uid 0
Feb  7 15:17:24 dhcp034 pppd[3386]: tcgetattr: No such
device or address (line 907)
Feb  7 15:17:25 dhcp034 pppd[3386]: Exit.

Now, on the server side I use mgetty-1.1.31 to accept
the incoming calls. The problem here is that even
after the modem hangup is recognised, the pppd process
is still running (because there is an active
connection in the bundle) and hence mgetty does not
regain control of the modem. If I start another
instance of mgetty on the modem, it complains that
there is an existing lock by the previous pppd
process.

In summary, on both sides of the connection, if the
primary modem is dropped, the modem hangup is
recognised but the serial port/modem is still tied up
with the processes and hence redialing is
unsuccessful.

> > My question is: Is there anyway in which I can
> redial
> > the dropped primary (first) link once a call
> > drop/hangup occurs without destroying the whole
> > bundle.
> 
> You should be able to just bring it up with the same
> pppd command as
> you used before.  If you can't that's a bug that we
> need to fix.

Clearly, I cannot redial the dropped link with the
same pppd command/configuration.

> 
> Paul.

I look forward to your response.

Abdul.



	
		
__________________________________ 
Do you Yahoo!? 
Yahoo! Mail - You care about security. So do we. 
http://promotions.yahoo.com/new_mail
