From: p.boehm@d-trust.net
Date: Fri, 10 Sep 2004 12:46:35 +0000
Subject: pppd don't create ppp-network-device
Message-Id: <OFA2465F60.5C52B06E-ONC1256F0B.0042177C@bln.d-trust.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="0__=C1256F0B0042177C8f9e8a93df938690918cC1256F0B0042177C"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org

--0__=C1256F0B0042177C8f9e8a93df938690918cC1256F0B0042177C
Content-type: text/plain; charset=us-ascii

Hi,
I'm try to connect to the internet via ppp but it fails because (so I believe)
ppp_generic-module don't create an network-device alias ppp0.

To show that the rest works fine I'll put here the output of pppd/chat from
syslog:

Sep 10 09:55:46 nano pppd[1510]: pppd 2.4.1 started by root, uid 0
Sep 10 09:55:46 nano pppd[1510]: Perms of /dev/ttyS0 are ok, no 'mesg n' neccesary.
Sep 10 09:55:47 nano chat[1511]: abort on (NO CARRIER)
Sep 10 09:55:47 nano chat[1511]: abort on (NO DIALTONE)
Sep 10 09:55:47 nano chat[1511]: abort on (ERROR)
Sep 10 09:55:47 nano chat[1511]: abort on (NO ANSWER)
Sep 10 09:55:47 nano chat[1511]: abort on (Username/Password Incorrect)
Sep 10 09:55:47 nano chat[1511]: send (at^M)
Sep 10 09:55:47 nano chat[1511]: expect (OK)
Sep 10 09:55:48 nano chat[1511]: at^M^M
Sep 10 09:55:48 nano chat[1511]: OK
Sep 10 09:55:48 nano chat[1511]:  -- got it
Sep 10 09:55:48 nano chat[1511]: send (at&d0&c1^M)
Sep 10 09:55:48 nano chat[1511]: expect (OK)
Sep 10 09:55:48 nano chat[1511]: ^M
Sep 10 09:55:48 nano chat[1511]: at&d0&c1^M^M
Sep 10 09:55:48 nano chat[1511]: OK
Sep 10 09:55:48 nano chat[1511]:  -- got it
Sep 10 09:55:48 nano chat[1511]: send (atdt0172229000^M)
Sep 10 09:55:48 nano chat[1511]: expect (name:)
Sep 10 09:55:48 nano chat[1511]: ^M
Sep 10 09:56:02 nano chat[1511]: atdt0172229000^M^M
Sep 10 09:56:02 nano chat[1511]: CONNECT 9600/RLP^M
Sep 10 09:56:03 nano chat[1511]: ^M^M
Sep 10 09:56:03 nano chat[1511]: 491723222009 connected to the D2 Internet Service^M^M
Sep 10 09:56:06 nano chat[1511]: PPP session starting~^?}#@!}!}!} }8}!}$}%\}"}&^?^?^?^?}%}&})
^G#N}'}"}(}"+}"~~^?}#@!}!}"
Sep 10 09:56:09 nano chat[1511]: } }8}!}$}%\}"}&^?^?^?^?}%}&})^G#N}'}"}(}"a^P~~^?}#@!}!}#} }8}!}$}%
\}"}&^?^?^?^?}%}&})^G#N}'}
Sep 10 09:56:15 nano chat[1511]: "}(}"(}9~~^?}#@!}!}$} }8}!}$}%\}"}&^?^?^?^?}%}&})^G#N}'}"}(}"d
<~~^?}#@!}!}%} }8}!}$}%\}
Sep 10 09:56:21 nano chat[1511]: "}&^?^?^?^?}%}&})^G#N}'}"}(}"-5~~^?}#@!}!}&} }8}!}$}%\}"}&^?^?^?
^?}%}&})^G#N}'}"}(}"g'~~^?}#
Sep 10 09:56:24 nano chat[1511]: @!}!}'} }8}!}$}%\}"}&^?^?^?^?}%}&})^G#N}'}"}(}"..~~^?}#@!}!}(}
}8}!}$}%\}"}&^?^?^?^?}%}&})
Sep 10 09:56:30 nano chat[1511]: ^G#N}'}"}(}"ne~~^?}#@!}!})} }8}!}$}%\}"}&^?^?^?^?}%}&})^G#N}'}"}
(}"'l~~^?}#@!}!}*} }8}!}
Sep 10 09:56:33 nano chat[1511]: alarm
Sep 10 09:56:33 nano chat[1511]: Failed
Sep 10 09:56:33 nano pppd[1510]: Connect script failed
Sep 10 09:56:34 nano pppd[1510]: Exit.

