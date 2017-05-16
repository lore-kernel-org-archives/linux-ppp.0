From: Luca Piccirillo <luca.piccirillo@gmail.com>
Date: Tue, 16 May 2017 16:15:11 +0000
Subject: [pppoe-server] Enable HURL and MOTD messages with custom content
Message-Id: <CAPpAafaF8HU5Oa6Y23LVyJtNM5897z06baqU8dKSoJ_1eXgYGw@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="94eb2c0b6180efc9c8054fa679fc"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org

--94eb2c0b6180efc9c8054fa679fc
Content-Type: text/plain; charset="UTF-8"

Here is a really simple patch to allow sending HURL and MOTD messages
after peer connection. It also adds command line support for both and
allow https as well as HURL content.

--- rp-pppoe-3.12/src/pppoe-server.c
+++ rp-pppoe-3.12_patch/src/pppoe-server.c
@@ -141,6 +141,9 @@

 static char *pppd_path = PPPD_PATH;
 static char *pppoe_path = PPPOE_PATH;
+
+static char *motd_string = NULL;
+static char *hurl_string = NULL;

 static int Debug = 0;
 static int CheckPoolSyntax = 0;
@@ -1082,6 +1085,11 @@
     pads.length = htons(plen);
     sendPacket(NULL, sock, &pads, (int) (plen + HDR_SIZE));

+    if(hurl_string != NULL)
+        sendHURLorMOTM(&conn, hurl_string, TAG_HURL);
+    if(motd_string != NULL)
+        sendHURLorMOTM(&conn, motd_string, TAG_MOTM);
+
     /* Close sock; don't need it any more */
     close(sock);

@@ -1200,9 +1208,9 @@
 #endif

 #ifndef HAVE_LINUX_KERNEL_PPPOE
-    char *options = "X:ix:hI:C:L:R:T:m:FN:f:O:o:sp:lrudPc:S:1q:Q:";
+    char *options = "X:ix:hI:C:L:R:T:m:FN:f:O:o:sp:lrudPc:S:1q:Q:H:M:";
 #else
-    char *options = "X:ix:hI:C:L:R:T:m:FN:f:O:o:skp:lrudPc:S:1q:Q:";
+    char *options = "X:ix:hI:C:L:R:T:m:FN:f:O:o:skp:lrudPc:S:1q:Q:H:M:";
 #endif

     if (getuid() != geteuid() ||
@@ -1270,6 +1278,22 @@
         }
         break;

+    case 'M':
+        motd_string = strdup(optarg);
+        if (!motd_string) {
+        fprintf(stderr, "Out of memory");
+        exit(1);
+        }
+        break;
+
+    case 'H':
+        hurl_string = strdup(optarg);
+        if (!hurl_string) {
+        fprintf(stderr, "Out of memory");
+        exit(1);
+        }
+        break;
+
     case 'c':
 #ifndef HAVE_LICENSE
         fprintf(stderr, "Clustering capability not available.\n");
