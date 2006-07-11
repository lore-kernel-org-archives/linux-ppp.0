From: "J Richard Glass" <richard@mikeradford.org>
Date: Tue, 11 Jul 2006 17:13:58 +0000
Subject: perl implementation of passwordfd.so
Message-Id: <34510.10.92.1.103.1152638038.squirrel@mail.mikeradford.org>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

I was working with the C example for the passwordfd.so plugin and got
it to work with a dial up ppp connection but I really want to use this
plugin with perl. So I am hoping that someone on this list has some
experience using perl with passwordfd.

I keep getting the error... "Can't read secret from fd". I've set up
my script to fork and create a pipe to a READER file handle and a
WRITER file handle. I write to the password to the WRITER FH (close
the handle) and pass the file descriptor (fileno READER) to pppd in an
exec(). The interaction with the modem works and the last message I
get is Connect: ppp0 <--> /dev/ttyS0 before the error can't read from
fd.

Any help would be greatly appreciated.

Thanks.

Richard

Here's the gist in code and the resulting OUTPUT:

  defined(my $pid = fork) or die "Can't fork: $!";
  if ($pid > 0) {
    pipe(PPPD_RDR, PPPD_WTR) || die "pipe failed: $!";

    PPPD_WTR->autoflush(1);
    close PPPD_WTR;

    my $fn = fileno PPPD_RDR;

    my $pppd_connect = "pppd call pwfd-test $device $flowcontrol user
$username passwordfd $fn connect '$chatscript' $route" ;

    exec($pppd_connect) || die "can't exec program: $!";
  }


OUTPUT
Plugin passwordfd.so loaded.

NO CARRIER
ATZ
OK
ATQ0 V1 E1 S0=0 &C1 &D2 +FCLASS=0
OK
ATDT912132706960
CONNECT 9600/ARQ/V34/LAPM

STATION ID - lsaca17rs05pr004,lsaca41ev

Welcome
Please Sign-on:Serial connection established.
Using interface ppp0
Connect: ppp0 <--> /dev/ttyS0
Can't read secret from fd
Can't read secret from fd
Can't read secret from fd
Can't read secret from fd
CHAP authentication failed
Modem hangup
Connection terminated.


