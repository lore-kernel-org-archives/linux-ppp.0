From: Andreas Mattheiss <andreas.mattheiss@gmx.de>
Date: Fri, 28 Jan 2005 22:06:17 +0000
Subject: Re: Build Problems of ppp-2.4.3 against linux-2.4.29-pre2
Message-Id: <20050128220617.GA1076@highscreen>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050109182705.GA1754@highscreen>
In-Reply-To: <20050109182705.GA1754@highscreen>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello,

thanks for the reply, but the (manually added) include-path was not the
cause for the build woes.

I discovered that when I do this modification things build ok:

--- sys-linux.c	2005-01-21 23:55:54.000000000 +0100
+++ sys-linux.c.0003.clean	2005-01-21 23:52:53.000000000 +0100
@@ -102,11 +102,19 @@
 #define MAX_ADDR_LEN 7
 #endif
 
+#if __GLIBC__ >= 2
+#include <asm/types.h>		/* glibc 2 conflicts with linux/types.h */
+#include <net/if.h>
+#include <net/if_arp.h>
+#include <net/route.h>
+#include <netinet/if_ether.h>
+#else
 #include <linux/types.h>
 #include <linux/if.h>
 #include <linux/if_arp.h>
 #include <linux/route.h>
 #include <linux/if_ether.h>
+#endif
 #include <netinet/in.h>
 #include <arpa/inet.h>
 
Only warning issued is 

cc -O2 -pipe -Wall -g -DHAVE_PATHS_H -DIPX_CHANGE -DHAVE_MMAP -I../include
-DCHAPMS=1 -DMPPE=1 -DHAS_SHADOW -DHAVE_CRYPT_H=1 -DUSE_CRYPT=1
-DHAVE_MULTILINK -DUSE_TDB=1 -DPLUGIN -DMAXOCTETS
-I/overspill/sekundaer/include -I/usr/include/libpng12  -c -o sys-linux.o
sys-linux.c
In file included from /usr/include/linux/if_arp.h:26,
                 from sys-linux.c:107:
/usr/include/linux/netdevice.h:75: warning: AX_ADDR_LEN' redefined
sys-linux.c:102: warning: this is the location of the previous definition
cc -O2 -pipe -Wall -g -DHAVE_PATHS_H -DIPX_CHANGE -DHAVE_MMAP -I../include
-DCHAPMS=1 -DMPPE=1 -DHAS_SHADOW -DHAVE_CRYPT_H=1 -DUSE_CRYPT=1
-DHAVE_MULTILINK -DUSE_TDB=1 -DPLUGIN -DMAXOCTETS -L/overspill/sekundaer/lib
-Wl,-E -o pppd main.o magic.o fsm.o lcp.o ipcp.o upap.o chap-new.o md5.o
ccp.o ecp.o auth.o options.o demand.o utils.o sys-linux.o ipxcp.o tty.o
eap.o chap-md5.o md4.o chap_ms.o sha1.o pppcrypt.o multilink.o tdb.o
spinlock.o  -lcrypt -ldl

Final link works ok. As it looks there is a big confusion in that the
<something/header.h> and <linux/header.h> includes are invoked
inconsitently. Forcing the <linux/header.h> apparently fixes this.

However, I am not very happy with this, since I don't think I should need to
fiddle with the source like this. Question 1: Does the thus built pppd do
its job correctly? Question 2: Why am I the only poor sod for whom it didn't work
out of the box? 


Regards
Andreas


Am Mon, Jan 10, 2005 at 02:18:14PM -0500 schrieb James Carlson:
> Andreas Mattheiss writes:
> > I'm trying to build ppp-2.4.3 on a linux system, kernel 2.4.29-pre2, but I'm
> > getting gobs of errors when building in the pppd subdirectory. The final
> > words are:
> 
> This doesn't look at all like a ppp-2.4.3 problem.  It looks like a
> problem with your compiler and/or system header files.
> 
> > /usr/src/linux/include/linux/compiler.h:25: warning: _attribute_used__'
> > redefined
> > /usr/include/sys/cdefs.h:195: warning: this is the location of the previous
> > definition
> 
> Neither of those files comes with ppp-2.4.3.
> 
> > /usr/src/linux/include/asm/signal.h:26: warning: SIG' redefined
> > /usr/include/signal.h:185: warning: this is the location of the previous
> > definition
> 
> Nor do those.
> 
> > pppd.h:512: 	nfo' redeclared as different kind of symbol
> > /usr/src/linux/include/net/dst.h:66: previous declaration of 	nfo'
> > pppd.h:515: rror' redeclared as different kind of symbol
> > /usr/src/linux/include/net/dst.h:52: previous declaration of rror'
> > pppd.h:603: tput' redeclared as different kind of symbol
> > /usr/src/linux/include/net/dst.h:58: previous declaration of tput'
> 
> That doesn't match the net/dst.h I've seen on Linux.
> 
> > I am not an expert, but it looks to me as if the header files from libc and
> > the kernel are somehow jumbled up.
> 
> Yes.
> 
> > I did compile libc about a year ago,
> > keeping the (then up to date) kernel headers in /usr/include/linux/include,
> > where they remain until now. I didn't overwrite this with the current
> > headers.
> > 
> > Please let me know what I'm doing wrong here.
> 
> At a guess, this list isn't right:
> 
>   -I/overspill/sekundaer/include -I/usr/include/libpng12 -I/usr/src/linux/include
> 
> Where did that list come from?
> 
> -- 
> James Carlson                                 <carlsonj@workingcode.com>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
