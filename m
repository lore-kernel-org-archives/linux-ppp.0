From: "Leslie Rhorer" <lrhorer@satx.rr.com>
Date: Thu, 21 Jan 2010 02:47:55 +0000
Subject: RE: pppd hangs on SIGHUP
Message-Id: <A5.E6.02205.250C75B4@cdptpa-omtalb.mail.rr.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <8D.DA.01403.892965B4@cdptpa-omtalb.mail.rr.com>
In-Reply-To: <8D.DA.01403.892965B4@cdptpa-omtalb.mail.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


> >
> > If you attach a debugger to it, can you find out where it's stuck?  (Or
> > at least run "pstack `pgrep pppd`"?)
> 
> 	I'll try  that.  Right now the system is in the middle of a 72 hour
> test, but after that I'll force a hang and see what I get.
> 
> 
> > The symptoms sound like a kernel bug, but it's hard to tell.
> 

	Well, I set pppd to disconnect after 11 hours, 17 minutes, 11
seconds, and when it did, the process hung, again.  It won't respond to
SIGTERM or SIGHUP.  The command "pstack `pgrep pppd`" returns:


2875: /usr/sbin/pppd call cricket
(No symbols found)
0xb7f14424: ???? (8, 2, 808e580, bff2eaa8, 97aeea0, 97aeeb8)
0x08069654: ???? (8, ffffffff)
0x0806d751: ???? (807bee4, 0, 0, bff2eaf8, 808b884, ffffffff)
0x08062ca9: ???? (0, 0, 0, 806656f, 80813ae, 807c098) + 10
0x0805164b: ???? (80905e0, 80905e4, c, b3b, 0, c) + b0
0x0805226f: ???? (807bc70, 804f930, bff2ec38, b7d50455, 3, bff2ec64) + 50
0xb7d50455: ???? (8051890, 3, bff2ec64, 807bc70, 807bc60, b7f23250) +
400d13a8

	Here is the output from lsof for pppd:

pppd       2875       root  cwd       DIR        3,2    4096          2 /
pppd       2875       root  rtd       DIR        3,2    4096          2 /
pppd       2875       root  txt       REG        3,2  269156     300045
/usr/sbin/pppd
pppd       2875       root  mem       REG        3,2   42504     246945
/lib/i686/cmov/libnss_files-2.7.so
pppd       2875       root  mem       REG        3,2   38444     246947
/lib/i686/cmov/libnss_nis-2.7.so
pppd       2875       root  mem       REG        3,2   87800     246942
/lib/i686/cmov/libnsl-2.7.so
pppd       2875       root  mem       REG        3,2   30436     246943
/lib/i686/cmov/libnss_compat-2.7.so
pppd       2875       root  mem       REG        3,2 1413540     246936
/lib/i686/cmov/libc-2.7.so
pppd       2875       root  mem       REG        3,2  166340      99420
/usr/lib/libpcap.so.0.9.8
pppd       2875       root  mem       REG        3,2    9680     246939
/lib/i686/cmov/libdl-2.7.so
pppd       2875       root  mem       REG        3,2   40440     237629
/lib/libpam.so.0.81.12
pppd       2875       root  mem       REG        3,2   38296     246938
/lib/i686/cmov/libcrypt-2.7.so
pppd       2875       root  mem       REG        3,2    8192     319525
/var/run/pppd2.tdb
pppd       2875       root  mem       REG        3,2  113248     237570
/lib/ld-2.7.so
pppd       2875       root    0u      CHR        1,3                586
/dev/null
pppd       2875       root    1u      CHR        1,3                586
/dev/null
pppd       2875       root    2u      CHR        1,3                586
/dev/null
pppd       2875       root    3u     unix 0xd391e900               8193
socket
pppd       2875       root    4u      CHR        1,3                586
/dev/null
pppd       2875       root    5u     sock        0,4               8204
can't identify protocol
pppd       2875       root    6u     sock        0,4               8205
can't identify protocol
pppd       2875       root    7u      REG        3,2    8192     319525
/var/run/pppd2.tdb
pppd       2875       root    8u      CHR      166,0               4814
/dev/ttyACM0
grep       9141       root    1w      REG        3,2     475     308542
/etc/ppp/pppdhang.txt

	I am not deeply familiar with Linux.  What is a good debugger
available for it, preferably from a Debian mirror?

