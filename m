From: Kristian Evensen <kristian.evensen@gmail.com>
Date: Thu, 14 Jan 2010 22:19:05 +0000
Subject: PPP and buffer sizes
Message-Id: <4B4F9859.1050909@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello,

I am trying to debug a performance issue I am experiencing with 
L2TP-tunnels (created using xl2tpd). When I measure the UDP-performance 
of different desired throughputs using iperf together with the tunnel, I 
see that the throughput stabilizes at a certain speed while the packet 
loss increases. When I measure the performance using TCP together with 
the tunnel, I see a very high number of packet losses, forcing 
congestion control and resulting in a significantly lower throughput 
than without tunneling.

I guess this is caused by buffers being filled up and packets are 
dropped, however, I have not been able to figure out which buffer or 
exactly why this happens. If I remove the tunnels and measure the 
performance, the maximum supported throughput by the network is reached, 
so both the UDP and TCP send and receive buffers are big enough. I have 
also measured the processing delay caused by the L2TP-software and that 
is at most 50 microseconds, which should not affect the results.

L2TP passes packets to PPP after they have been decapsulated and, as far 
as I have understood, PPP + IP layer processing (which is on microsecond 
scale) is the last step before the packet is sent to the application 
layer. My question is therefore, is there anything in PPP that can 
explain what I am experiencing?

Thanks in advance for any help,
Kristian
