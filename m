From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 10 Jan 2005 19:18:14 +0000
Subject: Re: Build Problems of ppp-2.4.3 against linux-2.4.29-pre2
Message-Id: <16866.54518.177654.360678@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050109182705.GA1754@highscreen>
In-Reply-To: <20050109182705.GA1754@highscreen>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Andreas Mattheiss writes:
> I'm trying to build ppp-2.4.3 on a linux system, kernel 2.4.29-pre2, but I'm
> getting gobs of errors when building in the pppd subdirectory. The final
> words are:

This doesn't look at all like a ppp-2.4.3 problem.  It looks like a
problem with your compiler and/or system header files.

> /usr/src/linux/include/linux/compiler.h:25: warning: _attribute_used__'
> redefined
> /usr/include/sys/cdefs.h:195: warning: this is the location of the previous
> definition

Neither of those files comes with ppp-2.4.3.

> /usr/src/linux/include/asm/signal.h:26: warning: SIG' redefined
> /usr/include/signal.h:185: warning: this is the location of the previous
> definition

Nor do those.

> pppd.h:512: 	nfo' redeclared as different kind of symbol
> /usr/src/linux/include/net/dst.h:66: previous declaration of 	nfo'
> pppd.h:515: rror' redeclared as different kind of symbol
> /usr/src/linux/include/net/dst.h:52: previous declaration of rror'
> pppd.h:603: tput' redeclared as different kind of symbol
> /usr/src/linux/include/net/dst.h:58: previous declaration of tput'

That doesn't match the net/dst.h I've seen on Linux.

> I am not an expert, but it looks to me as if the header files from libc and
> the kernel are somehow jumbled up.

Yes.

> I did compile libc about a year ago,
> keeping the (then up to date) kernel headers in /usr/include/linux/include,
> where they remain until now. I didn't overwrite this with the current
> headers.
> 
> Please let me know what I'm doing wrong here.

At a guess, this list isn't right:

  -I/overspill/sekundaer/include -I/usr/include/libpng12 -I/usr/src/linux/include

Where did that list come from?

-- 
James Carlson                                 <carlsonj@workingcode.com>
