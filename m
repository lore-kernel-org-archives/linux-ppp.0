From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Date: Sat, 07 Aug 2021 16:37:49 +0000
Subject: [PATCH] ppp: Add rtnl attribute IFLA_PPP_UNIT_ID for specifying ppp unit id
Message-Id: <20210807163749.18316-1-pali@kernel.org>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Guillaume Nault <gnault@redhat.com>
Cc: linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Currently there are two ways how to create a new ppp interface. Old method
via ioctl(PPPIOCNEWUNIT) and new method via rtnl RTM_NEWLINK/NLM_F_CREATE
which was introduced in v4.7 by commit 96d934c70db6 ("ppp: add rtnetlink
device creation support").

Old method allows userspace to specify preferred ppp unit id or let kernel
to choose some free ppp unit id. Newly created interface by the old method
will always have name composed of string "ppp" followed by ppp unit id.
Userspace later can rename interface via ioctl(SIOCSIFNAME).

New method via rtnl does not allow to specify ppp unit id and kernel always
choose some free one. But allows to specify interface name and therefore
atomically create interface with preferred name.

So based on requirement userspace needs to use either old method or new
method as none currently supports all options.

This change adds a new rtnl attribute IFLA_PPP_UNIT_ID which can be used
for specifying preferred ppp unit id during rtnl RTM_NEWLINK/NLM_F_CREATE
call. And therefore implements missing functionality which is already
provided by old ioctl(PPPIOCNEWUNIT) method.

By default kernel ignores unknown rtnl attributes, so userspace cannot
easily check if kernel understand this new IFLA_PPP_UNIT_ID or if will
ignore it.

Therefore in ppp_nl_validate() first validates content of IFLA_PPP_UNIT_ID
attribute and returns -EINVAL when ppp unit id is invalid. And after that
validates IFLA_PPP_DEV_FD (which returns -EBADFD on error).

This allows userspace to send RTM_NEWLINK/NLM_F_CREATE request with
negative IFLA_PPP_DEV_FD and non-negative IFLA_PPP_UNIT_ID to detect if
kernel supports IFLA_PPP_DEV_FD or not (based on -EINVAL / -EBADFD error
value).

Like in old ioctl(PPPIOCNEWUNIT) method treat special IFLA_PPP_UNIT_ID
value -1 to let kernel choose some free ppp unit id. It is same behavior
like when IFLA_PPP_UNIT_ID is not specified at all. Later userspace can use
ioctl(PPPIOCGUNIT) to query which ppp unit id kernel chose.

As this is a new code kernel does not have to overwrite and hide error code
from ppp_unit_register() when using new rtnl method. So overwrite error
code to -EEXIST only when creating a new interface via old ioctl method.

With this change rtnl RTM_NEWLINK/NLM_F_CREATE can be finally full-feature
replacement for the old ioctl(PPPIOCNEWUNIT) method for creating new ppp
network interface.

Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>
---
 drivers/net/ppp/ppp_generic.c      | 29 ++++++++++++++++++++++-------
 include/uapi/linux/if_link.h       |  2 ++
 tools/include/uapi/linux/if_link.h |  2 ++
 3 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 9506abd8d7e1..bb122ff9d5cf 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -1147,7 +1147,7 @@ static struct pernet_operations ppp_net_ops =3D {
 	.size =3D sizeof(struct ppp_net),
 };
=20
-static int ppp_unit_register(struct ppp *ppp, int unit, bool ifname_is_set)
+static int ppp_unit_register(struct ppp *ppp, int unit, bool ifname_is_set=
, bool rewrite_error)
 {
 	struct ppp_net *pn =3D ppp_pernet(ppp->ppp_net);
 	int ret;
@@ -1181,8 +1181,10 @@ static int ppp_unit_register(struct ppp *ppp, int un=
it, bool ifname_is_set)
 		}
 		ret =3D unit_set(&pn->units_idr, ppp, unit);
 		if (ret < 0) {
-			/* Rewrite error for backward compatibility */
-			ret =3D -EEXIST;
+			if (rewrite_error) {
+				/* Rewrite error for backward compatibility */
+				ret =3D -EEXIST;
+			}
 			goto err;
 		}
 	}
@@ -1211,7 +1213,7 @@ static int ppp_unit_register(struct ppp *ppp, int uni=
t, bool ifname_is_set)
 }
