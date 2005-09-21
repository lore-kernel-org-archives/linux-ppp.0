From: Cleiton Reis <cperes.reis@gmail.com>
Date: Wed, 21 Sep 2005 14:16:52 +0000
Subject: pptp AND vpn(openswan kernel2.6)
Message-Id: <a2617ef4050921071668316a1d@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Hi All,


guys I=B4am having some troubles with ppp, pptp and vpn(kernel2.6) :

** vpn(kernel2.6)

Iam using the new kernel2.6 with OpenSwan2.20, I tested this with link
conected directly in my eth0, my eth0 had a valid IP 200.xxxx, OK all
works well.

When I try to use a modem ADSL condigured as Bridge and made a ppp
conection using pptp+ppp to autenticate and start  the ipsec=20
/etc/init.d/ipsec start the ppp conection drops giving a sequence of
GRE errors.
Aparently a conflict with port 1723 .... I don=B4t I need some tip about th=
is ....

** pptp

When I configure a Windows Client to access the pptpd server, the
follow appear n the log :

Bad Checksum error .
LCP ConfReq Timeout ....

I found something in poptop.org and I will investigate in more details ....


So, I need some help only in the first item ... about the second
problem I will see in more detail.

Thanks a lot .

Cleiton Peres Reis.
