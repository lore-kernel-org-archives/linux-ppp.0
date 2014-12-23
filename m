From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 23 Dec 2014 12:11:07 +0000
Subject: Re: pppd 2.4.7 for bsd
Message-Id: <54995BDB.1070500@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20141223090657.a126d12db17e3a931dfe978a@openbsd.se>
In-Reply-To: <20141223090657.a126d12db17e3a931dfe978a@openbsd.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 12/23/14 03:06, oht@openbsd.se wrote:
> Hi
> I'm using pppd to connect to my ip provider via umts.
> In the present OpenBSD there is a very old version of pppd included, 2.3.5.
> In order to have my resolve.conf updated after switching to some wifi provider I needed the "usepeerdns".
> It is not included in version 2.3.5.
> Finding out that NetBSD is using a patched version of 2.4.4, I modified that for my OpenBSD. 
> It worked for my purpose.
> After that it was quite easy to upgrade it to your 2.4.7 level.
> If it is of any use for you, I can provide diffs, new sys-bsd.c and new Makefile.bsd for 2.4.7
> It works on OpenBSD and compiles on FreeBSD and NetBSD.

I can't speak for Paul, but I do think that's a welcome addition.
Besides the usual administrivia regarding copyrights and attribution,
the main issue in platform support is with on-going maintenance.  There
usually isn't a great deal of this work -- it's a rather mature software
package -- but when a new release is cut, we like to make sure that it
works on all of the supported packages.

Are you willing (or do you know someone willing) to play that role for BSD?

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
