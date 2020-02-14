From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 14 Feb 2020 18:25:43 +0000
Subject: Re: Porting source to OSX
Message-Id: <21ea0c4d-c895-65a8-7d00-ef19ec1c824e@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <808CF219-67B9-45A0-B1FA-A53E682B0B06@gmail.com>
In-Reply-To: <808CF219-67B9-45A0-B1FA-A53E682B0B06@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 2/14/20 11:58 AM, igal avraham wrote:
> Thanks for the fast reply.
> 
> Are there any guidelines for porting if I want to do it by myself ?

If Apple shipped their driver header files, you *might* be able to get
away with compiling just the user-space code alone, substituting in
those headers.  A quick check of a Mac system I have shows that the
header files for PPP are missing.  I don't know how you'd go about
getting them.  Maybe you'd get lucky and their kernel modules don't
differ significantly from those used on other OSes.  It's perhaps worth
a try.  It'll take some hacking of the 'configure' script to make it happen.

Assuming that fails ...

The starting point for a complete port is the kernel module, which must
be able to attach to a serial driver (so that we can send/receive frames
using AHDLC or HDLC) and to the network stack (so that we can behave as
a data link layer protocol in the system).

How this is done varies dramatically based on system design, kernel
facilities, and resource management issues.  Feel free to look through
the 'modules' subdirectory in the pppd distribution for an example of
how it's done on a STREAMS-based system, and the Linux sources for an
example of that kernel:

https://github.com/torvalds/linux/blob/master/drivers/net/ppp/ppp_generic.c

Perhaps closer to what you want is the FreeBSD port, given that I think
Darwin is a derivative of the original BSD4.4, but that one is even
further afield of the original pppd sources.  They've forked the sources
and maintain them as part of the FreeBSD tree.  (I think similar things
are true for the other *BSD variants.)

https://github.com/freebsd/freebsd/tree/master/usr.sbin/ppp

I don't know how much of Darwin's kernel is publicly documented.  I know
they released some stuff openly for a while and then gave up on the
whole "open source" thing.  You might be able to get some pointers
through one of the projects that derived from that:

http://www.puredarwin.org/

And, if successful, you'd also need to figure out how to put a
cryptographic signature on your module so you can load it in the kernel.
 Much luck with that part; all I know is that it's non-trivial.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
