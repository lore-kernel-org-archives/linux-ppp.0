From: Bill Unruh <unruh@physics.ubc.ca>
Date: Sat, 10 Apr 2004 19:41:06 +0000
Subject: Re: pppd routing
Message-Id: <Pine.LNX.4.50.0404101235160.31485-100000@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <40799D08.40700@netscape.net>
In-Reply-To: <40799D08.40700@netscape.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Sun, 11 Apr 2004, nick wrote:

> 
> Hi, I am still trying to connect to the Internet from Linux and I cannot 
> seem to get the network/routing right.
> 
> When I connect from windows, the DNS server, personal IP and routing are 
>    established automatically, but not under linux ? Why ?
> 
> 
>  >Did u get the ip address? Maybe you should check is there are DNS 
>  >servers ips on your /etc/resolv.conf using the cat command if you want 
>  >cat /etc/resolv.conf. If there is none, you should add the following 
>  >line:
>  >nameserver1 IP_ADDRESS of the DNS server
>  >nameserver2 IP_ADDRESS of the second DNS server
>  >Example:
>  >nameserver1 200.176.3.10
>  >nameserver2 200.176.3.11
> 
> 
> I did that, but it did not solve anything.
> Now, i cannot even get the Linux up and running. I had the bad idea to 
> run 'setup' and tell Linux to start 'sendmail' at startup. When it gets 

It only blocks for about 3 min. then it continues. So start it up, go
out for a coffee or watch one of the Stanley cup games, and after that
come back and remove the sendmail. It is trying to do some address
lookups and failing on overly long timeouts.

> to sendmail, it just blocks and Linux won't start. I tried to pass 
> "linux single", to grub, so I can run setup againg and remove , but it 
> does not work.

"it does not work" What does not work? 

> 
> Someone else says:
> 
> "One of (at least) three possible things:
>    - your local name service is misconfigured (what's in
>            /etc/resolv.conf?)
> 
>      - your local routing configuration is wrong (what does
>            'netstat -nr' or 'route -n' report?)"
> 
> I looked at "netstat -nr" and "route -n", but since I run windows/linux 
> on the same laptop (and cannot connect to the net from Linux), I could 
> not capture the output into a file and send it along with the email.
> 
> Again, I use 'usedefaultroute' (or 'defaultroute)in pppd script/conf, 
> wasn't it suppose to add the routing automatically to the routing table 

No, it does not do so if you also have an ethernet card with a default
route. 
Put
route del default 
at the end of /etc/rc.d/rc.local
and run it as root befor you start up pppd (only once).

Can you store the file onto your win filesystem? Can you write it to
floppy? Can you write it to CDRom?

Can you write it down?

Look at the line which starts 0.0.0.0 or default. Does it end with ppp0
or with eth0?



Without info it is hard to give advice.

