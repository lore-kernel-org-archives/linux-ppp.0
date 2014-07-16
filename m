From: Michael Richardson <mcr@sandelman.ca>
Date: Wed, 16 Jul 2014 02:04:33 +0000
Subject: about that partial copy of radiusclient in pppd/plugins/radius
Message-Id: <4670.1405476273@sandelman.ca>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


According to the git history on pppd, back in Nov. 14, 2004, radiusclient,
which had been imported into pppd, got merged so that only the critical
pieces were present.
   https://github.com/wkz/pppd/commit/4abe4296f0eddbb2b6ff11dbbd27100156c85f87

This was likely the right decision at the time.
The Freeradius folks picked up radiusclient see: http://freeradius.org/freeradius-client/
and https://github.com/FreeRADIUS/freeradius-client

I have need to add the IPv6 attributes, which means having ipv6addr and
ipv6prefix values, and adding decode support for that.

I'd rather not work on ancient code, yet the latest freeradius-client doesn't
have the support I need anyway.

It appears that there are the following differences:
        1) rc_handle on all calls; not much of a problem.
        2) use of pppd's error() call rather than rc_log(), I'm sure that
           I can work this out in the freeradius-client library with a
           pointer to function somewhere.
        3) some other stuff involving VENDOR_NONE and the like.
           It appears to be simple divergence.

My opinion is that freeradius-client does not need to compile to a .so,
that's it's better as a straight .a, most projects never need to install it,
just link it in.

My other opinion is that 99% of uses of pppd client ends, or are server ends
that do not use the radius plugin, and for the rest, it's not enough to have
libradiusclient.a, you need a bunch of /etc/*radiusclient/.. stuff too.
If I were packaging pppd for a distro, I'd make the radius part a seperate
package.  In git, I'd make the freeradius-client a submodule, and in tar.gz
form, I'd just document that you should extract freeradius-client.tgz "HERE"

Opinions?

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        | network architect  [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [


