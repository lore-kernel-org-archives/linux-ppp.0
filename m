From: Paul Mackerras <paulus@samba.org>
Date: Sat, 14 Nov 2009 05:47:00 +0000
Subject: Re: getting the device of the ppp connection
Message-Id: <19198.17492.726818.469611@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <dac45060911130554u31df1580x13d2c901372567af@mail.gmail.com>
In-Reply-To: <dac45060911130554u31df1580x13d2c901372567af@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Mark Ryden writes:

>   Is there a way from user space to know which device is the one which
> the ppp connection uses ?

Yes, that information is in the tdb database (/var/run/pppd2.tdb).
As an example, here is the list of records in /var/run/pppd2.tdb for
my gateway machine (IP addresses obscured):

DEVICE=eth0: pppd2480
IPREMOTE=xx.xx.xx.xx: pppd2480
IFNAME=ppp0: pppd2480
pppd2480:  ORIG_UID=0;PPPD_PID$83;PPPLOGNAME=root;DEVICE=eth0;LINKNAME=transact;IPLOCAL=yy.yy.yy.yy;IPREMOTE=xx.xx.xx.xx;IFNAME=ppp0
LINKNAME=transact: pppd2480
PPPD_PID$83: pppd2480

That is for one connection.

Below is the source for the little "tdbdump" program that I used to
print the above.  It needs to be linked with pppd/tdb.o and
pppd/spinlock.o.

It wouldn't be hard to write a program to use the lookup routines
in pppd/tdb.c and extract the underlying device for a given ppp
interface.

Paul.

#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <signal.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/time.h>
#include "tdb.h"

static int print_rec(TDB_CONTEXT *tdb, TDB_DATA key, TDB_DATA dbuf, void *p)
{
	printf("%*.*s: %*.*s\n", 
	       (int)key.dsize, (int)key.dsize, key.dptr, 
	       (int)dbuf.dsize, (int)dbuf.dsize, dbuf.dptr);
	return 0;
}

main(int ac, char **av)
{
	TDB_CONTEXT *tdb;

	if (ac != 2) {
		fprintf(stderr, "Usage: %s database\n", av[0]);
		exit(1);
	}

	tdb = tdb_open(av[1], 0, 0, O_RDONLY, 0600);
	if (tdb = 0) {
		perror(av[1]);
		exit(1);
	}

	tdb_traverse(tdb, print_rec, NULL);

	exit(0);
}
