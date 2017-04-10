From: Thomas Glanzmann <thomas@glanzmann.de>
Date: Mon, 10 Apr 2017 18:38:51 +0000
Subject: pppoe encapsulated udp packets which appear on ethernet disappear between pppoe and ppp0 after pppoe
Message-Id: <20170410183851.GA4442@glanzmann.de>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello,
I have a openvpn connection using port 5000 udp. One openvpn endpoint
uses pppoe, the otherone is connected using ethernet. After a reboot the
openvpn works. However if the pppoe session is manually or due to 24
hour disconnect terminated, the openvpn connection stops working.
Strange is that I can see the inbound udp packets on the ethernet device
inside the pppoe session, but I can no longer see them on ppp0. When I
reboot the system, it continues working till the next hangup.

        I tried so far the following:

                - I'm running debian stable, upgraded the kernel to:
                  '4.9.0-0.bpo.2-amd64', no change
                - I upgraded pppd to 'ppp_2.4.7-1+4_amd64.deb', no
                  change
                - I tried to flush the conntrack table, no change
                - I tried to change the udp port, no change.
                - I tried to enable debug and kdebug 4 in ppp without any
                  additional logging.
                - Sniffed the pppoe traffic and verified the ipv4 and udp header
                  checksums using wireshark, they're correct.
                - net.ipv4.conf.ppp0.log_martians = 1 and looked in dmesg, nothing.

Sniffing on 217.92.232.50 eth1 (connection to the dsl modem) I can see packets
orginating from 217.92.232.50 as well as from 88.198.215.20. [1]

infra) [~/.www/tmp/ppp] tcpdump -r eth1.pcap -s 0 -n | grep UDP | grep 5000
reading from file eth1.pcap, link-type EN10MB (Ethernet)
20:30:53.439370 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 68
20:30:53.439391 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:30:53.439406 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:30:54.438912 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:30:55.438919 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:30:56.438919 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:30:57.438945 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:30:58.438914 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:30:59.438910 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:00.438912 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:01.438911 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:02.438945 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:03.438935 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:03.438954 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 68
--
20:31:03.680762 PPPoE  [ses 0xb5e0] IP 88.198.215.20.5000 > 217.92.232.50.5000: UDP, length 68
--
20:31:04.438845 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:05.438913 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:06.438917 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:07.438922 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:08.438914 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:09.438925 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:10.438914 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:11.438909 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:12.438911 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:13.438938 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:13.438955 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 68
--
20:31:13.456015 PPPoE  [ses 0xb5e0] IP 88.198.215.20.5000 > 217.92.232.50.5000: UDP, length 68
20:31:13.456521 PPPoE  [ses 0xb5e0] IP 88.198.215.20.5000 > 217.92.232.50.5000: UDP, length 68
--
20:31:14.438915 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:15.438916 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:16.438934 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:17.438946 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:18.438913 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:19.438913 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:20.438883 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:21.438913 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:22.438912 PPPoE  [ses 0xb7b3] IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
--
20:31:23.145767 PPPoE  [ses 0xb5e0] IP 88.198.215.20.5000 > 217.92.232.50.5000: UDP, length 68
20:31:23.146251 PPPoE  [ses 0xb5e0] IP 88.198.215.20.5000 > 217.92.232.50.5000: UDP, length 68

Sniffing on 217.92.232.50 at the same time on ppp0, I can only see packets
originating 217.92.232.50, but not from 88.198.215.20: [2]

(infra) [~/.www/tmp/ppp] tcpdump -r ppp0.pcap -s 0 -n
reading from file ppp0.pcap, link-type LINUX_SLL (Linux cooked)
20:30:54.438907 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:30:55.438914 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:30:56.438914 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:30:57.438939 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:30:58.438908 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:30:59.438905 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:00.438907 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:01.438906 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:02.438938 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:03.438930 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:03.438952 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 68
20:31:04.438841 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:05.438908 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:06.438912 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:07.438917 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:08.438909 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:09.438920 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:10.438909 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:11.438904 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:12.438906 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:13.438933 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:13.438953 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 68
20:31:14.438910 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:15.438911 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:16.438929 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:17.438941 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:18.438908 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:19.438909 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:20.438878 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148
20:31:21.438908 IP 217.92.232.50.5000 > 88.198.215.20.5000: UDP, length 148

Sniffing at the same time on 88.198.215.20, I can see the packets going out,
but no packets going in. All other traffic (tcp; icmp) works like a charm: [3]

(infra) [~/.www/tmp/ppp] tcpdump -r bond0.997.pcap -s 0 -n
reading from file bond0.997.pcap, link-type EN10MB (Ethernet)
20:30:51.432023 IP 88.198.215.20.5000 > 217.92.232.50.5000: UDP, length 68
20:30:51.432053 IP 88.198.215.20.5000 > 217.92.232.50.5000: UDP, length 68
20:31:03.653245 IP 88.198.215.20.5000 > 217.92.232.50.5000: UDP, length 68
20:31:13.428410 IP 88.198.215.20.5000 > 217.92.232.50.5000: UDP, length 68
20:31:13.428443 IP 88.198.215.20.5000 > 217.92.232.50.5000: UDP, length 68
20:31:23.118177 IP 88.198.215.20.5000 > 217.92.232.50.5000: UDP, length 68
20:31:23.118204 IP 88.198.215.20.5000 > 217.92.232.50.5000: UDP, length 68

I'm grateful for any pointers how to debug this problem further or for ideas
which can be used to resolve the issue. Currently I switched to tcp, which is
working perfectly fine. All other traffic appears to work fine over the link
(http, https, dns, ssh, pop3s, imaps, ...).

[1] https://thomas.glanzmann.de/tmp/ppp/eth1.pcap (6 MB)
[2] https://thomas.glanzmann.de/tmp/ppp/ppp0.pcap
[3] https://thomas.glanzmann.de/tmp/ppp/bond0.997.pcap

Cheers,
        Thomas
