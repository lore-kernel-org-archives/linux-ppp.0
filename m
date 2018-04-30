From: Goran <sendmailtogoran@gmail.com>
Date: Mon, 30 Apr 2018 12:08:08 +0000
Subject: Namespaces and pppd
Message-Id: <CABS5c+EH+tDuaxjJpQ5_66uW1KrdsScFX8e_06GKmc84_3=A+w@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I'm trying to get pppd to create a ppp0 device inside a namespace.

I've tried something like this

ip netns add physical
ip link set enp5s0f0 netns physical
ip netns exec physical pppd call my-isp

pppd starts, I can see it in the process-list, but no ppp0 device is created.

Is there a solution?

Regards
Goran
