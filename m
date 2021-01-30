From: Emil Renner Berthing <kernel@esmil.dk>
Date: Sat, 30 Jan 2021 23:47:21 +0000
Subject: [PATCH 0/9] drivers: net: update tasklet_init callers
Message-Id: <20210130234730.26565-1-kernel@esmil.dk>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-ppp@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>, Michael Grzeschik <m.grzeschik@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paul Mackerras <paulus@samba.org>, Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, Petko Manolov <petkan@nucleusys.com>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Jing Xiangfeng <jingxiangfeng@huawei.com>, Oliver Neukum <oneukum@suse.com>, linux-kernel@vger.kernel.org

This updates the remaining callers of tasklet_init() in drivers/net
to the new API introduced in 
commit 12cc923f1ccc ("tasklet: Introduce new initialization API")

All changes are done by coccinelle using the following semantic patch.
Coccinelle needs a little help parsing drivers/net/arcnet/arcnet.c

@ match @
type T;
T *container;
identifier tasklet;
identifier callback;
@@
	tasklet_init(&container->tasklet, callback, (unsigned long)container);

@ patch1 depends on match @
type match.T;
identifier match.tasklet;
identifier match.callback;
identifier data;
identifier container;
@@
-void callback(unsigned long data)
+void callback(struct tasklet_struct *t)
{
	...
-	T *container = (T *)data;
+	T *container = from_tasklet(container, t, tasklet);
	...
}

@ patch2 depends on match @
type match.T;
identifier match.tasklet;
identifier match.callback;
identifier data;
identifier container;
@@
-void callback(unsigned long data)
+void callback(struct tasklet_struct *t)
{
	...
-	T *container;
+	T *container = from_tasklet(container, t, tasklet);
	...
-	container = (T *)data;
	...
}

@ depends on (patch1 || patch2) @
match.T *container;
identifier match.tasklet;
identifier match.callback;
@@
-	tasklet_init(&container->tasklet, callback, (unsigned long)container);
+	tasklet_setup(&container->tasklet, callback);


Emil Renner Berthing (9):
  arcnet: use new tasklet API
  caif_virtio: use new tasklet API
  ifb: use new tasklet API
  ppp: use new tasklet API
  net: usb: hso: use new tasklet API
  net: usb: lan78xx: use new tasklet API
  net: usb: pegasus: use new tasklet API
  net: usb: r8152: use new tasklet API
  net: usb: rtl8150: use new tasklet API

 drivers/net/arcnet/arcnet.c    |  7 +++----
 drivers/net/caif/caif_virtio.c |  8 +++-----
 drivers/net/ifb.c              |  7 +++----
 drivers/net/ppp/ppp_async.c    |  8 ++++----
 drivers/net/ppp/ppp_synctty.c  |  8 ++++----
 drivers/net/usb/hso.c          | 10 +++++-----
 drivers/net/usb/lan78xx.c      |  6 +++---
 drivers/net/usb/pegasus.c      |  7 +++----
 drivers/net/usb/r8152.c        |  8 +++-----
 drivers/net/usb/rtl8150.c      |  6 +++---
 10 files changed, 34 insertions(+), 41 deletions(-)

-- 
2.30.0