During this session lsmod shows that ppp_generic works:

Module         Size Used by
ppp_async 6160 0 (autoclean) (unused)
ppp_generic  15040  1 (autoclean) (ppp_async)
slhc      4432 0 (autoclean) (ppp_generic)
...

... but I miss some lines like:

Sep 10 09:55:47 nano pppd[1510]: using channel 1
Sep 10 09:55:47 nano pppd[1510]: Using interface ppp0
Sep 10 09:55:47 nano pppd[1510]: Connect: ppp0 <--> /dev/ttyS0

And ifconfig shows that NO ppp-device has been created.

I can see in lsmod that slhc (serial line hook?) is not touched. configuration error?
I think slhc is the bridge between /dev/ttyS0 and ppp_generic to create ppp-network-device, right?

Hope someone have an idea for this...
Unfortunately I can't trace kernel-modules, so I'm not be able to detect the error.

pb

PS: I'm running SuSE 7.3 prof. with patched (last two wellknown kernelbugs) kernel 2.4.10-4GB...

(summary as file attached: ppp-failure.txt)
(See attached file: ppp-failure.txt)
--0__=C1256F0B0042177C8f9e8a93df938690918cC1256F0B0042177C
Content-type: application/octet-stream; 
	name="ppp-failure.txt"
Content-Disposition: attachment; filename="ppp-failure.txt"
Content-transfer-encoding: base64

