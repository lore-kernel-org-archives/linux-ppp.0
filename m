From: "Marco d'Itri" <md@linux.it>
Date: Sun, 19 Aug 2007 01:37:48 +0000
Subject: [patch 08/14] support building pppdump with the system zlib
Message-Id: <20070819014009.527792661@bongo.bofh.it>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

--- a/pppdump/Makefile.linux
+++ b/pppdump/Makefile.linux
@@ -2,15 +2,40 @@ DESTDIR = $(INSTROOT)@DESTDIR@
 BINDIR = $(DESTDIR)/sbin
 MANDIR = $(DESTDIR)/share/man/man8
 
-CFLAGS= -O -I../include/net
-OBJS = pppdump.o bsd-comp.o deflate.o zlib.o
+DO_DEFLATE=y
+DO_BSD_COMPRESS=y
+HAVE_ZLIB=n
+
+OPTS := -O2 -Wall
+CFLAGS := -I../include/net
+OBJS := pppdump.o
+LIBS :+
+ifdef DO_DEFLATE
+CFLAGS += -DDO_DEFLATE=1
+OBJS += deflate.o
+ifdef HAVE_ZLIB
+LIBS += -lz
+else
+OBJS += zlib.o
+endif
+else
+CFLAGS += -DDO_DEFLATE=0
+endif
+
+ifdef DO_BSD_COMPRESS
+CFLAGS += -DDO_BSD_COMPRESS=1
+OBJS += bsd-comp.o
+else
+CFLAGS += -DDO_BSD_COMPRESS=0
+endif
 
 INSTALL= install
 
 all:	pppdump
 
 pppdump: $(OBJS)
-	$(CC) -o pppdump $(OBJS)
+	$(CC) $(CFLAGS) $(OPTS) -o pppdump $(OBJS) $(LIBS)
 
 clean:
 	rm -f pppdump $(OBJS) *~

-- 
ciao,
Marco