=20
 static int ppp_dev_configure(struct net *src_net, struct net_device *dev,
-			     const struct ppp_config *conf)
+			     const struct ppp_config *conf, bool rewrite_error)
 {
 	struct ppp *ppp =3D netdev_priv(dev);
 	int indx;
@@ -1249,7 +1251,7 @@ static int ppp_dev_configure(struct net *src_net, str=
uct net_device *dev,
 	ppp->active_filter =3D NULL;
 #endif /* CONFIG_PPP_FILTER */
=20
-	err =3D ppp_unit_register(ppp, conf->unit, conf->ifname_is_set);
+	err =3D ppp_unit_register(ppp, conf->unit, conf->ifname_is_set, rewrite_e=
rror);
 	if (err < 0)
 		goto err2;
=20
@@ -1264,6 +1266,7 @@ static int ppp_dev_configure(struct net *src_net, str=
uct net_device *dev,
=20
 static const struct nla_policy ppp_nl_policy[IFLA_PPP_MAX + 1] =3D {
 	[IFLA_PPP_DEV_FD]	=3D { .type =3D NLA_S32 },
+	[IFLA_PPP_UNIT_ID]	=3D { .type =3D NLA_S32 },
 };
=20
 static int ppp_nl_validate(struct nlattr *tb[], struct nlattr *data[],
@@ -1274,6 +1277,15 @@ static int ppp_nl_validate(struct nlattr *tb[], stru=
ct nlattr *data[],
=20
 	if (!data[IFLA_PPP_DEV_FD])
 		return -EINVAL;
+
+	/* Check for IFLA_PPP_UNIT_ID before IFLA_PPP_DEV_FD to allow userspace
+	 * detect if kernel supports IFLA_PPP_UNIT_ID or not by specifying
+	 * negative IFLA_PPP_DEV_FD. Previous kernel versions ignored
+	 * IFLA_PPP_UNIT_ID attribute.
+	 */
+	if (data[IFLA_PPP_UNIT_ID] && nla_get_s32(data[IFLA_PPP_UNIT_ID]) < -1)
+		return -EINVAL;
+
 	if (nla_get_s32(data[IFLA_PPP_DEV_FD]) < 0)
 		return -EBADF;
=20
@@ -1295,6 +1307,9 @@ static int ppp_nl_newlink(struct net *src_net, struct=
 net_device *dev,
 	if (!file)
 		return -EBADF;
=20
+	if (data[IFLA_PPP_UNIT_ID])
+		conf.unit =3D nla_get_s32(data[IFLA_PPP_UNIT_ID]);
+
 	/* rtnl_lock is already held here, but ppp_create_interface() locks
 	 * ppp_mutex before holding rtnl_lock. Using mutex_trylock() avoids
 	 * possible deadlock due to lock order inversion, at the cost of
@@ -1320,7 +1335,7 @@ static int ppp_nl_newlink(struct net *src_net, struct=
 net_device *dev,
 	if (!tb[IFLA_IFNAME] || !nla_len(tb[IFLA_IFNAME]) || !*(char *)nla_data(t=
b[IFLA_IFNAME]))
 		conf.ifname_is_set =3D false;
=20
-	err =3D ppp_dev_configure(src_net, dev, &conf);
+	err =3D ppp_dev_configure(src_net, dev, &conf, false);
=20
 out_unlock:
 	mutex_unlock(&ppp_mutex);
@@ -3300,7 +3315,7 @@ static int ppp_create_interface(struct net *net, stru=
ct file *file, int *unit)
=20
 	rtnl_lock();
=20
-	err =3D ppp_dev_configure(net, dev, &conf);
+	err =3D ppp_dev_configure(net, dev, &conf, true);
 	if (err < 0)
 		goto err_dev;
 	ppp =3D netdev_priv(dev);
diff --git a/include/uapi/linux/if_link.h b/include/uapi/linux/if_link.h
index 91c8dda6d95d..6767bd7f39b9 100644
--- a/include/uapi/linux/if_link.h
+++ b/include/uapi/linux/if_link.h
@@ -794,6 +794,8 @@ enum {
 enum {
 	IFLA_PPP_UNSPEC,
 	IFLA_PPP_DEV_FD,
+	IFLA_PPP_UNIT_ID,
+#define IFLA_PPP_UNIT_ID IFLA_PPP_UNIT_ID
 	__IFLA_PPP_MAX
 };
 #define IFLA_PPP_MAX (__IFLA_PPP_MAX - 1)
diff --git a/tools/include/uapi/linux/if_link.h b/tools/include/uapi/linux/=
if_link.h
index d208b2af697f..53a4d7d632f1 100644
--- a/tools/include/uapi/linux/if_link.h
+++ b/tools/include/uapi/linux/if_link.h
@@ -600,6 +600,8 @@ enum ifla_geneve_df {
 enum {
 	IFLA_PPP_UNSPEC,
 	IFLA_PPP_DEV_FD,
+	IFLA_PPP_UNIT_ID,
+#define IFLA_PPP_UNIT_ID IFLA_PPP_UNIT_ID
 	__IFLA_PPP_MAX
 };
 #define IFLA_PPP_MAX (__IFLA_PPP_MAX - 1)
--=20
2.20.1
