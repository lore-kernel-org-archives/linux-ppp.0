From: Allen Pais <allen.cryptic@gmail.com>
Date: Mon, 17 Aug 2020 08:58:02 +0000
Subject: [PATCH 0/8] drivers: net: convert tasklets to use new tasklet_setup()
Message-Id: <20200817084614.24263-1-allen.cryptic@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: m.grzeschik@pengutronix.de, davem@davemloft.net, paulus@samba.org, oliver@neukum.org, woojung.huh@microchip.com, petkan@nucleusys.com
Cc: keescook@chromium.org, netdev@vger.kernel.org, linux-ppp@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>

From: Allen Pais <allen.lkml@gmail.com>

Commit 12cc923f1ccc ("tasklet: Introduce new initialization API")'
introduced a new tasklet initialization API. This series converts 
all the net/* drivers to use the new tasklet_setup() API

Allen Pais (8):
  net: dccp: convert tasklets to use new tasklet_setup() API
  net: ipv4: convert tasklets to use new tasklet_setup() API
  net: mac80211: convert tasklets to use new tasklet_setup() API
  net: mac802154: convert tasklets to use new tasklet_setup() API
  net: rds: convert tasklets to use new tasklet_setup() API
  net: sched: convert tasklets to use new tasklet_setup() API
  net: smc: convert tasklets to use new tasklet_setup() API
  net: xfrm: convert tasklets to use new tasklet_setup() API

 net/dccp/timer.c           | 10 +++++-----
 net/ipv4/tcp_output.c      |  8 +++-----
 net/mac80211/ieee80211_i.h |  4 ++--
 net/mac80211/main.c        | 14 +++++---------
 net/mac80211/tx.c          |  5 +++--
 net/mac80211/util.c        |  5 +++--
 net/mac802154/main.c       |  8 +++-----
 net/rds/ib_cm.c            | 14 ++++++--------
 net/sched/sch_atm.c        |  9 +++++----
 net/smc/smc_cdc.c          |  6 +++---
 net/smc/smc_wr.c           | 14 ++++++--------
 net/xfrm/xfrm_input.c      |  7 +++----
 12 files changed, 47 insertions(+), 57 deletions(-)

-- 
2.17.1
