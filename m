From: walter harms <wharms@bfs.de>
Date: Thu, 11 Mar 2010 17:08:19 +0000
Subject: fix compiler warning in 2.4.5
Message-Id: <4B992383.1060101@bfs.de>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org



cc -O2 -pipe -Wall -g -DHAVE_PATHS_H -DIPX_CHANGE -DHAVE_MMAP -I../include =
'-DDESTDIR=3D"/usr/local"' -DCHAPMS=3D1 -DMPPE=3D1 -DHAS_SHADOW -DHAVE
_CRYPT_H=3D1 -DUSE_CRYPT=3D1 -DHAVE_MULTILINK -DUSE_TDB=3D1 -DPLUGIN -DMAXO=
CTETS   -c -o sys-linux.o sys-linux.c
sys-linux.c: In function =91logwtmp=92:
sys-linux.c:2185: warning: passing argument 1 of =91time=92 from incompatib=
le pointer type

on 64bit time_t is 64bit

re,
 wh



--- sys-linux.c.org     2010-03-11 17:58:44.000000000 +0100
+++ sys-linux.c 2010-03-11 18:04:37.000000000 +0100
@@ -2160,7 +2160,7 @@
 #if __GLIBC__ < 2
     int    wtmp;
 #endif
-
+       time_t zeit;
 /*
  * Update the signon database for users.
  * Christoph Lameter: Copied from poeigl-1.36 Jan 3, 1996
@@ -2182,7 +2182,21 @@
     strncpy(ut.ut_user, name, sizeof(ut.ut_user));
     strncpy(ut.ut_line, line, sizeof(ut.ut_line));

-    time(&ut.ut_time);
+/*
+       ut_time is not what is seems to be:
+       # define ut_time        ut_tv.tv_sec
+
+       struct
+       {
+       int32_t tv_sec;             // Seconds.
+       int32_t tv_usec;            // Microseconds.
+       } ut_tv;                    // Time entry was made.
+
+       this will silence the compiler until 2036 when then earth stops
+*/
+
+    time(&zeit);
+    ut.ut_time=3D(int32_t)zeit;

     ut.ut_type =3D USER_PROCESS;
     ut.ut_pid  =3D mypid;


