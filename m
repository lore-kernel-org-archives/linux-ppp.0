From: Matteo Croce <matteo@openwrt.org>
Date: Fri, 20 Nov 2015 17:14:29 +0000
Subject: [PATCH v2] hostapd: add command to ban a station
Message-Id: <1448039669-19997-1-git-send-email-matteo@openwrt.org>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

When a station gets disassociated usually it will rejoin the AP.
Add a `ban' command that adds the station in the ACL exclude list
and disassociates it, to prevent it from automatically rejoin the AP.

Signed-off-by: Matteo Croce <matteo@openwrt.org>
---
 hostapd/config_file.c  |  8 --------
 hostapd/ctrl_iface.c   |  3 +++
 hostapd/hostapd_cli.c  | 19 +++++++++++++++++++
 src/ap/ap_config.c     | 10 ++++++++--
 src/ap/ap_config.h     |  1 +
 src/ap/ctrl_iface_ap.c | 25 +++++++++++++++++++++++++
 src/ap/ctrl_iface_ap.h |  2 ++
 7 files changed, 58 insertions(+), 10 deletions(-)

diff --git a/hostapd/config_file.c b/hostapd/config_file.c
index bf42466..36432f4 100644
--- a/hostapd/config_file.c
+++ b/hostapd/config_file.c
@@ -109,14 +109,6 @@ static int hostapd_config_read_vlan_file(struct hostapd_bss_config *bss,
 #endif /* CONFIG_NO_VLAN */
 
 
-static int hostapd_acl_comp(const void *a, const void *b)
-{
-	const struct mac_acl_entry *aa = a;
-	const struct mac_acl_entry *bb = b;
-	return os_memcmp(aa->addr, bb->addr, sizeof(macaddr));
-}
-
-
 static int hostapd_config_read_maclist(const char *fname,
 				       struct mac_acl_entry **acl, int *num)
 {
diff --git a/hostapd/ctrl_iface.c b/hostapd/ctrl_iface.c
index cb6fb17..5ad29c8 100644
--- a/hostapd/ctrl_iface.c
+++ b/hostapd/ctrl_iface.c
@@ -2122,6 +2122,9 @@ static int hostapd_ctrl_iface_receive_process(struct hostapd_data *hapd,
 	} else if (os_strncmp(buf, "DISASSOCIATE ", 13) = 0) {
 		if (hostapd_ctrl_iface_disassociate(hapd, buf + 13))
 			reply_len = -1;
+	} else if (os_strncmp(buf, "BAN ", 4) = 0) {
+		if (hostapd_ctrl_iface_ban(hapd, buf + 4))
+			reply_len = -1;
 	} else if (os_strcmp(buf, "STOP_AP") = 0) {
 		if (hostapd_ctrl_iface_stop_ap(hapd))
 			reply_len = -1;
diff --git a/hostapd/hostapd_cli.c b/hostapd/hostapd_cli.c
index 46c2f37..f063a90 100644
--- a/hostapd/hostapd_cli.c
+++ b/hostapd/hostapd_cli.c
@@ -65,6 +65,7 @@ static const char *const commands_help  "   new_sta <addr>       add a new station\n"
 "   deauthenticate <addr>  deauthenticate a station\n"
 "   disassociate <addr>  disassociate a station\n"
+"   ban <addr>           ban a station\n"
 #ifdef CONFIG_IEEE80211W
 "   sa_query <addr>      send SA Query to a station\n"
 #endif /* CONFIG_IEEE80211W */
@@ -348,6 +349,23 @@ static int hostapd_cli_cmd_disassociate(struct wpa_ctrl *ctrl, int argc,
 }
 
 
+static int hostapd_cli_cmd_ban(struct wpa_ctrl *ctrl, int argc,
+					  char *argv[])
+{
+	char buf[64];
+	if (argc < 1) {
+		printf("Invalid 'ban' command - exactly one "
+		       "argument, STA address, is required.\n");
+		return -1;
+	}
+	if (argc > 1)
+		os_snprintf(buf, sizeof(buf), "BAN %s %s",
+			    argv[0], argv[1]);
+	else
+		os_snprintf(buf, sizeof(buf), "BAN %s", argv[0]);
+	return wpa_ctrl_command(ctrl, buf);
+}
+
 #ifdef CONFIG_IEEE80211W
 static int hostapd_cli_cmd_sa_query(struct wpa_ctrl *ctrl, int argc,
 				    char *argv[])
@@ -1083,6 +1101,7 @@ static const struct hostapd_cli_cmd hostapd_cli_commands[] = {
 	{ "new_sta", hostapd_cli_cmd_new_sta },
 	{ "deauthenticate", hostapd_cli_cmd_deauthenticate },
 	{ "disassociate", hostapd_cli_cmd_disassociate },
+	{ "ban", hostapd_cli_cmd_ban },
 #ifdef CONFIG_IEEE80211W
 	{ "sa_query", hostapd_cli_cmd_sa_query },
 #endif /* CONFIG_IEEE80211W */
diff --git a/src/ap/ap_config.c b/src/ap/ap_config.c
index cf9b2ce..0b0c93c 100644
--- a/src/ap/ap_config.c
+++ b/src/ap/ap_config.c
@@ -201,11 +201,17 @@ int hostapd_mac_comp(const void *a, const void *b)
 	return os_memcmp(a, b, sizeof(macaddr));
 }
 
-
 int hostapd_mac_comp_empty(const void *a)
 {
 	macaddr empty = { 0 };
-	return os_memcmp(a, empty, sizeof(macaddr));
+	return hostapd_mac_comp(a, empty);
+}
+
+int hostapd_acl_comp(const void *a, const void *b)
+{
+	const struct mac_acl_entry *aa = a;
+	const struct mac_acl_entry *bb = b;
+	return hostapd_mac_comp(aa->addr, bb->addr);
 }
 
 
diff --git a/src/ap/ap_config.h b/src/ap/ap_config.h
index ff9dcb0..e165408 100644
--- a/src/ap/ap_config.h
+++ b/src/ap/ap_config.h
@@ -680,6 +680,7 @@ struct hostapd_config {
 
 int hostapd_mac_comp(const void *a, const void *b);
 int hostapd_mac_comp_empty(const void *a);
+int hostapd_acl_comp(const void *a, const void *b);
 struct hostapd_config * hostapd_config_defaults(void);
 void hostapd_config_defaults_bss(struct hostapd_bss_config *bss);
 void hostapd_config_free_eap_user(struct hostapd_eap_user *user);
diff --git a/src/ap/ctrl_iface_ap.c b/src/ap/ctrl_iface_ap.c
index c98978f..b804661 100644
--- a/src/ap/ctrl_iface_ap.c
+++ b/src/ap/ctrl_iface_ap.c
@@ -408,6 +408,31 @@ int hostapd_ctrl_iface_disassociate(struct hostapd_data *hapd,
 	return 0;
 }
 
+int hostapd_ctrl_iface_ban(struct hostapd_data *hapd,
+			   const char *txtaddr)
+{
+	u8 addr[ETH_ALEN];
+	struct mac_acl_entry *acl = hapd->conf->deny_mac;
+	int num_acl = hapd->conf->num_deny_mac + 1;
+
+	wpa_dbg(hapd->msg_ctx, MSG_DEBUG, "CTRL_IFACE BAN %s",
+		txtaddr);
+
+	if (hwaddr_aton(txtaddr, addr))
+		return -1;
+
+	hapd->conf->macaddr_acl = 0;
+
+	acl = os_realloc_array(acl, num_acl, sizeof(*acl));
+	os_memcpy(acl[num_acl - 1].addr, addr, ETH_ALEN);
+	acl[num_acl - 1].vlan_id = 0;
+	qsort(acl, num_acl, sizeof(*acl), hostapd_acl_comp);
+
+	hapd->conf->deny_mac = acl;
+	hapd->conf->num_deny_mac = num_acl;
+
+	return hostapd_ctrl_iface_disassociate(hapd, txtaddr);
+}
 
 int hostapd_ctrl_iface_status(struct hostapd_data *hapd, char *buf,
 			      size_t buflen)
diff --git a/src/ap/ctrl_iface_ap.h b/src/ap/ctrl_iface_ap.h
index e5297d0..c6801bf 100644
--- a/src/ap/ctrl_iface_ap.h
+++ b/src/ap/ctrl_iface_ap.h
@@ -19,6 +19,8 @@ int hostapd_ctrl_iface_deauthenticate(struct hostapd_data *hapd,
 				      const char *txtaddr);
 int hostapd_ctrl_iface_disassociate(struct hostapd_data *hapd,
 				    const char *txtaddr);
+int hostapd_ctrl_iface_ban(struct hostapd_data *hapd,
+				    const char *txtaddr);
 int hostapd_ctrl_iface_status(struct hostapd_data *hapd, char *buf,
 			      size_t buflen);
 int hostapd_parse_csa_settings(const char *pos,
-- 
2.5.0

