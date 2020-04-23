From: Guillaume Nault <gnault@redhat.com>
Date: Thu, 23 Apr 2020 00:08:17 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <20200423000817.GA25404@pc-3.home>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Wed, Apr 22, 2020 at 06:00:52PM -0400, James Carlson wrote:
> On 2020-04-22 13:45, David Bala=C5=BEic wrote:
> > Hi!
> >=20
> > I have a router running openwrt connected to a GPON ONT, running a
> > PPPoE connection (hw details below).
>=20
> This looks to be (possibly) a PPPoE failure, though there's nothing
> interesting in the log messages provided.  If there were an interesting
> log message, it would almost certainly come somewhere (perhaps even
> *minutes*) before that initial "Modem hangup" message.
>=20
> The definitive test would be to run a packet capture on the Ethernet
> interface itself (*not* on the PPP interface) with something like
> Wireshark and determine what happens in the lead-up to the failure.  I'd
> expect the system is just getting a stray PADT from the peer, if it's
> some kind of PPPoE problem.
>=20
I'd also suspect that the peer just sent a PADT. That can be
intentional. Some providers proactively force reconnections
every x days. Though 20 hours looks like a really low timeout.
You can capture PPPoE discovery packets with
"tcpdump -i nic-eth1.3902 pppoed".

Another possibility is that the network interface is modified
(interface passed down, MTU or the MAC address changed) while the
PPPoE session is established.

> If it isn't, then possibly it's something else.  I think that the last
> time I looked at the PPPoE implementation on Linux it was a bit hokey --
> it ran PPP over a pty pair and then decoded the framing in user space
> and wrote it back out over Ethernet using PPPoE.  I hope it's not still
> like that, as I haven't looked at it in years, but it may well be.  An
> internal error in that logic could also cause a "hangup" message,
> although hopefully along with some kind of system log about a core file
> as well.
>=20
I didn't know about that implementation. PPPoE has been implemented
using PPPOX sockets since at least the beginning of the git history.

> (The implementation on other platforms, such as Solaris, was a bit more
> solid.)
>=20
> --=20
> James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
>=20
