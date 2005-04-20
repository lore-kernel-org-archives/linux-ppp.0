From: =?ISO-8859-1?Q?Timo_Ter=E4s?= <ext-timo.teras@nokia.com>
Date: Wed, 20 Apr 2005 11:11:33 +0000
Subject: Re: Detecting end of GSM datacall
Message-Id: <426638E5.3070902@nokia.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <426384B8.6050809@nokia.com>
In-Reply-To: <426384B8.6050809@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

ext James Carlson wrote:
> Timo Ter=E4s writes:
>>I tracked down the reason: since the PPP link is between PC and remote=20
>>computer, the mobile phone does not send any PPP packets that the link=20
>>is dead. Instead it just sends '\r\nNO CARRIER\r\n'. And leaves the=20
>>Bluetooth connection in AT command mode. Thus PPP stays happily up.
>=20
> Why doesn't it de-assert DCD (Data Carrier Detect) and thus cause pppd
> to receive SIGHUP as expected?
>=20
> In my opinion, we shouldn't really go too far out of our way to make
> fatally compromised interfaces work "right."

Actually this is a very good question. I now finally solved this bug. It=20
appears that BlueZ correctly translates/transports the carrier detect=20
signal from my mobile. However it does not call tty_hangup() when the=20
carrier detect is de-asserted. I managed to get this working perfectly=20
well by adding one if () and tty_hangup() call to=20
net/bluetooth/rfcomm/tty.c.

So this is actually a BlueZ emulation bug. I'll post bug report / simple=20
patch to appropriate list asap.

Thanks,
   Timo
