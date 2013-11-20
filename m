From: Lorenzo Milesi <maxxer@ufficyo.com>
Date: Wed, 20 Nov 2013 21:45:23 +0000
Subject: Double radius accounting
Message-Id: <1683678123.142102.1384983923718.JavaMail.zimbra@yetopen.it>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi.
I've configured a PPTP server with FreeRadius authentication, and I'm having some problems with authorization: in the accounting table I see a double accounting session for every client.
The two sessions are almost identical, they differ by just one (or zero) second in the start time.
My clients are (mostly) DDWRT routers connecting to a Debian server with pptp version 1.3.4-3 and pppd 2.4.5. 

I tried enabling dump in ppp options and syslog shows the following:
Nov 14 11:06:45 hotspotserver-dev pptpd[29274]: CTRL: Client 100.70.2.234 control connection started
Nov 14 11:06:46 hotspotserver-dev pptpd[29274]: CTRL: Starting call (launching pppd, opening GRE)
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: Plugin radius.so loaded.
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: RADIUS plugin initialized.
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: Plugin radattr.so loaded.
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: RADATTR plugin initialized.
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: Plugin radius.so loaded.
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: RADIUS plugin initialized.
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: Plugin radattr.so loaded.
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: RADATTR plugin initialized.
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: Plugin /usr/lib/pptpd/pptpd-logwtmp.so loaded.
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: pppd options in effect:
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: dump#011#011# (from /etc/ppp/options)
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: plugin radius.so#011#011# (from /etc/ppp/options)
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: plugin radattr.so#011#011# (from /etc/ppp/options)
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: plugin radius.so#011#011# (from /etc/ppp/options)
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: plugin radattr.so#011#011# (from command line)
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: plugin /usr/lib/pptpd/pptpd-logwtmp.so#011#011# (from command line)
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: require-mschap-v2#011#011# (from /etc/ppp/options)
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: refuse-pap#011#011# (from /etc/ppp/options)
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: refuse-chap#011#011# (from /etc/ppp/options)
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: refuse-mschap#011#011# (from /etc/ppp/options)
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: name pptpd#011#011# (from /etc/ppp/options)
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: pptpd-original-ip 100.70.2.234#011#011# (from command line)
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: 115200#011#011# (from command line)
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: lock#011#011# (from /etc/ppp/options)
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: crtscts#011#011# (from /etc/ppp/options)
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: modem#011#011# (from /etc/ppp/options)
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: asyncmap 0#011#011# (from /etc/ppp/options)
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: mru 1490#011#011# (from /etc/ppp/options)
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: mtu 1490#011#011# (from /etc/ppp/options)
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: lcp-echo-failure 4#011#011# (from /etc/ppp/options)
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: lcp-echo-interval 30#011#011# (from /etc/ppp/options)
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: lcp-max-configure 30#011#011# (from /etc/ppp/options)
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: hide-password#011#011# (from /etc/ppp/options)
Nov 14 11:06:46 hotspotserver-dev pppd[29275]: ipparam 100.70.2.234#011#011# (from command line)

Is it normal to see the radius plugin initializaion TWICE?
Why pppd says it got the radius plugin from command line while it has not? I already did some debugging with poptop mailing list but we didn't figure out anything on that side. We also checked the command parameters and this is the output (don't mind the different IP, it was another process than the above):
# xxd -g 1 /proc/29924/cmdline 
0000000: 2f 75 73 72 2f 73 62 69 6e 2f 70 70 70 64 00 6c  /usr/sbin/pppd.l
0000010: 6f 63 61 6c 00 66 69 6c 65 00 2f 65 74 63 2f 70  ocal.file./etc/p
0000020: 70 70 2f 6f 70 74 69 6f 6e 73 00 31 31 35 32 30  pp/options.11520
0000030: 30 00 31 30 2e 32 35 32 2e 39 2e 31 3a 31 30 2e  0.10.252.9.1:10.
0000040: 32 35 32 2e 31 30 2e 31 00 69 70 70 61 72 61 6d  252.10.1.ipparam
0000050: 00 31 30 39 2e 37 30 2e 32 30 30 2e 31 33 34 00  .109.70.200.134.
0000060: 70 6c 75 67 69 6e 00 2f 75 73 72 2f 6c 69 62 2f  plugin./usr/lib/
0000070: 70 70 74 70 64 2f 70 70 74 70 64 2d 6c 6f 67 77  pptpd/pptpd-logw
0000080: 74 6d 70 2e 73 6f 00 70 70 74 70 64 2d 6f 72 69  tmp.so.pptpd-ori
0000090: 67 69 6e 61 6c 2d 69 70 00 31 30 39 2e 37 30 2e  ginal-ip.109.70.
00000a0: 32 30 30 2e 31 33 34 00                          200.134.

Why does it write double accounting records? What can I check?

Thanks!

My configs:

/etc/pptpd.conf:
option /etc/ppp/options
logwtmp
localip 10.252.9.1
remoteip 10.252.10.1-254,10.252.11.1-254,10.252.12.1-254
connections 500

/etc/ppp/options:
name pptpd
asyncmap 0
auth
crtscts
lock
hide-password
modem
lcp-echo-interval 30
lcp-echo-failure 4
lcp-max-configure 30
noipx
refuse-pap
refuse-chap
refuse-mschap
require-mschap-v2
require-mppe-128
proxyarp
nodefaultroute
nobsdcomp
mtu 1490
mru 1490
plugin radius.so
plugin radattr.so

/etc/radiusclient/radiusclient.conf:
auth_order      radius,local
login_tries     4
login_timeout   60
nologin /etc/nologin
issue   /etc/radiusclient/issue
authserver      localhost
acctserver      localhost
servers         /etc/radiusclient/servers
dictionary      /etc/radiusclient/dictionary
login_radius    /usr/sbin/login.radius
seqfile         /var/run/radius.seq
mapfile         /etc/radiusclient/port-id-map
default_realm
radius_timeout  10
radius_retries  3
login_local     /bin/login


-- 
Lorenzo Milesi - lorenzo.milesi@yetopen.it

YetOpen S.r.l. - http://www.yetopen.it/

