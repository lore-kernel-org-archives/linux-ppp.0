From: nick <lupusdacicus@netscape.net>
Date: Sun, 11 Apr 2004 05:50:51 +0000
Subject: netstat -nr
Message-Id: <407A3BEA.1030607@netscape.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Hi,

First of all, I would like to thank you for your quick response. And I 
do appreciate your effort and suggestions. Actually, I am where I am 
now, because of guys like you that shared knowledge, hackers, crackers, 
programmers and sysadmins. What can I say, except... THANK You...

Here is my routin table that I was avioding to get. I have no floppy. 
Actually, I need to deactivate it somehow because at bootup it looks for 
one and it gives me errors, cause there is no floppy on this laptop. So 
another question would be how do I 'tell' Linux not to look for a floppy 
anymore ?

Routing:

Destination   Gateway   Genmask          Flags MSS Window irt Iface
68.28.229.7 0.0.0.0  255.255.255.255  UH    0   0      0   ppp0
169.254.0.0.0   0.0.0.0  255.255.0.0       U    0   0      0   eth0
68.0.0.0    0.0.0.0  255.0.0.0     U    0   0      0    eth0
127.0.0.0   0.0.0.0  255.0.0.0     U     0   0      0   lo
0.0.0.0     68.28.224.192 0.0.0.0      UG   0   0       0   eth0


Can anyone explain this routing table to me ?
Like:
-How is the Genmask determined ?
-Do you know of a good tutorial  on the web that can somehow explain 
some basic routing concepts ? So I can actually be able to use: route, 
ifconfig, iptables by myself in the future and be able to actually do 
stuff myself ?

Since I do not use eth0 (for now), would it be better if I just remove 
it from the configuration or the routing table ?

I was trying to install linuxconf, but it says it needs 2 libraries... 
and those 2 libraries are both installed. Actually, linuxconf says it 
needs lower versions of those libraries... I downloaded one of them and 
when I tried to install the RPM it says it conflicts with what I have, 
the newer version.

It would be a major thing if I could get linux to connect to the net. 
But it seems that every step is a strugle... I mean, I want to make use 
of perl, curl, libcurl, DBI/mysql, libwww abd tools like that, maybe 
even work at devlopping a website with PHP-mysql-apache, but first, I 
need to get connected to the net.

I was asked, actually, given some ideas on how to transfer a file from 
linux to windows. I was trying to avoid writing down that routing table, 
because it was the only thing I could have done since:
1)-i have no floppy
2)- the cd re/writer  is mounted read only (are there any drivers for 
DVD-ROM/CD-RWs out there ?)
3)- my linux (fedora) kernel cannot read/mount NTFS disks (windows xp). 
I tried to that in FSTAB and mounting it manually, but it says that my 
kernel does not support NTFS. And reconfiguring the kernel is something 
I would like to avoid for the time being..

Nick...





