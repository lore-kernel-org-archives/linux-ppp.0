From: Guillaume Nault <g.nault@alphalink.fr>
Date: Fri, 05 Jan 2018 18:27:00 +0000
Subject: Re: possible deadlock in ppp_dev_uninit
Message-Id: <20180105182700.GB1374@alphalink.fr>
List-Id: <linux-ppp.vger.kernel.org>
References: <001a11c006da57e7ff0561edda2b@google.com>
 <20180105181531.GA1374@alphalink.fr>
In-Reply-To: <20180105181531.GA1374@alphalink.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: syzbot <syzbot+367889b9c9e279219175@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, paulus@samba.org, syzkaller-bugs@googlegroups.com

On Fri, Jan 05, 2018 at 07:15:31PM +0100, Guillaume Nault wrote:
> That's probably worth a test anyway.
>
Copy/paste error :-/

Here's a version that should apply cleanly.

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git master

-------- 8< --------

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index d8e5747ff4e3..264d4af0bf69 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -1006,17 +1006,18 @@ static int ppp_unit_register(struct ppp *ppp, int unit, bool ifname_is_set)
 	if (!ifname_is_set)
 		snprintf(ppp->dev->name, IFNAMSIZ, "ppp%i", ppp->file.index);
 
+	mutex_unlock(&pn->all_ppp_mutex);
+
 	ret = register_netdevice(ppp->dev);
 	if (ret < 0)
 		goto err_unit;
 
 	atomic_inc(&ppp_unit_count);
 
-	mutex_unlock(&pn->all_ppp_mutex);
-
 	return 0;
 
 err_unit:
+	mutex_lock(&pn->all_ppp_mutex);
 	unit_put(&pn->units_idr, ppp->file.index);
 err:
 	mutex_unlock(&pn->all_ppp_mutex);
