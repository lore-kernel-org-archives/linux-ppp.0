From: "Steve Drew" <steve.drew@empics.com>
Date: Mon, 18 Apr 2005 13:25:25 +0000
Subject: RE: Detecting end of GSM datacall
Message-Id: <0DD4EA5DCF754A409C4E182C758C37F302FC40@tigris.i.empics.co.uk>
List-Id: <linux-ppp.vger.kernel.org>
References: <426384B8.6050809@nokia.com>
In-Reply-To: <426384B8.6050809@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Hi Timo,

	I've had a similar issue with the Nokia mobiles I've been using, the worka=
round I've used is to put

lcp-echo-interval 4
lcp-echo-failure 2

into the my /etc/ppp/options file.

steve

-----Original Message-----
From: linux-ppp-owner@vger.kernel.org [mailto:linux-ppp-owner@vger.kernel.o=
rg] On Behalf Of Timo Ter=E4s
Sent: 18 April 2005 10:58
To: linux-ppp@vger.kernel.org
Subject: Detecting end of GSM datacall

Hi,

I'm currently using PPP with GSM datacalls (PC connected using Bluetooth=20
to mobile phone) and it works just fine. However, if I terminate the=20
phone call from my mobile phone the loss of link is not detected.

I tracked down the reason: since the PPP link is between PC and remote=20
computer, the mobile phone does not send any PPP packets that the link=20
is dead. Instead it just sends '\r\nNO CARRIER\r\n'. And leaves the=20
Bluetooth connection in AT command mode. Thus PPP stays happily up.

This AT info is received by the PPP async driver, but it stores it and=20
does not process it since PPP_FLAG is never received in ppp_async_input().

Now I'm wondering what would be the proper way to fix this?

Thanks,
   Timo
-
To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html



