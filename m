From: Bill Unruh <unruh@physics.ubc.ca>
Date: Mon, 14 Feb 2005 23:32:36 +0000
Subject: Re: 2 questions about dialup pppd use
Message-Id: <Pine.LNX.4.61.0502141525490.5778@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050212173525.GA27282@iceland.spb.ru>
In-Reply-To: <20050212173525.GA27282@iceland.spb.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Sat, 12 Feb 2005, Serge Koksharov wrote:

>  Dear all,
>
> I'm using pppd v2.4.2 on my Gentoo Linux box with modem connection to my
> provider. I have following questions:
>
> Question1:
> In /etc/ppp/ip-up.local I have following command to log my dialup sessions:
> echo `date` ppp-on: Speed: $3\; Local IP: $4\; Remote IP: $5 >> /etc/ppp/history
> The problem with this setup: No matter on which speed I'm connected (33600,
> 42666, etc) I'm always getting logged speed 115200. That's not I want! I think
> script logs serial port speed, but I want connection speed logged instead.

That is because the speed in question, which is the only speed that pppd
knows about, is the speed of the connection from the computer to the modem.
The speed you are interested in is the speed with which your modem talks to
the other modem, but that ppp does not and cannot have any information
about. It is often reported in the CONNECT string from the modem once it
makes its connection to the remote machine, which may be logged in the
local2.* syslogd information if you run chat with the -v option. But chat
is not pppd. It is a different program which is simply reporting what it
gets from the modem. It has no idea what the content of that report is
(unless you rewrite chat to parse the return message)

>
> Question2:
> If in the same script /etc/ppp/ip-up.local I use following command to
> synchronize time:
> ntpdate ntp.someserver.org
> And in the /etc/ppp/ip-down.local I use command to log sent/received byte count
> and connection time by this command:
> echo " TX: $BYTES_SENT RX: $BYTES_RCVD for $((CONNECT_TIME/60)) minutes"\
>>> /etc/ppp/history
> I often get wrong connection time in /etc/ppp/history, for example:
> TX: 41180 RX: 291021 for 71582784 minutes.

What do you get if you just record CONNECT_TIME ? It sounds to me like some
counter is rolling over. 
Note that this almost certainly has nothing to do with using ntp. 
I do not know how your system  or pppd gets the variable CONNECT_TIME.
