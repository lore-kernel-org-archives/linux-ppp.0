From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 14 Aug 2019 20:54:50 +0000
Subject: [PATCH v5 15/18] compat_ioctl: ppp: move simple commands into ppp_generic.c
Message-Id: <20190814205521.122180-6-arnd@arndb.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <20190814204259.120942-1-arnd@arndb.de>
In-Reply-To: <20190814204259.120942-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org

All ppp commands that are not already handled in ppp_compat_ioctl()
are compatible, so they can now handled by calling the native
ppp_ioctl() directly.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/ppp/ppp_generic.c |  4 ++++
 fs/compat_ioctl.c             | 32 --------------------------------
 2 files changed, 4 insertions(+), 32 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 6b4e227cb002..ea1507c7c40e 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -903,6 +903,10 @@ static long ppp_compat_ioctl(struct file *file, unsigned int cmd, unsigned long
 	}
 	mutex_unlock(&ppp_mutex);
 
+	/* all other commands have compatible arguments */
+	if (err = -ENOIOCTLCMD)
+		err = ppp_ioctl(file, cmd, (unsigned long)compat_ptr(arg));
+
 	return err;
 }
 #endif
diff --git a/fs/compat_ioctl.c b/fs/compat_ioctl.c
index f97cf698cfdd..3d127bb6357a 100644
--- a/fs/compat_ioctl.c
+++ b/fs/compat_ioctl.c
@@ -144,38 +144,6 @@ COMPATIBLE_IOCTL(SG_GET_REQUEST_TABLE)
 COMPATIBLE_IOCTL(SG_SET_KEEP_ORPHAN)
 COMPATIBLE_IOCTL(SG_GET_KEEP_ORPHAN)
 #endif
-/* PPP stuff */
-COMPATIBLE_IOCTL(PPPIOCGFLAGS)
-COMPATIBLE_IOCTL(PPPIOCSFLAGS)
-COMPATIBLE_IOCTL(PPPIOCGASYNCMAP)
-COMPATIBLE_IOCTL(PPPIOCSASYNCMAP)
-COMPATIBLE_IOCTL(PPPIOCGUNIT)
-COMPATIBLE_IOCTL(PPPIOCGRASYNCMAP)
-COMPATIBLE_IOCTL(PPPIOCSRASYNCMAP)
-COMPATIBLE_IOCTL(PPPIOCGMRU)
-COMPATIBLE_IOCTL(PPPIOCSMRU)
-COMPATIBLE_IOCTL(PPPIOCSMAXCID)
-COMPATIBLE_IOCTL(PPPIOCGXASYNCMAP)
-COMPATIBLE_IOCTL(PPPIOCSXASYNCMAP)
-COMPATIBLE_IOCTL(PPPIOCXFERUNIT)
-/* PPPIOCSCOMPRESS is translated */
-COMPATIBLE_IOCTL(PPPIOCGNPMODE)
-COMPATIBLE_IOCTL(PPPIOCSNPMODE)
-COMPATIBLE_IOCTL(PPPIOCGDEBUG)
-COMPATIBLE_IOCTL(PPPIOCSDEBUG)
-/* PPPIOCSPASS is translated */
-/* PPPIOCSACTIVE is translated */
-COMPATIBLE_IOCTL(PPPIOCGIDLE32)
-COMPATIBLE_IOCTL(PPPIOCGIDLE64)
-COMPATIBLE_IOCTL(PPPIOCNEWUNIT)
-COMPATIBLE_IOCTL(PPPIOCATTACH)
-COMPATIBLE_IOCTL(PPPIOCDETACH)
-COMPATIBLE_IOCTL(PPPIOCSMRRU)
-COMPATIBLE_IOCTL(PPPIOCCONNECT)
-COMPATIBLE_IOCTL(PPPIOCDISCONN)
-COMPATIBLE_IOCTL(PPPIOCATTCHAN)
-COMPATIBLE_IOCTL(PPPIOCGCHAN)
-COMPATIBLE_IOCTL(PPPIOCGL2TPSTATS)
 };
 
 /*
-- 
2.20.0
