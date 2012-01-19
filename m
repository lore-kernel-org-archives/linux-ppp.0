From: Bradley Peterson <despite@gmail.com>
Date: Thu, 19 Jan 2012 22:35:59 +0000
Subject: Single core gets pegged on multi-core PPTP server
Message-Id: <CAJuWrdtDgeCOSEvD-ytfwGj4UQeOtjeqUZd3Y1SLpbbsSvrycg@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paulus@samba.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org

Hello,

I am trying to test the capacity of a linux PPTP server, both in
number of connections, and in packets per second.  I am using kernel
2.6.38.8, with the ppp, pptp, and gre modules, and accel-pptp 0.8.3.
I have RPS, RFS, and XPS enabled on the network devices for SMP
support.

But I'm seeing one CPU get pegged out with soft interrupt, while the
others are almost completely idle.

In my current test, I'm starting 250 pptp connections from another
server, then running iperf across each connection.  The client machine
pegs out, sure, but I'm surprised the server pegs out a single CPU.
With RPS, I would expect softirq's to be more balanced.

Where could the bottleneck be?  Do all ppp packets need to be
processed serially?

Brad
