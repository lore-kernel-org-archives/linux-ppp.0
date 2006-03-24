From: md@Linux.IT (Marco d'Itri)
Date: Fri, 24 Mar 2006 23:21:28 +0000
Subject: killing a pptp tunnel with a single ping
Message-Id: <20060324232128.GA23810@wonderland.linux.it>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

After running this command from a remote host:

ping -M dont $MY_TUNNEL_IP -c 1 -s 1496

this was logged by the kernel:

Mar 25 00:13:13 wonderland kernel: mppe_decompress[1]: osize too small! (have: 1504 need: 1505)

and traffic over the tunnel stopped flowing. pppd logged this:

Mar 25 00:13:13 wonderland pppd[23476]: read /dev/ppp: Value too large for defined data type
Mar 25 00:13:13 wonderland pppd[23476]: rcvd [Compressed data] 90 4b a1 a3 07 58 cc 64 ...
Mar 25 00:13:13 wonderland pppd[23476]: sent [CCP ResetReq id=0x2]
Mar 25 00:13:32 wonderland pppd[23476]: rcvd [Compressed data] 90 4c c9 fd 23 23 04 88 ...
Mar 25 00:13:32 wonderland pppd[23476]: sent [CCP ResetReq id=0x3]
Mar 25 00:13:44 wonderland pppd[23476]: read /dev/ppp: Value too large for defined data type
Mar 25 00:13:44 wonderland pppd[23476]: rcvd [Compressed data] 90 4e e9 ae 40 72 3e ac ...
Mar 25 00:13:44 wonderland pppd[23476]: sent [CCP ResetReq id=0x4]
Mar 25 00:13:54 wonderland pppd[23476]: read /dev/ppp: Value too large for defined data type
Mar 25 00:14:03 wonderland pppd[23476]: rcvd [Compressed data] 90 50 f3 43 59 c2 d4 67 ...
Mar 25 00:14:03 wonderland pppd[23476]: sent [CCP ResetReq id=0x5]
Mar 25 00:14:05 wonderland pppd[23476]: rcvd [Compressed data] 90 51 8f 07 e1 73 3a ca ...
Mar 25 00:14:05 wonderland pppd[23476]: sent [CCP ResetReq id=0x6]
Mar 25 00:14:12 wonderland pppd[23476]: rcvd [Compressed data] 90 52 ea b4 ae ec a9 25 ...
[...]

pppd version 2.4.4b1
pptp version 1.7.0
Linux wonderland 2.6.16 #18 Mon Mar 20 19:44:13 CET 2006 i686 GNU/Linux


The other side is running 12.4(3) IOS.
No MTU is explicitly set on either side.

-- 
ciao,
Marco
