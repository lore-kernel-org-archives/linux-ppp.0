From: Jouko Nikula <nikujo@luukku.com>
Date: Mon, 16 Aug 2010 13:33:47 +0000
Subject: Re: Intervening IPCP Configure Requests
Message-Id: <1281965627695.nikujo.61027.Nml1tM-pXm8QWLCO1F_IgQ@luukku.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <29408130.post@talk.nabble.com>
In-Reply-To: <29408130.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

First of all thanks a lot for your reply and sorry about my triple post. It=
 seems that nabble was too complicated for me.

James Carlson wrote 12.08.2010 16:20:

> The existing code, though, doesn't really allow you to get into the
> middle of negotiation as you're suggesting.  And, arguably, the
> interfaces are not as flexible as they could be.
>=20

Yes, unfortunately I need to be able to get into the=20
middle of negotiation. It's too late if the IPCP negotiation has already en=
ded.

> Getting the on-the-wire behavior right (in general) requires mechanisms
> that can be run synchronously and without undue delay.  That's why the
> existing code keeps those hooks out of the main line -- those external
> functions are sometimes (and all too often) written to make calls to
> RADIUS or DHCP servers, or other sorts of things that can block for
> arbitrary periods of time.
>=20

Yes my external calls will also be something that block for possibly long t=
ime.

> To put in a supportable set of hooks for what you're suggesting would (I
> believe) require either a set of non-blocking primitives plus completion
> callbacks and interfaces into the existing event handling structure or
> (gasp!) similar multithreaded mechanisms.  I might be missing something,
> but it doesn't look quite simple to me.
>=20

Ok. I understand and agree, making the hooks asynchronous does not sound ea=
sy to me either.

> Of course, you've got the source, so if you just want to hack something
> into the middle of ipcp_reqci() in pppd/ipcp.c, go ahead.  Depending on
> how your "validation" functions work, you might produce odd results on
> the wire, including possibly non-converging behavior with some peers.
> But if you're not worried about that or if it works for you, then go
>  for it.

I did some checks and I think this might work for me. For my application it=
 should be ok that an IPCP configure request blocks for maybe a long time, =
before it is either Ack'ed or connection is terminated. Do I understand cor=
rectly that blocking is the part where you think that problems could arise?

Also do I understand correctly that you are not interested in a patch where=
 I would allow this behaviour with synchronous hooks?

regards,
Jouko Nikula

....................................................................
Luukku Plus -paketilla p=E4=E4set eroon tila- ja turvallisuusongelmista.
Hanki Luukku Plus ja helpotat el=E4m=E4=E4si. http://www.mtv3.fi/luukku
