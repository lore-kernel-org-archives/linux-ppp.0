From: Jacek Kawa <jfk@zeus.polsl.gliwice.pl>
Date: Thu, 24 Mar 2005 09:46:01 +0000
Subject: 2.4.3 PPP persist doesn't work (2.4.2 ok)
Message-Id: <20050324094601.GA20847@finwe.eu.org>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Hello!

I dig through recent archives but found nothing similar except to:
http://marc.theaimsgroup.com/?l=linux-ppp&m0667783629803&w=2
but I'm not sure whether this could still be a problem with recent
snapshot or not...

Anyway... Not so long ago debian's pppd switched from 2.4.2 based
to 2.4.3 based and my problem with persist options have begun.
After modem power down-up,  ppp tries to reconnect, but fails and 
exits. 

I reported it already to Debian bug tracking system, but was suggested
to ask here as well.

Versions (marked as in Debian) tested with my 2.6.11ac4 kernel:
 2.4.2 +20040428 -6      works
 2.4.3 +20041231 -[12]   fails
 2.4.3 +20050321 -1      fails

Not to spam list too much I put relevant part of system logs and
strace logs here:

1. http://zeus.polsl.gliwice.pl/~jfk/ppp/log_bad.txt (2.4.3, system log)
2. http://zeus.polsl.gliwice.pl/~jfk/ppp/log_good.txt (2.4.2, system log)
3. http://zeus.polsl.gliwice.pl/~jfk/ppp/strace_bad.txt (2.4.3, strace)
4. http://zeus.polsl.gliwice.pl/~jfk/ppp/strace_good.txt (2.4.2, strace)

More inline details:

Ad 2:

11:38:21 pppd[23601]: Couldn't get channel number: Input/output error <---- power back, I guess
11:38:22 pppd[23601]: tcgetattr: No such device or address (line 909) <---- ??? absent in 2.4.2
11:38:22 kernel: eth0: link up, 100Mbps, full-duplex, lpa 0x45E1      <---- power is surely up
11:38:23 pppd[23601]: Exit. 

Ad 3: 

open("/dev/his", O_RDWR|O_NONBLOCK)     = 8
fcntl64(8, F_GETFL)                     = 0x802 (flags O_RDWR|O_NONBLOCK 
fcntl64(8, F_SETFL, O_RDWR)             = 0
ioctl(8, TIOCMBIS, [TIOCM_DTR])         = 0
ioctl(8, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbffff83c) = -1 ENXIO (No such device or address) 
                                                         ^^^^^ I cannot
							 see this in
							 a working one

Options:

/dev/his 115200   (it's plain /dev/ttyS0)
modem 
defaultroute 
lock 
crtscts 
noauth 
persist
lcp-echo-interval 6
lcp-echo-failure 3
user indis
maxfail 0


As in debian's dependency system:
ii  libc6                       2.3.2.ds1-20 GNU C Library: Shared libraries an
ii  libpam-modules              0.76-22      Pluggable Authentication Modules f
ii  libpam-runtime              0.76-22      Runtime support for the PAM librar
ii  libpam0g                    0.76-22      Pluggable Authentication Modules l
ii  libpcap0.7                  0.7.2-7      System interface for user-level pa
ii  libssl0.9.7                 0.9.7e-3     SSL shared libraries
ii  makedev                     2.3.1-76     creates device files in /dev
ii  netbase                     4.20         Basic TCP/IP networking system
ii  procps                      1:3.2.5-1    /proc file system utilities

Thanks!


-- 
Jacek Kawa
