From: Eivind Naess <enaess@gmail.com>
Date: Fri, 03 Apr 2020 15:09:11 +0000
Subject: [PATCH] Adding EAP-MSCHAPv2 support
Message-Id: <CAKuzOkiM0Z9DV9LofTtgAi3bEfxzqk0BLm-QpQq0CLHVdT5aAw@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Implementation based on the RFC: draft-kamath-pppext-eap-mschapv2-02.
Adding support for MSCHAPv2 inside the extensible authentication protocol (EAP).

Author: Thomas Omerzu <thomas@omerzu.de>
Origin: https://w3logistics.com/blog/archives/438-EAP-MSCHAPv2-for-pppd-2-4-7.html
Bug: https://github.com/paulusmack/ppp/issues/138
Bug-Ubuntu: https://bugs.launchpad.net/ubuntu/+source/ppp/+bug/1858349
Pull Request: https://github.com/paulusmack/ppp/pull/139
Last-Update: 2020-02-24
Signed-off-by: Thomas Omerzu <thomas@omerzu.de>.
---
 pppd/eap.c | 143 +++++++++++++++++++++++++++++++++++++++++++++++++++--
 pppd/eap.h |  12 +++++
 2 files changed, 152 insertions(+), 3 deletions(-)

diff --git a/pppd/eap.c b/pppd/eap.c
index 082e953..7b63452 100644
--- a/pppd/eap.c
+++ b/pppd/eap.c
@@ -64,6 +64,9 @@
 #include "pathnames.h"
 #include "md5.h"
 #include "eap.h"
+#ifdef CHAPMS
+#include "chap_ms.h"
+#endif

 #ifdef USE_SRP
 #include <t_pwd.h>
@@ -1302,6 +1305,47 @@ int len, id;
 }
 #endif /* USE_SRP */

+#if CHAPMS
+/*
+ * Format and send an CHAPV2-Challenge EAP Response message.
+ */
+static void
+eap_chapv2_response(esp, id, chapid, response, user, user_len)
+eap_state *esp;
+u_char id;
+u_char chapid;
+u_char *response;
+char *user;
+int user_len;
+{
+    u_char *outp;
+    int msglen;
+
+    outp = outpacket_buf;
+
+    MAKEHEADER(outp, PPP_EAP);
+
+    PUTCHAR(EAP_RESPONSE, outp);
+    PUTCHAR(id, outp);
+    esp->es_client.ea_id = id;
+    msglen = EAP_HEADERLEN + 6 * sizeof (u_char) +
MS_CHAP2_RESPONSE_LEN + user_len;
+    PUTSHORT(msglen, outp);
+    PUTCHAR(EAPT_MSCHAPV2, outp);
+    PUTCHAR(CHAP_RESPONSE, outp);
+    PUTCHAR(chapid, outp);
+    PUTCHAR(0, outp);
+    /* len */
+    PUTCHAR(5 + user_len +MS_CHAP2_RESPONSE_LEN, outp);
+    /* len response */
+    PUTCHAR(MS_CHAP2_RESPONSE_LEN, outp)
+    BCOPY(response, outp, MS_CHAP2_RESPONSE_LEN);
+    INCPTR(MS_CHAP2_RESPONSE_LEN, outp);
+    BCOPY(user, outp, user_len);
+
+    output(esp->es_unit, outpacket_buf, PPP_HDRLEN + msglen);
+}
+#endif
+
 /*
  * eap_request - Receive EAP Request message (client mode).
  */
@@ -1461,6 +1505,97 @@ int len;
             esp->es_client.ea_namelen);
         break;

