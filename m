From: PierrotLafouine <pierrotlafouine@gmail.com>
Date: Fri, 28 May 2010 15:06:48 +0000
Subject: Question on pppd / =?ISO-8859-1?Q?reset=3F?=
Message-Id: <4BFFDC08.9070103@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi
If I'm not on the good forum, or too specific with my questions, please
provide me the address of the good mailing list/forum.

We have an application using ppp with a GPRS modem.  The system is
actually in the field and working 24/7 for several months.

Carrier disconnected modem often  (IP renewal, maintenance etc.) and
modem alway reconnected correctly, except last time.  I went onsite for
debugging and try different commands to make modem reconnect
(ifdown/ifdown, poff/pon, shutdown -r etc...) All commands failed to
reconnect the modem.  I had to pull the plug to make it connect.

My question is about reset.  I would like to understand more the stack
of the system, and why it failed to reconnect.  The GPRS modem is
connected trought full RS-232 signals, and RS-232 chips is on an ISA
bus.  How does ppp deal with this kind of hadware configuration ?  I
read ppp deal with modem reset, but how ?  Any idea what I should look
at to understand more the root cause of this failure ?

Thanks,

Pierre
