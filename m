From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 24 Apr 2020 14:26:16 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <7b366bd6-85d6-c7c2-9d0e-aafdaf9a81fc@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On 2020-04-24 10:02, David Bala=C5=BEic wrote:
> ppp log:
>=20
>=20
> Fri Apr 24 10:42:32 2020 daemon.notice pppd[11986]: Modem hangup
> Fri Apr 24 10:42:32 2020 daemon.info pppd[11986]: Connect time 979.3 minu=
tes.
> Fri Apr 24 10:42:32 2020 daemon.info pppd[11986]: Sent 325423487
> bytes, received 1643504692 bytes.

Truncated logs aren't so helpful.  This tells us nothing about what's
going on.

> It seems echo requests come more often towards the end, almost every
> second. Earlier they are also irregular, but come at 30-60 second
> intervals.

LCP Echo-Request messages are an optional feature.  They're controlled
by the lcp-echo-interval and lcp-echo-failure options.  By default, pppd
won't send these, but will respond if the other side sends them.

The idea is that if you send a request, and the other side fails to
respond, then, regardless of what the hardware is telling you, the link
itself is dead, and can be torn down.

However, in the exchange you've shown here, every request has a
response, and all of the requests and responses appear to be in good
order (each side is attaching its own LCP magic number option, which is
the right thing to see, and the ID numbers line up for request/reply).

There's nothing out of what you've sent that indicates (to me, at least)
any sort of problem, at least within PPP itself.

--=20
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
