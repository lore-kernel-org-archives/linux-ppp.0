From: Thomas Glanzmann <thomas@glanzmann.de>
Date: Tue, 11 Apr 2017 04:34:32 +0000
Subject: Re: pppoe encapsulated udp packets which appear on ethernet disappear between pppoe and ppp0 after p
Message-Id: <20170411043432.GA20678@glanzmann.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <20170410183851.GA4442@glanzmann.de>
In-Reply-To: <20170410183851.GA4442@glanzmann.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello Michael,

* Michael Richardson <mcr@sandelman.ca> [2017-04-10 22:02]:

> Are you using openvpn with a 0.0.0.0/0 route?

no, I don't.

> Can you post your routing table when it is working, and when it is
> not?

The routing table is the same:

(generate-03) [~] ip r s
default dev ppp0  scope link
172.17.0.0/24 via 172.17.0.254 dev falkenstein
172.17.0.254 dev falkenstein  proto kernel  scope link  src 192.168.168.1
172.19.0.0/24 via 172.19.0.254 dev eclogicnew
172.19.0.254 dev eclogicnew  proto kernel  scope link  src 192.168.168.1
172.20.0.0/24 via 172.19.0.254 dev eclogicnew
192.168.168.0/24 dev eth0  proto kernel  scope link  src 192.168.168.1
217.5.98.12 dev ppp0  proto kernel  scope link  src 217.92.232.50

The real interesting question is, why do perfectly healthy ip/udp packets from
within the pppoe session drop before reaching ppp0? Why does it only happen
after one hangup?

Cheers,
        Thomas