@@ -2310,8 +2334,10 @@

     if (tag == TAG_HURL) {
     if (strncmp(url, "http://", 7)) {
-        syslog(LOG_WARNING, "sendHURL(%s): URL must begin with http://", url);
+      if (strncmp(url, "https://", 8)) {
+        syslog(LOG_WARNING, "sendHURL(%s): URL must begin with
http:// or https://", url);
         return;
+      }
     }
     } else {
     tag = TAG_MOTM;

--94eb2c0b6180efc9c8054fa679fc
Content-Type: application/octet-stream; name="hurl_motd.patch"
Content-Disposition: attachment; filename="hurl_motd.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_j2rreqrq0

LS0tIHJwLXBwcG9lLTMuMTIvc3JjL3BwcG9lLXNlcnZlci5jCisrKyBycC1wcHBvZS0zLjEyX3Bh
dGNoL3NyYy9wcHBvZS1zZXJ2ZXIuYwpAQCAtMTQxLDYgKzE0MSw5IEBACiAKIHN0YXRpYyBjaGFy
ICpwcHBkX3BhdGggPSBQUFBEX1BBVEg7CiBzdGF0aWMgY2hhciAqcHBwb2VfcGF0aCA9IFBQUE9F
X1BBVEg7CisKK3N0YXRpYyBjaGFyICptb3RkX3N0cmluZyA9IE5VTEw7CitzdGF0aWMgY2hhciAq
aHVybF9zdHJpbmcgPSBOVUxMOwogCiBzdGF0aWMgaW50IERlYnVnID0gMDsKIHN0YXRpYyBpbnQg
Q2hlY2tQb29sU3ludGF4ID0gMDsKQEAgLTEwODIsNiArMTA4NSwxMSBAQAogICAgIHBhZHMubGVu
Z3RoID0gaHRvbnMocGxlbik7CiAgICAgc2VuZFBhY2tldChOVUxMLCBzb2NrLCAmcGFkcywgKGlu
dCkgKHBsZW4gKyBIRFJfU0laRSkpOwogCisgICAgaWYoaHVybF9zdHJpbmcgIT0gTlVMTCkKKyAg
ICAgICAgc2VuZEhVUkxvck1PVE0oJmNvbm4sIGh1cmxfc3RyaW5nLCBUQUdfSFVSTCk7CisgICAg
aWYobW90ZF9zdHJpbmcgIT0gTlVMTCkKKyAgICAgICAgc2VuZEhVUkxvck1PVE0oJmNvbm4sIG1v
dGRfc3RyaW5nLCBUQUdfTU9UTSk7CisKICAgICAvKiBDbG9zZSBzb2NrOyBkb24ndCBuZWVkIGl0
IGFueSBtb3JlICovCiAgICAgY2xvc2Uoc29jayk7CiAKQEAgLTEyMDAsOSArMTIwOCw5IEBACiAj
ZW5kaWYKIAogI2lmbmRlZiBIQVZFX0xJTlVYX0tFUk5FTF9QUFBPRQotICAgIGNoYXIgKm9wdGlv
bnMgPSAiWDppeDpoSTpDOkw6UjpUOm06Rk46ZjpPOm86c3A6bHJ1ZFBjOlM6MXE6UToiOworICAg
IGNoYXIgKm9wdGlvbnMgPSAiWDppeDpoSTpDOkw6UjpUOm06Rk46ZjpPOm86c3A6bHJ1ZFBjOlM6
MXE6UTpIOk06IjsKICNlbHNlCi0gICAgY2hhciAqb3B0aW9ucyA9ICJYOml4OmhJOkM6TDpSOlQ6
bTpGTjpmOk86bzpza3A6bHJ1ZFBjOlM6MXE6UToiOworICAgIGNoYXIgKm9wdGlvbnMgPSAiWDpp
eDpoSTpDOkw6UjpUOm06Rk46ZjpPOm86c2twOmxydWRQYzpTOjFxOlE6SDpNOiI7CiAjZW5kaWYK
IAogICAgIGlmIChnZXR1aWQoKSAhPSBnZXRldWlkKCkgfHwKQEAgLTEyNzAsNiArMTI3OCwyMiBA
QAogCSAgICB9CiAJICAgIGJyZWFrOwogCisJY2FzZSAnTSc6CisJICAgIG1vdGRfc3RyaW5nID0g
c3RyZHVwKG9wdGFyZyk7CisJICAgIGlmICghbW90ZF9zdHJpbmcpIHsKKwkJZnByaW50ZihzdGRl
cnIsICJPdXQgb2YgbWVtb3J5Iik7CisJCWV4aXQoMSk7CisJICAgIH0KKwkgICAgYnJlYWs7CisK
KwljYXNlICdIJzoKKwkgICAgaHVybF9zdHJpbmcgPSBzdHJkdXAob3B0YXJnKTsKKwkgICAgaWYg
KCFodXJsX3N0cmluZykgeworCQlmcHJpbnRmKHN0ZGVyciwgIk91dCBvZiBtZW1vcnkiKTsKKwkJ
ZXhpdCgxKTsKKwkgICAgfQorCSAgICBicmVhazsKKwkgICAgCiAJY2FzZSAnYyc6CiAjaWZuZGVm
IEhBVkVfTElDRU5TRQogCSAgICBmcHJpbnRmKHN0ZGVyciwgIkNsdXN0ZXJpbmcgY2FwYWJpbGl0
eSBub3QgYXZhaWxhYmxlLlxuIik7CkBAIC0yMzEwLDggKzIzMzQsMTAgQEAKIAogICAgIGlmICh0
YWcgPT0gVEFHX0hVUkwpIHsKIAlpZiAoc3RybmNtcCh1cmwsICJodHRwOi8vIiwgNykpIHsKLQkg
ICAgc3lzbG9nKExPR19XQVJOSU5HLCAic2VuZEhVUkwoJXMpOiBVUkwgbXVzdCBiZWdpbiB3aXRo
IGh0dHA6Ly8iLCB1cmwpOworCSAgaWYgKHN0cm5jbXAodXJsLCAiaHR0cHM6Ly8iLCA4KSkgewor
CSAgICBzeXNsb2coTE9HX1dBUk5JTkcsICJzZW5kSFVSTCglcyk6IFVSTCBtdXN0IGJlZ2luIHdp
dGggaHR0cDovLyBvciBodHRwczovLyIsIHVybCk7CiAJICAgIHJldHVybjsKKwkgIH0KIAl9CiAg
ICAgfSBlbHNlIHsKIAl0YWcgPSBUQUdfTU9UTTsK
--94eb2c0b6180efc9c8054fa679fc--