QnVpbGQgY29ubmVjdGlvbg0KPT09PT09PT09PT09PQ0KDQojIHBwcGQgLWQgY2FsbCBpc3ANCg0K
L2V0Yy9wcHAvcGVlcnMvaXNwOg0KPT09PT09PT09PT09PT09PQ0KDQp0dHlTMCAxOTIwMCBjcnRz
Y3RzDQpjb25uZWN0ICcvdXNyL3NiaW4vY2hhdCAtdiAtZiAvZXRjL3BwcC9jaGF0LWlzcCcNCg0K
L2V0Yy9wcHAvY2hhdC1pc3A6DQo9PT09PT09PT09PT09PT0NCg0KQUJPUlQgIk5PIENBUlJJRVIi
DQpBQk9SVCAiTk8gRElBTFRPTkUiDQpBQk9SVCAiRVJST1IiDQpBQk9SVCAiTk8gQU5TV0VSIg0K
QUJPUlQgIlVzZXJuYW1lL1Bhc3N3b3JkIEluY29ycmVjdCINCiIiICJhdCINCk9LICJhdCZkMCZj
MSINCk9LICJhdGR0MDE3MjIyOTAwMCINCiJuYW1lOiIgIl5VYSINCiJ3b3JkOiIgIlxxYSINCiJp
c3B0cyIgIlxxXlVwcHAiDQoifi1eVXBwcC1+Ig0KDQpwYXJ0IG9mIC92YXIvbG9nL21lc3NhZ2Vz
IGR1cmluZyBwcHAtc2Vzc2lvbjoNCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
DQoNClNlcCAxMCAwOTo1NTo0NiBuYW5vIHBwcGRbMTUxMF06IHBwcGQgMi40LjEgc3RhcnRlZCBi
eSByb290LCB1aWQgMA0KU2VwIDEwIDA5OjU1OjQ2IG5hbm8gcHBwZFsxNTEwXTogUGVybXMgb2Yg
L2Rldi90dHlTMCBhcmUgb2ssIG5vICdtZXNnIG4nIG5lY2Nlc2FyeS4NClNlcCAxMCAwOTo1NTo0
NyBuYW5vIGNoYXRbMTUxMV06IGFib3J0IG9uIChOTyBDQVJSSUVSKQ0KU2VwIDEwIDA5OjU1OjQ3
IG5hbm8gY2hhdFsxNTExXTogYWJvcnQgb24gKE5PIERJQUxUT05FKQ0KU2VwIDEwIDA5OjU1OjQ3
IG5hbm8gY2hhdFsxNTExXTogYWJvcnQgb24gKEVSUk9SKQ0KU2VwIDEwIDA5OjU1OjQ3IG5hbm8g
Y2hhdFsxNTExXTogYWJvcnQgb24gKE5PIEFOU1dFUikNClNlcCAxMCAwOTo1NTo0NyBuYW5vIGNo
YXRbMTUxMV06IGFib3J0IG9uIChVc2VybmFtZS9QYXNzd29yZCBJbmNvcnJlY3QpDQpTZXAgMTAg
MDk6NTU6NDcgbmFubyBjaGF0WzE1MTFdOiBzZW5kIChhdF5NKQ0KU2VwIDEwIDA5OjU1OjQ3IG5h
bm8gY2hhdFsxNTExXTogZXhwZWN0IChPSykNClNlcCAxMCAwOTo1NTo0OCBuYW5vIGNoYXRbMTUx
MV06IGF0Xk1eTQ0KU2VwIDEwIDA5OjU1OjQ4IG5hbm8gY2hhdFsxNTExXTogT0sNClNlcCAxMCAw
OTo1NTo0OCBuYW5vIGNoYXRbMTUxMV06ICAtLSBnb3QgaXQgDQpTZXAgMTAgMDk6NTU6NDggbmFu
byBjaGF0WzE1MTFdOiBzZW5kIChhdCZkMCZjMV5NKQ0KU2VwIDEwIDA5OjU1OjQ4IG5hbm8gY2hh
dFsxNTExXTogZXhwZWN0IChPSykNClNlcCAxMCAwOTo1NTo0OCBuYW5vIGNoYXRbMTUxMV06IF5N
DQpTZXAgMTAgMDk6NTU6NDggbmFubyBjaGF0WzE1MTFdOiBhdCZkMCZjMV5NXk0NClNlcCAxMCAw
OTo1NTo0OCBuYW5vIGNoYXRbMTUxMV06IE9LDQpTZXAgMTAgMDk6NTU6NDggbmFubyBjaGF0WzE1
MTFdOiAgLS0gZ290IGl0IA0KU2VwIDEwIDA5OjU1OjQ4IG5hbm8gY2hhdFsxNTExXTogc2VuZCAo
YXRkdDAxNzIyMjkwMDBeTSkNClNlcCAxMCAwOTo1NTo0OCBuYW5vIGNoYXRbMTUxMV06IGV4cGVj
dCAobmFtZTopDQpTZXAgMTAgMDk6NTU6NDggbmFubyBjaGF0WzE1MTFdOiBeTQ0KU2VwIDEwIDA5
OjU2OjAyIG5hbm8gY2hhdFsxNTExXTogYXRkdDAxNzIyMjkwMDBeTV5NDQpTZXAgMTAgMDk6NTY6
MDIgbmFubyBjaGF0WzE1MTFdOiBDT05ORUNUIDk2MDAvUkxQXk0NClNlcCAxMCAwOTo1NjowMyBu
YW5vIGNoYXRbMTUxMV06IF5NXk0NClNlcCAxMCAwOTo1NjowMyBuYW5vIGNoYXRbMTUxMV06IDQ5
MTcyMzIyMjAwOSBjb25uZWN0ZWQgdG8gdGhlIEQyIEludGVybmV0IFNlcnZpY2VeTV5NDQpTZXAg
MTAgMDk6NTY6MDYgbmFubyBjaGF0WzE1MTFdOiBQUFAgc2Vzc2lvbiBzdGFydGluZ35eP30jQCF9
IX0hfSB9OH0hfSR9JVx9In0mXj9eP14/Xj99JX0mfSleRyNOfSd9In0ofSIrfSJ+fl4/fSNAIX0h
fSINClNlcCAxMCAwOTo1NjowOSBuYW5vIGNoYXRbMTUxMV06IH0gfTh9IX0kfSVcfSJ9Jl4/Xj9e
P14/fSV9Jn0pXkcjTn0nfSJ9KH0iYV5Qfn5eP30jQCF9IX0jfSB9OH0hfSR9JVx9In0mXj9eP14/
Xj99JX0mfSleRyNOfSd9DQpTZXAgMTAgMDk6NTY6MTUgbmFubyBjaGF0WzE1MTFdOiAifSh9Iih9
OX5+Xj99I0AhfSF9JH0gfTh9IX0kfSVcfSJ9Jl4/Xj9eP14/fSV9Jn0pXkcjTn0nfSJ9KH0iZDx+
fl4/fSNAIX0hfSV9IH04fSF9JH0lXH0NClNlcCAxMCAwOTo1NjoyMSBuYW5vIGNoYXRbMTUxMV06
ICJ9Jl4/Xj9eP14/fSV9Jn0pXkcjTn0nfSJ9KH0iLTV+fl4/fSNAIX0hfSZ9IH04fSF9JH0lXH0i
fSZeP14/Xj9eP30lfSZ9KV5HI059J30ifSh9Imcnfn5eP30jDQpTZXAgMTAgMDk6NTY6MjQgbmFu
byBjaGF0WzE1MTFdOiBAIX0hfSd9IH04fSF9JH0lXH0ifSZeP14/Xj9eP30lfSZ9KV5HI059J30i
fSh9Ii4ufn5eP30jQCF9IX0ofSB9OH0hfSR9JVx9In0mXj9eP14/Xj99JX0mfSkNClNlcCAxMCAw
OTo1NjozMCBuYW5vIGNoYXRbMTUxMV06IF5HI059J30ifSh9Im5lfn5eP30jQCF9IX0pfSB9OH0h
fSR9JVx9In0mXj9eP14/Xj99JX0mfSleRyNOfSd9In0ofSInbH5+Xj99I0AhfSF9Kn0gfTh9IX0N
ClNlcCAxMCAwOTo1NjozMyBuYW5vIGNoYXRbMTUxMV06IGFsYXJtDQpTZXAgMTAgMDk6NTY6MzMg
bmFubyBjaGF0WzE1MTFdOiBGYWlsZWQNClNlcCAxMCAwOTo1NjozMyBuYW5vIHBwcGRbMTUxMF06
IENvbm5lY3Qgc2NyaXB0IGZhaWxlZA0KU2VwIDEwIDA5OjU2OjM0IG5hbm8gcHBwZFsxNTEwXTog
RXhpdC4NCg0KcHBwMCBJbnRlcmZhY2U6IChpZmNvbmZpZykNCj09PT09PT09PT09PT09PT09PT0N
Cg0Kbm8gcHBwMCBJbnRlcmZhY2UgZm91bmQuLi4NCg0KcHBwIE1vZHVsZTogKGxzbW9kKQ0KPT09
PT09PT09PT09PT09PQ0KDQpwcHBfZ2VuZXJpYw0KcHBwX2FzeW5jDQpzbGhjDQoNCi9ldGMvcHBw
L29wdGlvbnM6ICh3L28gY29tbWVudHMpDQo9PT09PT09PT09PT09PT09PT09PT09PT09PT0NCg0K
I25hbWUgPGhvc3Q+DQojdXNlaG9zdG5hbWUNCm5vaXBkZWZhdWx0DQppcGNwLWFjY2VwdC1sb2Nh
bA0KaXBjcC1hY2NlcHQtcmVtb3RlDQojZGlzY29ubmVjdCAiY2hhdCAtLSBcZCsrK1xkXGMgT0sg
YXRoMCBPSyINCmRlYnVnDQoja2RlYnVnIG4NCiNub2F1dGgNCmNydHNjdHMNCmxvY2sNCm1vZGVt
DQojbG9jYWwNCiNhc3luY21hcCAgMjAwYTAwMDANCmFzeW5jbWFwIDANCiNkZWZhdWx0LWFzeW5j
bWFwDQojbXJ1IDU0Mg0KI210dSA8bj4NCiNuZXRtYXNrIDI1NS4yNTUuMjU1LjANCiNub2RldGFj
aA0KbGNwLWVjaG8taW50ZXJ2YWwgMzANCmxjcC1lY2hvLWZhaWx1cmUgNA0KbGNwLW1heC1jb25m
aWd1cmUgNjANCmxjcC1yZXN0YXJ0IDINCmlkbGUgNjAwDQojbWF4ZmFpbCAzDQpub2lweA0KI25v
ZGVmYXVsdHJvdXRlDQojbm9yZXBsYWNlZGVmYXVsdHJvdXRlDQojcmVtb3RlbmFtZSA8bj4NCiNw
cm94eWFycA0KI2xvZ2luDQojbXMtZG5zIDE5Mi4xNjguMS4xDQojbXMtZG5zIDE5Mi4xNjguMS4y
DQojbXMtd2lucyAxOTIuMTY4LjEuNTANCiNtcy13aW5zIDE5Mi4xNjguMS41MQ==

--0__=C1256F0B0042177C8f9e8a93df938690918cC1256F0B0042177C--

