From: Sven Kirmess <sven.kirmess@kzone.ch>
Date: Tue, 27 Dec 2016 23:26:57 +0000
Subject: Starting dhcpcd terminates the established PPPoE connection
Message-Id: <CAMBnWDj4zppEWV4i0ekcNmgbEDP_eVENBkKDEjFHUP8ZJYZi=w@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

My firewall runs LEAF Bering-uClibc 6.0.0, which comes with pppd 2.4.7
and dhcpcd 6.11.5. Most of the time IPv6 is working, but from time to
time I have the following really strange problem. The PPPoE connection
is established (with +ipv6 in /etc/ppp/options). But whenever I start
the dhcpcd, which should obtain IPv6 adresses through DHCPv6-PD, the
connection gets terminated.

From the logs it looks like the ISP terminates the connection (LCP
terminated by peer) because it wasn't able to serve me an IPv6 range
(DHCPv6 REPLY: NOPREFIX-AVAIL).

Does that make sense?

Is that a problem with my ISP?

Or is that a problem on my side? The problem started after I've
rebooted the firewall, maybe some state file did not survive the
reboot.

Sven


From /var/log/daemon.log:

Dec 25 02:26:55 kaldra dhcpcd[9062]: ppp0: unsupported interface family 00
Dec 25 02:26:55 kaldra dhcpcd[9062]: forked to background, child pid 9083
Dec 25 02:26:55 kaldra dhcpcd[9083]: DUID
00:01:00:01:1e:92:58:a5:00:0d:b9:40:7f:ec
Dec 25 02:26:55 kaldra dhcpcd[9083]: em2.100: IAID b9:40:7f:ee
Dec 25 02:26:55 kaldra dhcpcd[9083]: em2.100: IAID conflicts with one
assigned to em2.170
Dec 25 02:26:55 kaldra dhcpcd[9083]: em2.170: IAID b9:40:7f:ee
Dec 25 02:26:55 kaldra dhcpcd[9083]: em2.170: IAID conflicts with one
assigned to em2.100
Dec 25 02:26:55 kaldra dhcpcd[9083]: em2.191: IAID b9:40:7f:ee
Dec 25 02:26:55 kaldra dhcpcd[9083]: em2.191: IAID conflicts with one
assigned to em2.100
Dec 25 02:26:55 kaldra dhcpcd[9083]: em2.192: IAID b9:40:7f:ee
Dec 25 02:26:55 kaldra dhcpcd[9083]: em2.192: IAID conflicts with one
assigned to em2.100
Dec 25 02:26:55 kaldra dhcpcd[9083]: em2.193: IAID b9:40:7f:ee
Dec 25 02:26:55 kaldra dhcpcd[9083]: em2.193: IAID conflicts with one
assigned to em2.100
Dec 25 02:26:55 kaldra dhcpcd[9083]: ppp0: IAID 70:70:70:30
Dec 25 02:26:55 kaldra dhcpcd[9083]: ppp0: IAID 00:00:00:01
Dec 25 02:26:55 kaldra dhcpcd[9083]: ppp0: soliciting a DHCPv6 lease
Dec 25 02:26:55 kaldra dhcpcd[9083]: ppp0: soliciting an IPv6 router
Dec 25 02:26:55 kaldra dhcpcd[9083]: ppp0: Router Advertisement from
fe80::20e:d6ff:fea6:ec1b
Dec 25 02:26:55 kaldra dhcpcd[9083]: ppp0: adding address
2a02:200:2f00:91d:dd04:a113:6f76:82f4/64
Dec 25 02:26:56 kaldra dhcpcd[9083]: ppp0: DHCPv6 REPLY: NOPREFIX-AVAIL
Dec 25 02:26:56 kaldra dhcpcd[9083]: ppp0: carrier lost
Dec 25 02:26:56 kaldra dhcpcd[9083]: ppp0: deleting address
2a02:200:2f00:91d:dd04:a113:6f76:82f4/64
Dec 25 02:26:57 kaldra dhcpcd[9083]: ppp0: removing interface


From /var/log/ppp.log:

Dec 25 02:26:56 kaldra pppd[8185]: rcvd [LCP TermReq id=0x2]
Dec 25 02:26:56 kaldra pppd[8185]: LCP terminated by peer
Dec 25 02:26:56 kaldra pppd[8185]: Connect time 1.0 minutes.
Dec 25 02:26:56 kaldra pppd[8185]: Sent 470280 bytes, received 513340 bytes.
Dec 25 02:26:56 kaldra pppd[8185]: Script /etc/ppp/ip-down started (pid 9097)
Dec 25 02:26:56 kaldra pppd[8185]: Script /etc/ppp/ipv6-down started (pid 9100)
Dec 25 02:26:56 kaldra pppd[8185]: sent [LCP TermAck id=0x2]
Dec 25 02:26:56 kaldra pppd[8185]: Script /etc/ppp/ip-down finished
(pid 9097), status = 0x1
Dec 25 02:26:56 kaldra pppd[8185]: Script /etc/ppp/ipv6-down finished
(pid 9100), status = 0x1
Dec 25 02:26:57 kaldra pppd[8185]: rcvd [LCP TermReq id=0x8f]
Dec 25 02:26:57 kaldra pppd[8185]: sent [LCP TermAck id=0x8f]
Dec 25 02:26:57 kaldra pppd[8185]: Modem hangup
Dec 25 02:26:57 kaldra pppd[8185]: Connection terminated.
Dec 25 02:26:57 kaldra pppd[8185]: Connect time 1.0 minutes.
Dec 25 02:26:57 kaldra pppd[8185]: Sent 470280 bytes, received 513520 bytes.
Dec 25 02:26:57 kaldra pppd[8185]: Failed to disconnect PPPoE socket:
114 Operation already in progress
