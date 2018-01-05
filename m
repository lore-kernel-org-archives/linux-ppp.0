From: Guillaume Nault <g.nault@alphalink.fr>
Date: Fri, 05 Jan 2018 18:15:31 +0000
Subject: Re: possible deadlock in ppp_dev_uninit
Message-Id: <20180105181531.GA1374@alphalink.fr>
List-Id: <linux-ppp.vger.kernel.org>
References: <001a11c006da57e7ff0561edda2b@google.com>
In-Reply-To: <001a11c006da57e7ff0561edda2b@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: syzbot <syzbot+367889b9c9e279219175@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, paulus@samba.org, syzkaller-bugs@googlegroups.com

On Wed, Jan 03, 2018 at 10:58:01PM -0800, syzbot wrote:
> Hello,
> 
> ======================
> WARNING: possible recursive locking detected
> 4.15.0-rc6-next-20180103+ #87 Not tainted
> --------------------------------------------
> syzkaller221540/3462 is trying to acquire lock:
>  (&pn->all_ppp_mutex){+.+.}, at: [<00000000709ea4fe>]
> ppp_dev_uninit+0x1be/0x390 drivers/net/ppp/ppp_generic.c:1369
> 
> but task is already holding lock:
>  (&pn->all_ppp_mutex){+.+.}, at: [<00000000752caad5>] ppp_unit_register
> drivers/net/ppp/ppp_generic.c:981 [inline]
>  (&pn->all_ppp_mutex){+.+.}, at: [<00000000752caad5>]
> ppp_dev_configure+0x6a4/0xc40 drivers/net/ppp/ppp_generic.c:1066
> 
ppp_unit_register() acquires pn->all_ppp_mutex while calling
register_netdevice(). If register_netdevice() fails, it can call
ppp_dev_uninit() which then tries to lock pn->all_ppp_mutex again.

Maybe unlocking pn->all_ppp_mutex before register_netdevice() would be
enough, but that'd make the unit visible while the PPP device isn't yet
registered. I'm going to check if that can be a problem.

That's probably worth a test anyway.

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git master

-------- 8< --------

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index d8e5747ff4e3..264d4af0bf69 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -1006,17 +1006,18 @@ static int ppp_unit_register(struct ppp *ppp, int unit, bool ifname_is_set)
        if (!ifname_is_set)
                snprintf(ppp->dev->name, IFNAMSIZ, "ppp%i", ppp->file.index);
 
+       mutex_unlock(&pn->all_ppp_mutex);
+
        ret = register_netdevice(ppp->dev);
        if (ret < 0)
                goto err_unit;
 
        atomic_inc(&ppp_unit_count);
 
-       mutex_unlock(&pn->all_ppp_mutex);
-
        return 0;
 
 err_unit:
+       mutex_lock(&pn->all_ppp_mutex);
        unit_put(&pn->units_idr, ppp->file.index);
 err:
        mutex_unlock(&pn->all_ppp_mutex);

