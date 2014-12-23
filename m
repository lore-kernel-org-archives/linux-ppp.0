From: "oht@openbsd.se" <ole.hellqvist@openbsd.se>
Date: Tue, 23 Dec 2014 08:06:57 +0000
Subject: pppd 2.4.7 for bsd
Message-Id: <20141223090657.a126d12db17e3a931dfe978a@openbsd.se>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi
I'm using pppd to connect to my ip provider via umts.
In the present OpenBSD there is a very old version of pppd included, 2.3.5.
In order to have my resolve.conf updated after switching to some wifi provider I needed the "usepeerdns".
It is not included in version 2.3.5.
Finding out that NetBSD is using a patched version of 2.4.4, I modified that for my OpenBSD. 
It worked for my purpose.
After that it was quite easy to upgrade it to your 2.4.7 level.
If it is of any use for you, I can provide diffs, new sys-bsd.c and new Makefile.bsd for 2.4.7
It works on OpenBSD and compiles on FreeBSD and NetBSD.
 -- 
oht@openbsd.se <ole.hellqvist@openbsd.se>
