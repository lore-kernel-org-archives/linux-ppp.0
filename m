From: Paul Mackerras <paulus@samba.org>
Date: Sun, 19 Aug 2007 04:17:44 +0000
Subject: Re: [patch 08/14] support building pppdump with the system zlib
Message-Id: <18119.50280.843244.25141@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20070819014009.527792661@bongo.bofh.it>
In-Reply-To: <20070819014009.527792661@bongo.bofh.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Marco d'Itri writes:

> +ifdef HAVE_ZLIB
> +LIBS += -lz
> +else
> +OBJS += zlib.o
> +endif

Are you sure that the Z_BLOCK value of the flush parameter to inflate
works the same as the Z_PACKET_FLUSH value that I added to zlib.c?
Possibly it does, but there could be differences.  (Note that both
constants have the value 5.)

Also it seems a bit dangerous to build deflate.o against the zlib.h in
pppd but link it against the system zlib, which has a longer z_stream
definition.  If you use the system zlib.h you will hit the
Z_PACKET_FLUSH vs. Z_BLOCK thing of course.

Paul.
