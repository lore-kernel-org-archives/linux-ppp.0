From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Mon, 22 Mar 2010 11:06:44 +0000
Subject: Re: Performance hit with IP-tunnels
Message-Id: <1269256004.3029.21.camel@edumazet-laptop>
List-Id: <linux-ppp.vger.kernel.org>
References: <000301cac9a8$dcd53750$967fa5f0$@no>
In-Reply-To: <000301cac9a8$dcd53750$967fa5f0$@no>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Kristian Evensen <kristrev@simula.no>
Cc: netdev@vger.kernel.org, linux-ppp@vger.kernel.org

Le lundi 22 mars 2010 à 11:17 +0100, Kristian Evensen a écrit :
> Hello,
> 
> I am currently comparing different IP-tunneling protocols/implementations,
> and have stumbled upon something I am not able to explain. Regardless of
> which tunneling technology I use, the latency increases with a couple of 10s
> of ms and I see a significant degradation of throughput (compared to when no
> tunnels are used). The only exception is IP-in-IP, where I get similar
> performance with and without tunnels, but it does unfortunately not work in
> my scenario.
> 
> First, I thought this was caused by the different tunneling software, but
> after measuring the processing time of the applications (xl2tp and
> pptp-client) and when the packets are seen by the different iptables chains
> (using LOG), these delays seem to be acceptable. However, one delay sticks
> out. After the packet has been decapsulated and fed to PPP, it takes a
> "long" time before it is seen again. My question is, can PPP be the cause of
> the higher latency and lower throughput? 
> 
> Similar observations are made at both ends of the tunnel.

A soon as a round trip on a user process is requested to handle a
packet, you can have delay because of scheduling constraints.

You could try latencytop and check if something strange raises, 10 ms
seems excessive.

IP-TIP tunnels dont use a user space program, they are immune to
scheduler latencies.


