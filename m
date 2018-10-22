From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 22 Oct 2018 14:40:16 +0000
Subject: Re: How to know when a link is established or destroyed?
Message-Id: <5977077b-5681-d186-4039-59fe5802b3e1@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20181022122818.1780e0bd@PC-dev2>
In-Reply-To: <20181022122818.1780e0bd@PC-dev2>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On 10/22/18 06:28, Morel B=C3=A9renger wrote:
> I am using pppd to have network access through GPRS/3G/4G on systems I
> do not have physical access to.
>=20
> Since I want the system to be up almost always, I am trying to manage
> my daemons through runit (daemontools), which works by keeping child
> process foreground and restart it when it dies for a reason or another,
> eventually logging whatever came on stdout.

Please post the pppd options you're using today.  I'm going to guess
that you're using at least "nodetach".  Anything else?  (See the man
page for sources of options; /etc/ppp/options is the main one.)

Please post debug traces, or a link to them; particularly those you feel
highlight problems that you're seeing.  It's almost impossible to
determine the source of problems without traces.  There are multiple
ways to get a trace.  The simplest is to use the "debug" option, and get
the log messages via syslog.  Use "logfile /path/to/some/file" if you
can't use syslog for some reason.  (Note: don't use kdebug unless there
are kernel-level problems.  This doesn't sound like a kernel-level problem.)

The usual way to set up an always-on connection with pppd is NOT via
some external utility, but by using the built-in restart capability in
pppd.  You can use use the external utility if you want, but I think
it'll be harder to manage.

To use the built-in restart, set "persist maxfail 0" as options.

If you insist on using an external utility to do this, you will probably
want something like "maxfail 1" or "maxfail 2" instead.

If the peer you're talking to is willing, I recommend using the
lcp-echo-interval and lcp-echo-failure options with any sort of link
that needs to be reliable.  These options (when usable -- the peer may
balk, if the peer is poorly implemented) allow PPP to detect when the
point-to-point link has lost connectivity, and will shut down (and
retry, if "persist" is enabled or if some sort of external restart
utility is used).

Note that most GPRS implementations, at least the ones I've seen, are
horror shows, and that stems, at least in part, from execrable
"standards" set for their use of Internet protocols.  Your mileage may vary.

> I can run pppd in that way, but I have no idea about how to know if the
> connection is really established or not, and on some systems manual
> reboot is sometimes needed, because it seems that pppd only tries 3 or
> 4 times to restore connection when link is cut, and if not it just
> stays alive doing nothing.

The connection is up for IPv4 traffic when the optional executable
script (or program) /etc/ppp/ip-up is invoked.  It's down when
/etc/ppp/ip-down is invoked.  You should also see the IFF_UP flag on the
interface change state; a routing socket might be good for monitoring that.

Having the PPP link up and having LCP+auth+IPCP negotiated (and thus the
local IP interface marked IFF_UP) does *NOT*, of course, guarantee that
you have a path to "the Internet" (or whatever wider network you believe
you're connecting to).  It merely means that an IP path has been
established to the peer -- PPP is point-to-point, of course.  Whether
that peer is capable and willing to transport IP traffic for you is a
completely separate matter.

If your "failures" involve losing IP routing while the PPP link is up,
then that may just be par for the course.  You'll need some other
monitoring system to tell you when or if that happens.  There's nothing
that PPP can possibly do to help with that; it's only a link layer protocol.

> So, I think either I missed the options needed to do what I need, or
> there is a tool to manage pppd that I don't know, or it is not
> implemented at all.
>=20
> If if is not implemented at all, is it intended? Would it be fine if I
> submit a patch doing this?

Submitting patches is fine, but if you do so, please indicate precisely
what the patch does and (if possible) why the existing features don't
fulfill your needs.  It's often very hard to review changes out of the
blue that don't appear to solve problems.

--=20
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
