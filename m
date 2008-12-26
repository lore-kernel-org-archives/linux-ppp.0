From: "Alexey Mahotkin" <squadette@gmail.com>
Date: Fri, 26 Dec 2008 12:39:18 +0000
Subject: pppd 2.4.4 hangs in ioctl(fd, TIOCSETD, N_TTY), Linux 2.6.21
Message-Id: <bb5b640b0812260439y18e5dae4n2313c92151300133@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

hi,

we have lots of pppd processes in tty_ioctl state:

[root@pptp ~]# cat /proc/633/wchan
tty_ioctl

strace says:
[root@pptp ~]# strace -p 633
Process 633 attached - interrupt to quit
ioctl(8, TIOCSETD <unfinished ...>
Process 633 detached

GDB says that they are inside of tty_disestablish_ppp:

(gdb) bt
#0  0x00fec402 in __kernel_vsyscall ()
#1  0x0056f8d9 in ioctl () from /lib/i686/nosegneg/libc.so.6
#2  0x80025034 in tty_disestablish_ppp () from /usr/sbin/pppd
#3  0x8001dbc6 in link_terminated () from /usr/sbin/pppd
#4  0x8000f4ef in ?? () from /usr/sbin/pppd
#5  0x8000d2f8 in fsm_input () from /usr/sbin/pppd
#6  0x8000f1cd in ?? () from /usr/sbin/pppd
#7  0x8000c3c2 in main () from /usr/sbin/pppd
(gdb) quit

So, the code in question is:

/*
 * Restore the previous line discipline
 */
        if (ioctl(tty_fd, TIOCSETD, &tty_disc) < 0) {
            if ( ! ok_error (errno))
                error("ioctl(TIOCSETD, N_TTY): %m (line %d)", __LINE__);
        }

We are running Fedora Core 8:

[root@pptp ~]# uname  -a
Linux pptp 2.6.21-2950.fc8xen #1 SMP Tue Oct 23 12:24:34 EDT 2007 i686
i686 i386 GNU/Linux


which uses the most recent pppd:

[root@pptp ~]# rpm -qi ppp
Name        : ppp                          Relocations: (not relocatable)
Version     : 2.4.4                             Vendor: (none)
Release     : 3                             Build Date: Tue 08 Apr
2008 12:57:11 PM MSD



This bug seems to be rather old.  Here is the extensive analysis from 2005:

http://lkml.org/lkml/2005/2/15/244

There are also some other similar reports scattered around the internet.


Could something be done about it?  Maybe some work-around in pppd
itself?     We have 50+ such processes on our machine, and we do not
understand how it will affect our performance.


Thank you,

--=20
=D0=90=D0=BB=D0=B5=D0=BA=D1=81=D0=B5=D0=B9 =D0=9C=D0=B0=D1=85=D0=BE=D1=82=
=D0=BA=D0=B8=D0=BD
http://squadette.ru/
=FF=F4=E8=BA{.n=C7+=89=B7=9F=AE=89=AD=86+%=8A=CB=FF=B1=E9=DD=B6=17=A5=8Aw=
=FF=BA{.n=C7+=89=B7=A5=8A{=B1=FE=9Ai=FE)=ED=85=E6=E8w*=1Fjg=AC=B1=A8=1E=B6=
=89=9A=8E=8A=DD=A2j=FF=BE=07=AB=FEG=AB=9D=E9=FF=A2=B8=0C=A2=B7=A6j:+v=89=A8=
=8Aw=E8j=D8m=B6=9F=FF=FE=F8=1E=AF=F9=1E=AEw=A5=FE=8A=E0=FEf=A3=A2=B7h=9A=8F=
=E2=9D=FA=FF=86=D9=A5
