From: Bill Unruh <unruh@physics.ubc.ca>
Date: Sun, 11 Apr 2004 07:31:25 +0000
Subject: Re: netstat -nr
Message-Id: <Pine.LNX.4.50.0404110025080.9174-100000@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <407A3BEA.1030607@netscape.net>
In-Reply-To: <407A3BEA.1030607@netscape.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Sun, 11 Apr 2004, nick wrote:

> 
> Routing:
> 
> Destination   Gateway   Genmask          Flags MSS Window irt Iface
> 68.28.229.7 0.0.0.0  255.255.255.255  UH    0   0      0   ppp0
> 169.254.0.0.0   0.0.0.0  255.255.0.0       U    0   0      0   eth0
> 68.0.0.0    0.0.0.0  255.0.0.0     U    0   0      0    eth0
> 127.0.0.0   0.0.0.0  255.0.0.0     U     0   0      0   lo
> 0.0.0.0     68.28.224.192 0.0.0.0      UG   0   0       0   eth0

You have an ethernet card. That card is grabbing the default route
0.0.0.0
Place the line
route del default 
at the end of /etc/rc.d/rc.local (or whereever rc.local is)

> 
> 
> Can anyone explain this routing table to me ?
> Like:
> -How is the Genmask determined ?

Host or network. 
Somewhere you told it to route 68.0.0.0 ( a /8 network) to the ethernet
card. Do not know if that is what you want.


> -Do you know of a good tutorial  on the web that can somehow explain 
> some basic routing concepts ? So I can actually be able to use: route, 
> ifconfig, iptables by myself in the future and be able to actually do 
> stuff myself ?
> 
> Since I do not use eth0 (for now), would it be better if I just remove 
> it from the configuration or the routing table ?

Yes, especially as you have it routing all kinds of stuff. 

> 
> It would be a major thing if I could get linux to connect to the net. 
> But it seems that every step is a strugle... I mean, I want to make use 
> of perl, curl, libcurl, DBI/mysql, libwww abd tools like that, maybe 
> even work at devlopping a website with PHP-mysql-apache, but first, I 
> need to get connected to the net.

Get the routing fixed. As above. And put 
defaultroute
into /etc/ppp/options.

> 
> I was asked, actually, given some ideas on how to transfer a file from 
> linux to windows. I was trying to avoid writing down that routing table, 
> because it was the only thing I could have done since:
> 1)-i have no floppy
> 2)- the cd re/writer  is mounted read only (are there any drivers for 
> DVD-ROM/CD-RWs out there ?)

sure. They are already there.
you need cdrecord installed.


> 3)- my linux (fedora) kernel cannot read/mount NTFS disks (windows xp). 
> I tried to that in FSTAB and mounting it manually, but it says that my 
> kernel does not support NTFS. And reconfiguring the kernel is something 
> I would like to avoid for the time being..

NTFS support is still read only as far as I know. It might be a good
idea to have one FAT partition that can be shared between win and linux.

