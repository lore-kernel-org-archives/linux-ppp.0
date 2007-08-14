From: "Gilles Espinasse" <g.esp@free.fr>
Date: Tue, 14 Aug 2007 18:23:50 +0000
Subject: ppp_async kfree patch
Message-Id: <2fa101c7dea0$43531340$f9b5a8c0@pii350>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

It has been reported in this thread
https://sourceforge.net/tracker/index.php?func=DEtail&aid=1678777&group_id@=
604&atidB8519

that a one line patch on ppp_async avoid crash and reboot

This happen with hight speed connection and usbserial using
http://www.junxion.com/opensource/linux_highspeed_usbserial.html patch

Here is the patch against 2.4.34 a few lines after  We have finished the
packet.
Code is the same on 2.6.22 and look not have been changed until 2.6.23.rc3

--- linux-2.4.34/drivers/net/ppp_async.c.old 2007-06-30 17:56:40.000000000
-0700
+++ linux-2.4.34/drivers/net/ppp_async.c 2007-06-30 17:57:07.000000000
-0700
@@ -624,7 +624,7 @@
  *buf++ =3D PPP_FLAG;
  ap->olim =3D buf;

- kfree_skb(ap->tpkt);
+ dev_kfree_skb_any(ap->tpkt);
  ap->tpkt =3D 0;
  return 1;
 }

Comment welcome.

Gilles