+#ifdef CHAPMS
+    case EAPT_MSCHAPV2:
+        if (len < 1) {
+            error("EAP: received short MSCHAPv2");
+            /* Bogus request; wait for something real. */
+            return;
+        }
+        unsigned char chopcode;
+        GETCHAR(chopcode, inp);
+        len--;
+        dbglog("EAP: CHAP opcode %d", chopcode);
+
+        if (chopcode=CHAP_CHALLENGE) {
+
+            unsigned char chapid; /* Chapv2-ID */
+            GETCHAR(chapid, inp);
+            short mssize;
+            GETSHORT(mssize, inp);
+            unsigned char vsize;
+            GETCHAR(vsize, inp);
+            len-=4;
+
+            dbglog("EAP: chapid %d mssize %d vsize %d inplen %d,
challen %d", chapid, mssize, vsize, len, MS_CHAP2_PEER_CHAL_LEN);
+
+            unsigned char *rchallenge = calloc(1, MS_CHAP2_PEER_CHAL_LEN);
+            BCOPY(inp, rchallenge, MS_CHAP2_PEER_CHAL_LEN);
+            INCPTR(MS_CHAP2_PEER_CHAL_LEN,inp);
+
+            /*
+             * Get the secret for authenticating ourselves with
+             * the specified host.
+             */
+            if (!get_secret(esp->es_unit, esp->es_client.ea_name,
+                rhostname, secret, &secret_len, 0)) {
+                dbglog("EAP: no CHAP secret for auth to %q", rhostname);
+                eap_send_nak(esp, id, EAPT_SRP);
+                break;
+            }
+
+            char *user = calloc(1, esp->es_client.ea_namelen + 1);
+            memcpy(user, esp->es_client.ea_name, esp->es_client.ea_namelen);
+            *(user + esp->es_client.ea_namelen) = '\0';
+            dbglog("EAP: user %s, user_len %d", user,
esp->es_client.ea_namelen);
+
+            /* mschapv2 response */
+            unsigned char response[49];
+            unsigned char authResponse[41];
+            ChapMS2(rchallenge, NULL, user, secret, secret_len, response,
+                    authResponse, MS_CHAP2_AUTHENTICATEE);
+
+            eap_chapv2_response(esp, id, chapid, response,
esp->es_client.ea_name, esp->es_client.ea_namelen);
+
+            free(user);
+            free(rchallenge);
+
+        } else if (chopcode=CHAP_SUCCESS) {
+
+            unsigned char chapid; /* Chapv2-ID */
+            GETCHAR(chapid, inp);
+            short mssize;
+            GETSHORT(mssize, inp);
+            len-=3;
+            dbglog("EAP: chapid %d mssize %d inplen %d", chapid, mssize, len );
+            dbglog("Chap authentication succeeded: %.*v", len, inp);
+            u_char response[1];
+            response[0]=CHAP_SUCCESS;
+            eap_send_response(esp, id, EAPT_MSCHAPV2, response, 1);
+
+        } else if (chopcode=CHAP_FAILURE) {
+
+            unsigned char chapid; /* Chapv2-ID */
+            GETCHAR(chapid, inp);
+            short mssize;
+            GETSHORT(mssize, inp);
+            len-=3;
+            dbglog("EAP: chapid %d mssize %d inplen %d", chapid, mssize, len );
+            dbglog("Chap authentication failed: %.*v", len, inp);
+            u_char response[1];
+            response[0]=CHAP_FAILURE;
+            eap_send_response(esp, id, EAPT_MSCHAPV2, response, 1);
+            goto client_failure; /* force termination */
+
+        } else {
+
+            dbglog("EAP: Unknown CHAP opcode %d", chopcode);
+            eap_send_nak(esp, id, EAPT_SRP);
+        }
+
+        break;
+#endif /* CHAPMS */
+
 #ifdef USE_SRP
     case EAPT_SRP:
         if (len < 1) {
@@ -1706,16 +1841,16 @@ int len;
     }
     return;

-#ifdef USE_SRP
 client_failure:
     esp->es_client.ea_state = eapBadAuth;
     if (esp->es_client.ea_timeout > 0) {
         UNTIMEOUT(eap_client_timeout, (void *)esp);
     }
     esp->es_client.ea_session = NULL;
+#ifdef USE_SRP
     t_clientclose(tc);
-    auth_withpeer_fail(esp->es_unit, PPP_EAP);
 #endif /* USE_SRP */
+    auth_withpeer_fail(esp->es_unit, PPP_EAP);
 }

 /*
@@ -2154,7 +2289,9 @@ static char *eap_typenames[] = {
     "OTP", "Generic-Token", NULL, NULL,
     "RSA", "DSS", "KEA", "KEA-Validate",
     "TLS", "Defender", "Windows 2000", "Arcot",
-    "Cisco", "Nokia", "SRP"
+    "Cisco", "Nokia", "SRP", NULL,
+    "TTLS", "RAS", "AKA", "3COM", "PEAP",
+    "MSCHAPv2"
 };

 static int
diff --git a/pppd/eap.h b/pppd/eap.h
index 199d184..083ccfc 100644
--- a/pppd/eap.h
+++ b/pppd/eap.h
@@ -59,6 +59,18 @@ extern "C" {
 #define    EAPT_NOKIACARD        18    /* Nokia IP smart card */
 #define    EAPT_SRP        19    /* Secure Remote Password */
 /* 20 is deprecated */
+#define    EAPT_TTLS        21    /* EAP Tunneled TLS Authentication
Protocol RFC5281 */
+#define    EAPT_RAS        22    /* Remote Access Service */
+#define    EAPT_AKA        23    /* EAP method for 3rd Generation
Authentication and Key Agreement RFC4187 */
+#define    EAPT_3COM        24    /* EAP-3Com Wireless */
+#define    EAPT_PEAP        25    /* Protected EAP */
+#define    EAPT_MSCHAPV2        26    /* EAP-MSCHAPv2
RFC-draft-kamath-pppext-eap-mschapv2-02 */
+
+/* OpCodes for MSCHAPv2 */
+#define CHAP_CHALLENGE    1
+#define CHAP_RESPONSE    2
+#define CHAP_SUCCESS    3
+#define CHAP_FAILURE    4

 /* EAP SRP-SHA1 Subtypes */
 #define    EAPSRP_CHALLENGE    1    /* Request 1 - Challenge */
-- 
2.20.1
