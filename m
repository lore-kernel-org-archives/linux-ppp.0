From: "Tomas Vadfors" <tomas_vadfors@hotmail.com>
Date: Tue, 28 Sep 2004 17:23:51 +0000
Subject: Problem with interface ppp0
Message-Id: <BAY12-F36sjCGvseE4D000072ea@hotmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Hello!

I've got a slight problem. I have always before been able to connect to the=
=20
internet using my 56K V90 modem. Setup in the program kppp has been=20
straightforward, but since I upgraded my Debian system to unstable (Sid) an=
d=20
built a new kernel (2.6.3) I have had a problem.

The modem dials, and seems to connect, but I can't go to any webpages. I=20
don't think it's a DNS-related problem, I think it has something to do with=
=20
the "interface" ppp0. Please observe that the connection is not abrupted=20
immediately, I've specified "noauth" somewhere rootish. This is the output =

from kppp in the xterm from which it was run:

Opener: received SetSecret
Opener: received SetSecret
Opener: received OpenLock

Opener: received OpenDevice
Opener: received ExecPPPDaemon
Kernel supports ppp alright.
pppd: using the noauth option requires root privilege
received unexpected SIGCHLD.
In parent: pppd pid 1114
Couldn't find interface ppp0: No such device
Couldn't find interface ppp0: No such device
Couldn't find interface ppp0: No such device
Couldn't find interface ppp0: No such device
     ....
    (this actually repeats over and over until I press Cancel in the kppp=20
window)

Opener: received RemoveSecret
Opener: received RemoveSecret
Opener: received OpenResolv
Opener: received OpenResolv
error opening resolv.conf!
Opener: received KillPPPDaemon
In killpppd(): Sending SIGTERM to 1114
Opener: received RemoveLock

Thanks for any help!

/Tomas

_________________________________________________________________
L=E4ttare att hitta dr=F6mresan med MSN Resor http://www.msn.se/resor/

