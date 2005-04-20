From: Paul Mackerras <paulus@samba.org>
Date: Wed, 20 Apr 2005 00:28:21 +0000
Subject: Re: Detecting end of GSM datacall
Message-Id: <16997.41509.319196.77607@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <426384B8.6050809@nokia.com>
In-Reply-To: <426384B8.6050809@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Timo Ter=E4s writes:

> I'm currently using PPP with GSM datacalls (PC connected using Bluetooth =

> to mobile phone) and it works just fine. However, if I terminate the=20
> phone call from my mobile phone the loss of link is not detected.
>=20
> I tracked down the reason: since the PPP link is between PC and remote=20
> computer, the mobile phone does not send any PPP packets that the link=20
> is dead. Instead it just sends '\r\nNO CARRIER\r\n'. And leaves the=20
> Bluetooth connection in AT command mode. Thus PPP stays happily up.

I don't think that just looking for that string would be the right
thing to do - what if someone sends you an email with that string in
it?  Every time you tried to download that email, ppp would
disconnect. :)

> This AT info is received by the PPP async driver, but it stores it and=20
> does not process it since PPP_FLAG is never received in ppp_async_input().
>=20
> Now I'm wondering what would be the proper way to fix this?

I suggest that you run pppd on a pty and have a little userspace
program to transfer characters between the pty and the real serial
port, much like the charshunt() function in pppd does.  That program
can do whatever hangup detection is appropriate.

Paul.


