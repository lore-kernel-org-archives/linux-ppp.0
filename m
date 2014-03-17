From: Charlie Brady <charlieb-linux-ppp@budge.apana.org.au>
Date: Mon, 17 Mar 2014 16:12:05 +0000
Subject: Re: Plugin Development getting peer ip.
Message-Id: <Pine.LNX.4.64.1403171211020.21691@e-smith.charliebrady.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <532717B6.4040909@gmail.com>
In-Reply-To: <532717B6.4040909@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


On Mon, 17 Mar 2014, Greg wrote:

> Hey guys,
> 
> I was wondering if anyone could tell me how to get the ip address from the
> client when using ip_up notifier?

You need to read the pppd dopcumentation. Look at '/etc/ppp/ip-up' in 'man 
pppd'.

> 
> Also, with the ip_down notifier.
> 
> I'm attempting to track the bandwidth usage and connection via the above
> notifiers.  Any help would be greatly appreciated.
> 
> 
