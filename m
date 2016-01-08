From: Alarig Le Lay <alarig@swordarmor.fr>
Date: Fri, 08 Jan 2016 14:20:12 +0000
Subject: Add support for IPv6 RADIUS attributes
Message-Id: <20160108142012.GL19014@drscott.swordarmor.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Mit9XoPEfICDqq/V"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org


--Mit9XoPEfICDqq/V
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

This patch aims to handle IPv6 RADIUS attributes. The current ppp does
not handle them and raise an error that looks like 'rc_read_dictionary:
invalid type on line 89 of dictionary /etc/radiusclient/dictionary'.
I use those attributes to put it into the radvd conf from
/run/vpn/radvd-user.${PPP_IFACE}.conf.

=46rom 5c0cac0eeecc32e5023d353a8420633827800e8e Mon Sep 17 00:00:00 2001
=46rom: Benjamin Cama <benoar@dolka.fr>
Date: Sun, 11 Oct 2015 18:08:11 +0200
Subject: [PATCH] Handle IPv6 RADIUS attributes

---
 pppd/plugins/radius/avpair.c       | 26 +++++++++++++++++++++++++-
 pppd/plugins/radius/dict.c         | 12 ++++++++++++
 pppd/plugins/radius/radiusclient.h | 11 +++++++++++
 3 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/pppd/plugins/radius/avpair.c b/pppd/plugins/radius/avpair.c
index 716d23f..7536941 100644
--- a/pppd/plugins/radius/avpair.c
+++ b/pppd/plugins/radius/avpair.c
@@ -222,6 +222,9 @@ VALUE_PAIR *rc_avpair_gen (AUTH_HDR *auth)
 			{
=20
 			    case PW_TYPE_STRING:
+			    case PW_TYPE_IFID:
+			    case PW_TYPE_IPV6ADDR:
+			    case PW_TYPE_IPV6PREFIX:
 				memcpy (pair->strvalue, (char *) ptr,
(size_t) attrlen);
 				pair->strvalue[attrlen] =3D '\0';
 				pair->lvalue =3D attrlen;
@@ -692,9 +695,10 @@ int rc_avpair_parse (char *buffer, VALUE_PAIR
**first_pair)
 int rc_avpair_tostr (VALUE_PAIR *pair, char *name, int ln, char *value,
int lv)
 {
 	DICT_VALUE     *dval;
-	char            buffer[32];
+	char            buffer[INET6_ADDRSTRLEN + 4]; // for a prefix:
addr + '/' + prefixlen
 	struct in_addr  inad;
 	unsigned char         *ptr;
+	char		*str;
=20
 	*name =3D *value =3D '\0';
=20
@@ -753,6 +757,26 @@ int rc_avpair_tostr (VALUE_PAIR *pair, char *name,
int ln, char *value, int lv)
 		strncpy(value, buffer, lv-1);
 		break;
=20
+	    case PW_TYPE_IFID:
+		ptr =3D pair->strvalue;
+		snprintf(buffer, sizeof (buffer), "%x:%x:%x:%x",
+			 (ptr[0] << 8) + ptr[1], (ptr[2] << 8) + ptr[3],
+			 (ptr[4] << 8) + ptr[5], (ptr[6] << 8) +
ptr[7]);
+		strncpy(value, buffer, lv-1);
+		break;
+
+	    case PW_TYPE_IPV6ADDR:
+		inet_ntop(AF_INET6, pair->strvalue, buffer, sizeof
(buffer));
+		strncpy(value, buffer, lv-1);
+		break;
+
+	    case PW_TYPE_IPV6PREFIX:
+		inet_ntop(AF_INET6, pair->strvalue + 2, buffer, sizeof
(buffer));
+		str =3D buffer + strlen(buffer);
+		snprintf(str, sizeof (buffer) - (str - buffer), "/%d",
*(pair->strvalue + 1));
+		strncpy(value, buffer, lv-1);
+		break;
+
 	    default:
 		error("rc_avpair_tostr: unknown attribute type %d",
pair->type);
 		return (-1);
diff --git a/pppd/plugins/radius/dict.c b/pppd/plugins/radius/dict.c
index 72b3e70..3b2add2 100644
--- a/pppd/plugins/radius/dict.c
+++ b/pppd/plugins/radius/dict.c
@@ -158,6 +158,18 @@ int rc_read_dictionary (char *filename)
 			{
 				type =3D PW_TYPE_DATE;
 			}
+			else if (strcmp (typestr, "ifid") =3D=3D 0)
+			{
+				type =3D PW_TYPE_IFID;
+			}
+			else if (strcmp (typestr, "ipv6addr") =3D=3D 0)
+			{
+				type =3D PW_TYPE_IPV6ADDR;
+			}
+			else if (strcmp (typestr, "ipv6prefix") =3D=3D 0)
+			{
+				type =3D PW_TYPE_IPV6PREFIX;
+			}
 			else
 			{
 				error("rc_read_dictionary: invalid type
on line %d of dictionary %s",
diff --git a/pppd/plugins/radius/radiusclient.h
b/pppd/plugins/radius/radiusclient.h
index 51b959a..ab4ef2d 100644
--- a/pppd/plugins/radius/radiusclient.h
+++ b/pppd/plugins/radius/radiusclient.h
@@ -77,6 +77,17 @@ typedef struct pw_auth_hdr
 #define PW_TYPE_INTEGER			1
 #define PW_TYPE_IPADDR			2
 #define PW_TYPE_DATE			3
+#define PW_TYPE_ABINARY			4
+#define PW_TYPE_OCTETS			5
+#define PW_TYPE_IFID			6
+#define PW_TYPE_IPV6ADDR		7
+#define PW_TYPE_IPV6PREFIX		8
+#define PW_TYPE_BYTE			9
+#define PW_TYPE_SHORT			10
+#define PW_TYPE_ETHERNET	       	11
+#define PW_TYPE_SIGNED			12
+#define PW_TYPE_COMBO_IP	       	13
+#define PW_TYPE_TLV	       		14
=20
 /* standard RADIUS codes */
=20
--=20
2.1.4



--Mit9XoPEfICDqq/V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJWj8WcAAoJEK84SsFrICuIpm0H/19QNE0LkkdqHlefc8wzQr9v
UR+md4/eQDJ9fhw34cvNYOfjDIIoKSTZXa+m83mOyOLoy3G1XkxOl8FhZ9m376LY
mKTG0k9uw7q2nomOCnmTxStLNq89PpqaU0Mzr5rEvrNsyJVcKLlJq95ZiF25fYw7
49D5aurbNwaHvYOzFV1E/qx7lXYeVJzIqZsQniyd8dm8Fi4vxIRbIbvaYbPN0W8U
qEABlmALwGuu0/K0DXzeJ7uEvBiryJhf/SJ73p8V5ULuCdL5LEB2FnFJDXLyrlUS
ib2NCfy35JpBL7RZEpr6rjitR24Ngqqq2g1qcRoAAJF/a6iuqduU1rSGdAUO2M8=
=avVz
-----END PGP SIGNATURE-----

--Mit9XoPEfICDqq/V--
