From: Thomas Glanzmann <thomas@glanzmann.de>
Date: Tue, 11 Apr 2017 14:32:20 +0000
Subject: Re: pppoe encapsulated udp packets which appear on ethernet disappear between pppoe and ppp0 after p
Message-Id: <20170411143220.GA1726@glanzmann.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <20170410183851.GA4442@glanzmann.de>
In-Reply-To: <20170410183851.GA4442@glanzmann.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello Michael,
small follow up. Taking the link down on my site seems to reset the
pppoe session on the remote site. This symptom was probably triggered by
the reboot of the server.

--
(generate-03) [~] ping -c 5 172.17.0.254
PING 172.17.0.254 (172.17.0.254) 56(84) bytes of data.

--- 172.17.0.254 ping statistics ---
5 packets transmitted, 0 received, 100% packet loss, time 4092ms

(generate-03) [~] poff; ifconfig eth1 down; sleep 10; ifconfig eth1 up; pon dsl-provider
Plugin rp-pppoe.so loaded.
(generate-03) [~] ping -c 5 172.17.0.254
PING 172.17.0.254 (172.17.0.254) 56(84) bytes of data.
64 bytes from 172.17.0.254: icmp_seq=1 ttld timeA.5 ms
64 bytes from 172.17.0.254: icmp_seq=2 ttld timeA.1 ms
64 bytes from 172.17.0.254: icmp_seq=3 ttld timeA.4 ms
64 bytes from 172.17.0.254: icmp_seq=4 ttld timeA.2 ms
64 bytes from 172.17.0.254: icmp_seq=5 ttld timeA.4 ms

--- 172.17.0.254 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4005ms
rtt min/avg/max/mdev = 41.194/41.377/41.579/0.148 ms
--

Also my ssh session survives, which it previously did not. Thank you again.

Cheers,
        Thomas
