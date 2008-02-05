From: "Rami Rosen" <ramirose@gmail.com>
Date: Tue, 05 Feb 2008 12:35:29 +0000
Subject: Fwd: [PATCH] [PPPOL2TP] Label unused warning when CONFIG_PROC_FS is not set.
Message-Id: <eb3ff54b0802050435n7cef121dk3ed1ad46ac12d273@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----=_Part_6632_27900867.1202214929479"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org

------=_Part_6632_27900867.1202214929479
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

---------- Forwarded message ----------
From: Rami Rosen <ramirose@gmail.com>
Date: Feb 5, 2008 2:15 PM
Subject: [PATCH] [PPPOL2TP] Label unused warning when CONFIG_PROC_FS is not set.
To: netdev@vger.kernel.org, jeff@garzik.org, linux-kernel@vger.kernel.org


Hi,

When CONFIG_PROC_FS is not set and CONFIG_PPPOL2TP is set,
we have the following warning in build:
  drivers/net/pppol2tp.c: In function 'pppol2tp_init':
  drivers/net/pppol2tp.c:2472: warning: label
'out_unregister_pppox_proto' defined but not used

This patch fixes this warning by adding appropriate #ifdef.

Regards,
Rami Rosen


Signed-off-by: Rami Rosen <ramirose@gmail.com>

------=_Part_6632_27900867.1202214929479
Content-Type: text/plain; name=patch.txt
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fcaexqwq0
Content-Disposition: attachment; filename=patch.txt

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3BwcG9sMnRwLmMgYi9kcml2ZXJzL25ldC9wcHBvbDJ0
cC5jCmluZGV4IDFiNTFiYjYuLjVhYTBhODAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3BwcG9s
MnRwLmMKKysrIGIvZHJpdmVycy9uZXQvcHBwb2wydHAuYwpAQCAtMjQ2OCw5ICsyNDY4LDEwIEBA
IHN0YXRpYyBpbnQgX19pbml0IHBwcG9sMnRwX2luaXQodm9pZCkKIAogb3V0OgogCXJldHVybiBl
cnI7Ci0KKyNpZmRlZiBDT05GSUdfUFJPQ19GUwogb3V0X3VucmVnaXN0ZXJfcHBwb3hfcHJvdG86
CiAJdW5yZWdpc3Rlcl9wcHBveF9wcm90byhQWF9QUk9UT19PTDJUUCk7CisjZW5kaWYKIG91dF91
bnJlZ2lzdGVyX3BwcG9sMnRwX3Byb3RvOgogCXByb3RvX3VucmVnaXN0ZXIoJnBwcG9sMnRwX3Nr
X3Byb3RvKTsKIAlnb3RvIG91dDsK
------=_Part_6632_27900867.1202214929479--
