From: Andreas Mattheiss <andreas.mattheiss@gmx.de>
Date: Sun, 09 Jan 2005 18:27:05 +0000
Subject: Build Problems of ppp-2.4.3 against linux-2.4.29-pre2
Message-Id: <20050109182705.GA1754@highscreen>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello,

I'm trying to build ppp-2.4.3 on a linux system, kernel 2.4.29-pre2, but I'm
getting gobs of errors when building in the pppd subdirectory. The final
words are:

cc -O2 -pipe -Wall -g -DHAVE_PATHS_H -DIPX_CHANGE -DHAVE_MMAP -I../include
-DCHAPMS=1 -DMPPE=1 -DHAS_SHADOW -DHAVE_CRYPT_H=1 -DUSE_CRYPT=1
-DHAVE_MULTILINK -DUSE_TDB=1 -DPLUGIN -DMAXOCTETS
-I/overspill/sekundaer/include -I/usr/include/libpng12
-I/usr/src/linux/include  -c -o sys-linux.o sys-linux.c
In file included from /usr/src/linux/include/linux/init.h:5,
                 from /usr/src/linux/include/net/inetpeer.h:13,
                 from /usr/src/linux/include/net/route.h:29,
                 from sys-linux.c:109:
/usr/src/linux/include/linux/compiler.h:25: warning: _attribute_used__'
redefined
/usr/include/sys/cdefs.h:195: warning: this is the location of the previous
definition
In file included from /usr/src/linux/include/linux/signal.h:4,
                 from /usr/src/linux/include/linux/sched.h:26,
                 from /usr/src/linux/include/net/inetpeer.h:14,
                 from /usr/src/linux/include/net/route.h:29,
                 from sys-linux.c:109:
/usr/src/linux/include/asm/signal.h:26: warning: SIG' redefined
/usr/include/signal.h:185: warning: this is the location of the previous
definition
/usr/src/linux/include/asm/signal.h:70: warning: IGRTMIN' redefined
/usr/include/bits/signum.h:72: warning: this is the location of the previous
definition
/usr/src/linux/include/asm/signal.h:71: warning: IGRTMAX' redefined
/usr/include/bits/signum.h:73: warning: this is the location of the previous
definition
/usr/src/linux/include/asm/signal.h:87: warning: A_NOCLDSTOP' redefined
/usr/include/bits/sigaction.h:54: warning: this is the location of the
previous definition
/usr/src/linux/include/asm/signal.h:88: warning: A_NOCLDWAIT' redefined
/usr/include/bits/sigaction.h:55: warning: this is the location of the
previous definition
/usr/src/linux/include/asm/signal.h:89: warning: A_SIGINFO' redefined
/usr/include/bits/sigaction.h:57: warning: this is the location of the
previous definition

.... more of the like ...

/usr/src/linux/include/net/route.h: At top level:
/usr/src/linux/include/net/route.h:161: parse error before os'
/usr/src/linux/include/net/route.h: In function t_tos2priority':
/usr/src/linux/include/net/route.h:163: os' undeclared (first use in this
function)
/usr/src/linux/include/net/route.h:164: warning: control reaches end of
non-void function
/usr/src/linux/include/net/route.h: At top level:
/usr/src/linux/include/net/route.h:166: parse error before 32'
/usr/src/linux/include/net/route.h: In function 	p_route_connect':
/usr/src/linux/include/net/route.h:169: p' undeclared (first use in this
function)
/usr/src/linux/include/net/route.h:169: st' undeclared (first use in this
function)
/usr/src/linux/include/net/route.h:169: rc' undeclared (first use in this
function)
/usr/src/linux/include/net/route.h:169: os' undeclared (first use in this
function)
/usr/src/linux/include/net/route.h:169: f' undeclared (first use in this
function)
In file included from sys-linux.c:124:
pppd.h: At top level:
pppd.h:512: 	nfo' redeclared as different kind of symbol
/usr/src/linux/include/net/dst.h:66: previous declaration of 	nfo'
pppd.h:515: rror' redeclared as different kind of symbol
/usr/src/linux/include/net/dst.h:52: previous declaration of rror'
pppd.h:603: tput' redeclared as different kind of symbol
/usr/src/linux/include/net/dst.h:58: previous declaration of tput'
{standard input}: Assembler messages:
{standard input}:9785: Error: symbol tput' is already defined
make: *** [sys-linux.o] Fehler 1

I am not an expert, but it looks to me as if the header files from libc and
the kernel are somehow jumbled up. I did compile libc about a year ago,
keeping the (then up to date) kernel headers in /usr/include/linux/include,
where they remain until now. I didn't overwrite this with the current
headers.

Please let me know what I'm doing wrong here.

TIA 
Andreas
