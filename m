From: Jar <jar@pcuf.fi>
Date: Mon, 06 Feb 2006 20:36:45 +0000
Subject: Re: PPPoE stuff
Message-Id: <43E7B35D.2000100@pcuf.fi>
List-Id: <linux-ppp.vger.kernel.org>
References: <op.s4kigj0bblqxiz@jono.amd>
In-Reply-To: <op.s4kigj0bblqxiz@jono.amd>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Ionut Turturica wrote:

> Feb  6 22:06:22 lfs pppoe-server[31771]: Session 2 created for client  
> 00:11:2f:22:c0:7a (10.67.15.2) on br0 using Service-Name ''
> Feb  6 22:06:53 lfs pppd[31771]:   script /usr/sbin/pppoe -n -I br0 -e  
> 2:00:11:2f:22:c0:7a -S '', pid 31772

Why you run pppoe over bridge interface br0? Is that going to work? 
Which bridge port it is going to use? Usually pppoe is running over 
ethernet device, it doesn't need ip interface. Interface can have an ip, 
but pppoe doesn't use it.

-- 
Best Regards, Jar
