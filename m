From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Fri, 20 Jan 2012 06:16:30 +0000
Subject: Re: Single core gets pegged on multi-core PPTP server
Message-Id: <1327040190.4826.7.camel@edumazet-laptop>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAJuWrdtDgeCOSEvD-ytfwGj4UQeOtjeqUZd3Y1SLpbbsSvrycg@mail.gmail.com>
In-Reply-To: <CAJuWrdtDgeCOSEvD-ytfwGj4UQeOtjeqUZd3Y1SLpbbsSvrycg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Bradley Peterson <despite@gmail.com>
Cc: paulus@samba.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org

Le jeudi 19 janvier 2012 à 16:35 -0600, Bradley Peterson a écrit :
> Hello,
> 
> I am trying to test the capacity of a linux PPTP server, both in
> number of connections, and in packets per second.  I am using kernel
> 2.6.38.8, with the ppp, pptp, and gre modules, and accel-pptp 0.8.3.
> I have RPS, RFS, and XPS enabled on the network devices for SMP
> support.
> 
> But I'm seeing one CPU get pegged out with soft interrupt, while the
> others are almost completely idle.
> 
> In my current test, I'm starting 250 pptp connections from another
> server, then running iperf across each connection.  The client machine
> pegs out, sure, but I'm surprised the server pegs out a single CPU.
> With RPS, I would expect softirq's to be more balanced.
> 
> Where could the bottleneck be?  Do all ppp packets need to be
> processed serially?
> 

Hmmm, you need a more recent kernel or backport commit 
c6865cb3cc6f3c2857fa4c6f5fda2945d70b1e84
    rps: Inspect GRE encapsulated packets to get flow hash
    
    Crack open GRE packets in __skb_get_rxhash to compute 4-tuple hash on
    in encapsulated packet.  Note that this is used only when the
    __skb_get_rxhash is taken, in particular only when the device does
    not compute provide the rxhash (ie. feature is disabled).
    
    This was tested by creating a single GRE tunnel between two 16 core
    AMD machines.  200 netperf TCP_RR streams were ran with 1 byte
    request and response size.
    
    Without patch: 157497 tps, 50/90/99% latencies 1250/1292/1364 usecs
    With patch: 325896 tps, 50/90/99% latencies 603/848/1169
    
    Signed-off-by: Tom Herbert <therbert@google.com>
    Signed-off-by: David S. Miller <davem@davemloft.net>



And make sure you disabled hardware rxhash (if your NIC provides it)


