From: "Andrew Gaylard" <ag@computer.org>
Date: Thu, 09 Oct 2008 07:27:47 +0000
Subject: patch: allow COPTS to be specified to the radius plugin by the top level make
Message-Id: <9df6f3ea0810090027x289496f3safbad4e13daa81ac@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

The following little patch to the -2.4.4 tree allows the radius plugin
to be built with the same COPTS as the other parts of ppp.
Thus,
    make COPTS="-pipe -Wall -g"
at the top level will propagate down as expected.

Andrew

diff -rU5 ppp-2.4.4/pppd/plugins/radius/Makefile.linux
ppp-2.4.4-new/pppd/plugins/radius/Makefile.linux
--- ppp-2.4.4/pppd/plugins/radius/Makefile.linux        2006-06-04
05:04:14.000000000 +0000
+++ ppp-2.4.4-new/pppd/plugins/radius/Makefile.linux    2008-09-26
15:07:56.000000000 +0000
@@ -10,11 +10,12 @@
 VERSION = $(shell awk -F '"' '/VERSION/ { print $$2; }' ../../patchlevel.h)

 INSTALL        = install

 PLUGIN=radius.so radattr.so radrealms.so
-CFLAGS=-I. -I../.. -I../../../include -O2 -fPIC -DRC_LOG_FACILITY=LOG_DAEMON
+COPTS=-O2
+CFLAGS=-I. -I../.. -I../../../include $(COPTS) -fPIC
-DRC_LOG_FACILITY=LOG_DAEMON

 # Uncomment the next line to include support for Microsoft's
 # MS-CHAP authentication protocol.
 CHAPMS=y
 # Uncomment the next line to include support for MPPE.
