From: Allen <allen.lkml@gmail.com>
Date: Fri, 11 Sep 2020 05:57:16 +0000
Subject: Re: [PATCH 0/8] drivers: net: convert tasklets to use new tasklet_setup()
Message-Id: <CAOMdWSJohOLK023ZM-yTnZiNHdy2TfyyWV3+iuuQiALiYV2NLQ@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20200817084614.24263-1-allen.cryptic@gmail.com>
In-Reply-To: <20200817084614.24263-1-allen.cryptic@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: m.grzeschik@pengutronix.de, paulus@samba.org, oliver@neukum.org, woojung.huh@microchip.com, petkan@nucleusys.com, Kees Cook <keescook@chromium.org>, netdev@vger.kernel.org, linux-ppp@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org

David,
>
> Commit 12cc923f1ccc ("tasklet: Introduce new initialization API")'
> introduced a new tasklet initialization API. This series converts
> all the net/* drivers to use the new tasklet_setup() API
>
> Allen Pais (8):
>   net: dccp: convert tasklets to use new tasklet_setup() API
>   net: ipv4: convert tasklets to use new tasklet_setup() API
>   net: mac80211: convert tasklets to use new tasklet_setup() API
>   net: mac802154: convert tasklets to use new tasklet_setup() API
>   net: rds: convert tasklets to use new tasklet_setup() API
>   net: sched: convert tasklets to use new tasklet_setup() API
>   net: smc: convert tasklets to use new tasklet_setup() API
>   net: xfrm: convert tasklets to use new tasklet_setup() API
>
>  net/dccp/timer.c           | 10 +++++-----
>  net/ipv4/tcp_output.c      |  8 +++-----
>  net/mac80211/ieee80211_i.h |  4 ++--
>  net/mac80211/main.c        | 14 +++++---------
>  net/mac80211/tx.c          |  5 +++--
>  net/mac80211/util.c        |  5 +++--
>  net/mac802154/main.c       |  8 +++-----
>  net/rds/ib_cm.c            | 14 ++++++--------
>  net/sched/sch_atm.c        |  9 +++++----
>  net/smc/smc_cdc.c          |  6 +++---
>  net/smc/smc_wr.c           | 14 ++++++--------
>  net/xfrm/xfrm_input.c      |  7 +++----
>  12 files changed, 47 insertions(+), 57 deletions(-)
>
> --
> 2.17.1
>

Will you pick these up or should I send these out again when I
have fixed the two patches on the other thread.

Thanks,


-- 
       - Allen
