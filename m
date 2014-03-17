From: walter harms <wharms@bfs.de>
Date: Mon, 17 Mar 2014 16:19:25 +0000
Subject: Re: Plugin Development getting peer ip.
Message-Id: <5327208D.1060300@bfs.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <532717B6.4040909@gmail.com>
In-Reply-To: <532717B6.4040909@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

hi Greg,
according to the man page you can have up to 6 arguments:
  interface-name   tty-device   speed  local-IP-address   remote-IP-address ipparam

I guess you are searching for remote-IP-address.

re,
 wh


Am 17.03.2014 16:41, schrieb Greg:
> Hey guys,
> 
> I was wondering if anyone could tell me how to get the ip address from
> the client when using ip_up notifier?
> 
> Also, with the ip_down notifier.
> 
> I'm attempting to track the bandwidth usage and connection via the above
> notifiers.  Any help would be greatly appreciated.
> 
