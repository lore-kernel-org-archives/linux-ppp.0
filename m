From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 22 Apr 2020 22:00:52 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <e1ab31e7-66a2-5bd8-1b95-27fa65d0974c@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On 2020-04-22 13:45, David Bala=C5=BEic wrote:
> Hi!
>=20
> I have a router running openwrt connected to a GPON ONT, running a
> PPPoE connection (hw details below).

This looks to be (possibly) a PPPoE failure, though there's nothing
interesting in the log messages provided.  If there were an interesting
log message, it would almost certainly come somewhere (perhaps even
*minutes*) before that initial "Modem hangup" message.

The definitive test would be to run a packet capture on the Ethernet
interface itself (*not* on the PPP interface) with something like
Wireshark and determine what happens in the lead-up to the failure.  I'd
expect the system is just getting a stray PADT from the peer, if it's
some kind of PPPoE problem.

If it isn't, then possibly it's something else.  I think that the last
time I looked at the PPPoE implementation on Linux it was a bit hokey --
it ran PPP over a pty pair and then decoded the framing in user space
and wrote it back out over Ethernet using PPPoE.  I hope it's not still
like that, as I haven't looked at it in years, but it may well be.  An
internal error in that logic could also cause a "hangup" message,
although hopefully along with some kind of system log about a core file
as well.

(The implementation on other platforms, such as Solaris, was a bit more
solid.)

--=20
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
