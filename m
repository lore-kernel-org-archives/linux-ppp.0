From: Diederik Hattingh <diederikjhattingh@gmail.com>
Date: Sun, 29 Nov 2009 13:41:46 +0000
Subject: VPN to windows ISA server
Message-Id: <d68727470911290541h3531b46cs45db474472bc7975@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="00032555b336ab626e047982afcf"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org

--00032555b336ab626e047982afcf
Content-Type: text/plain; charset=ISO-8859-1

Hi
I am trying to use kvpnc to connect to my work VPN. The server is a
Windows ISA server. I have selected the "require MPPE" option.  At
connection time unfortunately, with debug, the log file says:

Nov 29 14:29:35 [pppd] sent [LCP ConfAck id=0x2 <asyncmap 0x0> <magic
0x15190f75> <accomp>]
Nov 29 14:29:35 [pppd] MPPE required, but MS-CHAP[v2] auth not performed.
Nov 29 14:29:35 [pppd] sent [LCP TermReq id=0x2 "MPPE required but not
available                         "]
Nov 29 14:29:36 [pppd] rcvd [LCP EchoReq id=0x0 magic=0x15190f75]
Nov 29 14:29:36 [pppd] rcvd [LCP TermReq id=0x3 "peer refused to authenticate"]

I added my CHAP "secret" with pptp-command.  Adding the secret does
not add the "*" for IP address coloum in the  "/etc/ppp/chap-secrets
file, is this normal?

Another question is the format of the domain\username.  In the secret
file for chap, the example was "domain\\username". Should this be the
same for the "user" value in the peer file?

I read online that the NT Domain part must be left blank, but the
domain added as prefix, as described above, to the username.  Is this
still valid?

The kernel module ppp_mppe loads fine, and the modinfo gives

filename:       /lib/modules/2.6.30-tuxonice-r4/kernel/drivers/net/ppp_mppe.ko
version:        1.0.2
alias:          ppp-compress-18
license:        Dual BSD/GPL
description:    Point-to-Point Protocol Microsoft Point-to-Point
Encryption support
author:         Frank Cusack <fcusack@fcusack.com>
srcversion:     75D9E5320BB61153D0F4AF5
depends:        ppp_generic
vermagic:       2.6.30-tuxonice-r4 SMP mod_unload modversions 686 4KSTACKS

pppd version is 2.4.4
pptp version is 1.7.2

# lsmod |grep ppp
ppp_deflate             4188  0
ppp_async               7496  0
crc_ccitt               1796  1 ppp_async
ppp_mppe                6088  0
ppp_generic            21568  4 ppp_deflate,bsd_comp,ppp_async,ppp_mppe
slhc                    5156  1 ppp_generic

The peer file is attached as kvpnc.txt, and the secrets file looks like this:
# Secrets for authentication using CHAP
# client        server  secret                  IP addresses
myworkdomain\\djh       myworkdomain    *****
myworkdomain    myworkdomain\\djh       *****


Notice that the connection server is called server.myworkdomain.co.za,
but the domain I specified as myworkdomain (without .co.za)

Any help will be much appreciated.
Thanks
Diederik

--00032555b336ab626e047982afcf
Content-Type: text/plain; charset=US-ASCII; name="kvpnc.txt"
Content-Disposition: attachment; filename="kvpnc.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g2lv18cl0

IyBnZW5lcmF0ZWQgYnkga3ZwbmMuIERvIG5vdCBlZGl0IGl0Lg0KIyBwcm9maWxlOiBteXdvcmtk
b21haW4uY28uemENCg0KDQojIG5hbWUgb2YgdHVubmVsLCB1c2VkIHRvIHNlbGVjdCBsaW5lcyBp
biBzZWNyZXRzIGZpbGVzDQpyZW1vdGVuYW1lIG15d29ya2RvbWFpbi5jby56YQ0KDQojIG5hbWUg
b2YgdHVubmVsLCB1c2VkIHRvIG5hbWUgL3Zhci9ydW4gcGlkIGZpbGUNCmxpbmtuYW1lIGt2cGMu
bXl3b3JrZG9tYWluLmNvLnphDQoNCiMgbmFtZSBvZiB0dW5uZWwsIHBhc3NlZCB0byBpcC11cCBz
Y3JpcHRzDQppcHBhcmFtIGt2cG5jLm15d29ya2RvbWFpbi5jby56YQ0KDQojIGRhdGEgc3RyZWFt
IGZvciBwcHBkIHRvIHVzZQ0KcHR5ICIvdXNyL3NiaW4vcHB0cCAtLWxvZ2xldmVsIDEgbXl3b3Jr
ZG9tYWluLmNvLnphIC0tbm9sYXVuY2hwcHBkIg0KDQojIGRvbWFpbiBhbmQgdXNlcm5hbWUsIHVz
ZWQgdG8gc2VsZWN0IGxpbmVzIGluIHNlY3JldHMgZmlsZXMNCm5hbWUgIm15d29ya2RvbWFpblxt
eXdvcmt1c2VybmFtZSINCg0KIyB1c2UgTVBQRSBlbmNyeXB0aW9uDQpyZXF1aXJlLW1wcGUNCm5v
bXBwZS1zdGF0ZWZ1bA0KcmVxdWlyZS1tcHBlLTEyOA0KDQojIHdlIGRvIG5vdCByZXF1aXJlIHRo
ZSBwZWVyIHRvIGF1dGhlbnRpY2F0ZSBpdHNlbGYNCm5vYXV0aA0KDQojIHdlIHdhbnQgdG8gc2Vl
IHdoYXQgaGFwcGVuDQpub2RldGFjaA0KDQojIGxvY2sgdGhlIGRldmljZQ0KbG9jaw0KDQojIERv
IG5vdCB1c2UgQlNEIGNvbXByZXNzaW9uDQpub2JzZGNvbXANCg0KIyBEbyBub3QgdXNlIGRlZmxh
dGUgbWV0aG9kDQpub2RlZmxhdGUNCg0KIyByZXBsYWNlIGRlZmF1bHRyb3V0ZQ0KZGVmYXVsdHJv
dXRlDQoNCiMgZGVmYXVsdCBNVFUNCm10dSAxNTAwDQoNCiMgZGVmYXVsdCBNUlUNCm1ydSAxNTAw
DQoNCiMgZGlzYWJsZSBNaWNyb3NvZnQgUG9pbnQtdG8tUG9pbnQgQ29tcHJlc3Npb24gKE1QUEMp
IChpLmUuIGZvciBjb21wYXRpYmlsaXR5IHdpdGggd2F0Y2hndWFyZCBmaXJlYm94KQ0Kbm9wY29t
cA0KDQojIGtlcm5lbCBsZXZlbCBkZWJ1Zw0Ka2RlYnVnIDANCiMgcmVmdXNlIEVBUA0KcmVmdXNl
LWVhcA0K
--00032555b336ab626e047982afcf--
