From: Yan Seiner <yan@seiner.com>
Date: Sun, 06 Dec 2015 16:27:42 +0000
Subject: Netflix and pppd
Message-Id: <566461FE.4090003@seiner.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I've been chasing a weird issue with Netflix and pppd.  Basically, the 
Netflix apps in my Roku and Samsung TV will not play reliably when using 
pppoe.  Using tcpdump I can see packets flow, but the app will either 
stop at 25% or 99% and eventually time out with the "We're having 
trouble playing this title right now".

If I set up my modem to handle the pppoe connection and do double NAT, 
it works fine.  The problem only comes up when I set up the modem to act 
as a dumb modem and use pppd to complete the connection.  The problem 
only happens when I am running pppd to set up the connection.

Netflix through a browser works fine.

I am running pppd 2.4.7.

Here's what I've done:

Enabled icmp fully (I don't block any icmp messges)
Enabled arp by default
Set up the TV and the Roku to use google DNS instead of dnsmasq DNS 
forwarding
Set up dnsmasq to tell dhcp clients to use a shorter packet length
Disabled QOS
Disabled dns-rebind protection.
Snippet of tcpdump when the whirlygig is stuck at 99%

07:42:47.464150 IP samsungtv.lan.41108 > 
ipv4_1.lagg0.c023.iad001.ix.nflxvideo.net.www: Flags [.], ack 174241, 
win 6200, options [nop,nop,TS val 229009 ecr 175479014], length 0
07:42:47.464577 IP ipv4_1.lagg0.c023.iad001.ix.nflxvideo.net.www > 
samsungtv.lan.41108: Flags [.], seq 174241:175681, ack 286, win 2050, 
options [nop,nop,TS val 175479056 ecr 228993], length 1440
07:42:47.466836 IP ipv4_1.lagg0.c023.iad001.ix.nflxvideo.net.www > 
samsungtv.lan.41108: Flags [.], seq 175681:177121, ack 286, win 2050, 
options [nop,nop,TS val 175479056 ecr 228993], length 1440
07:42:47.468982 IP ipv4_1.lagg0.c023.iad001.ix.nflxvideo.net.www > 
samsungtv.lan.41108: Flags [.], seq 177121:178561, ack 286, win 2050, 
options [nop,nop,TS val 175479056 ecr 228993], length 1440
07:42:47.471442 IP ipv4_1.lagg0.c023.iad001.ix.nflxvideo.net.www > 
samsungtv.lan.41108: Flags [.], seq 178561:180001, ack 286, win 2050, 
options [nop,nop,TS val 175479056 ecr 228993], length 1440
07:42:47.505174 IP samsungtv.lan.41108 > 
ipv4_1.lagg0.c023.iad001.ix.nflxvideo.net.www: Flags [.], ack 180001, 
win 5320, options [nop,nop,TS val 229020 ecr 175479056]

