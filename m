From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 15 Feb 2005 12:49:02 +0000
Subject: Re: 2 questions about dialup pppd use
Message-Id: <16913.61374.994899.526275@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050212173525.GA27282@iceland.spb.ru>
In-Reply-To: <20050212173525.GA27282@iceland.spb.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Serge Koksharov writes:
> In /etc/ppp/ip-up.local I have following command to log my dialup sessions:
> echo `date` ppp-on: Speed: $3\; Local IP: $4\; Remote IP: $5 >> /etc/ppp/history
> The problem with this setup: No matter on which speed I'm connected (33600,
> 42666, etc) I'm always getting logged speed 115200. That's not I want! I think
> script logs serial port speed, but I want connection speed logged instead.

As others have mentioned, pppd doesn't really know that the modem
exists.  Only the external program invoked by the pppd "connect"
option (typically /usr/bin/chat, but doesn't have to be) knows
anything about the strings emitted by the modem.  See the chat man
page -- specifically the "REPORT" feature.

As far as pppd knows, it's just using a serial port.  The "speed"
mentioned in the pppd man page as an argument to the ip-up script is
the speed of that serial interface.

> Question2:
> If in the same script /etc/ppp/ip-up.local I use following command to 
> synchronize time:
> ntpdate ntp.someserver.org
> And in the /etc/ppp/ip-down.local I use command to log sent/received byte count
> and connection time by this command:
> echo " TX: $BYTES_SENT RX: $BYTES_RCVD for $((CONNECT_TIME/60)) minutes"\
> >> /etc/ppp/history
> I often get wrong connection time in /etc/ppp/history, for example:
>  TX: 41180 RX: 291021 for 71582784 minutes.

At a guess, your NTP time sync is causing a large jump because your
clock is off by a large amount.  pppd uses the gettimeofday() function
to compute CONNECT_TIME, and the value returned by that function is
UTC -- meaning that NTP will _change_ the value out from under pppd,
leading to incorrect calculation.

You could possibly get the current value of time() before running
ntpdate, and the value after, and subtrace that delta from
CONNECT_TIME.

Perhaps pppd ought to be using something different to compute elapsed
time (rather than wall clock time -- such as seconds since boot), but
it turns out to be absurdly hard to do this in a portable way.

-- 
James Carlson                                 <carlsonj@workingcode.com>
