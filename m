From: Allen Pais <allen.lkml@gmail.com>
Date: Mon, 14 Sep 2020 07:43:19 +0000
Subject: [RESEND net-next v2 00/12]drivers: net: convert tasklets to use new tasklet_setup() API
Message-Id: <20200914073131.803374-1-allen.lkml@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net
Cc: m.grzeschik@pengutronix.de, kuba@kernel.org, paulus@samba.org, oliver@neukum.org, woojung.huh@microchip.com, UNGLinuxDriver@microchip.com, petkan@nucleusys.com, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-ppp@vger.kernel.org, Allen Pais <apais@linux.microsoft.com>

From: Allen Pais <apais@linux.microsoft.com>

ommit 12cc923f1ccc ("tasklet: Introduce new initialization API")'
introduced a new tasklet initialization API. This series converts
all the net/* drivers to use the new tasklet_setup() API

This series is based on v5.9-rc5

Allen Pais (12):
  net: mvpp2: Prepare to use the new tasklet API
  net: arcnet: convert tasklets to use new tasklet_setup() API
  net: caif: convert tasklets to use new tasklet_setup() API
  net: ifb: convert tasklets to use new tasklet_setup() API
  net: ppp: convert tasklets to use new tasklet_setup() API
  net: cdc_ncm: convert tasklets to use new tasklet_setup() API
  net: hso: convert tasklets to use new tasklet_setup() API
  net: lan78xx: convert tasklets to use new tasklet_setup() API
  net: pegasus: convert tasklets to use new tasklet_setup() API
  net: r8152: convert tasklets to use new tasklet_setup() API
  net: rtl8150: convert tasklets to use new tasklet_setup() API
  net: usbnet: convert tasklets to use new tasklet_setup() API

 drivers/net/arcnet/arcnet.c                     |  7 +++----
 drivers/net/caif/caif_virtio.c                  |  8 +++-----
 drivers/net/ethernet/marvell/mvpp2/mvpp2.h      |  1 +
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c |  1 +
 drivers/net/ifb.c                               |  7 +++----
 drivers/net/ppp/ppp_async.c                     |  8 ++++----
 drivers/net/ppp/ppp_synctty.c                   |  8 ++++----
 drivers/net/usb/cdc_ncm.c                       |  8 ++++----
 drivers/net/usb/hso.c                           | 10 +++++-----
 drivers/net/usb/lan78xx.c                       |  6 +++---
 drivers/net/usb/pegasus.c                       |  6 +++---
 drivers/net/usb/r8152.c                         |  8 +++-----
 drivers/net/usb/rtl8150.c                       |  6 +++---
 drivers/net/usb/usbnet.c                        |  3 +--
 14 files changed, 41 insertions(+), 46 deletions(-)

-- 
2.25.1
