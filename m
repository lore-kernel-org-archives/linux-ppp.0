From: "C.J" <c.james.cj@gmail.com>
Date: Wed, 04 Jun 2008 01:17:37 +0000
Subject: cannot connect to pppoe socket
Message-Id: <200806040917337962954@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi all,

There is a test demo code for making a 'pppoe socket' and connect it. In my machine it cannot connect well but some others not.

>>>>>
code below(some headers are useless here):
#include <linux/types.h>
#include <syslog.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <linux/if.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>
#include <fcntl.h>
#include <signal.h>
#include <net/ethernet.h>
#include <net/if_arp.h>
#include <linux/ppp_defs.h>
#include <linux/in.h>
#include <linux/if_pppox.h>
int main(void)
{
	struct sockaddr_pppox sp;
	int sock;
	/* Make the session socket */
	sock = socket(AF_PPPOX, SOCK_STREAM, PX_PROTO_OE);

	sp.sa_family = AF_PPPOX;
	sp.sa_protocol = PX_PROTO_OE;
	sp.sa_addr.pppoe.sid = 1;
	memcpy(sp.sa_addr.pppoe.dev, "eth1", 16);
	memcpy(sp.sa_addr.pppoe.remote, "\x00\x00\x00\x00\x00\x00", 6);

	if (sock > 0)
		printf("socket succ\n");
	else
		return -1;

	if (connect(sock, (struct sockaddr *) &sp,
				sizeof(struct sockaddr_pppox)) < 0) {
		printf("connect err\n");
		return -1;
	}

	printf("connect succ\n");
	return 0;

}
<<<<<<<
Any info? I want to get 'pppoe socket' depend which environment.


Reg

--
c.j

