From: Jelle de Jong <jelledejong@powercraft.nl>
Date: Mon, 11 Jan 2010 10:16:08 +0000
Subject: slow transfer speed issue between two ppp based servers
Message-Id: <4B4AFA68.4020500@powercraft.nl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------030008090405030905020009"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org

This is a multi-part message in MIME format.
--------------030008090405030905020009
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello everybody,

I am having a connection speed issue between two ppp based servers,
and I have no idea what is going wrong and how to fix it.

I would appreciated it if somebody with advanced networking skills can
take a look at my attachments with tcpdumps and my analyse report.

http://filebin.ca/hgnpt/tcpdumps.tar.gz

I did not know a more suited mailing list for this issue.

Many thanks in advance,

Kind regards,

Jelle


--------------030008090405030905020009
Content-Type: text/plain;
 name="setup-sammy-uplinkspeed-debug.txt"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline;
 filename="setup-sammy-uplinkspeed-debug.txt"

���������------------------------------------------------------------------------

# this document describes my issue with a way to slow transfer speed
# between my sammy server with pppoe g.shdsl and an alix05 server with
# ppp hsdpa umts

------------------------------------------------------------------------

# two download tests, demonstrating that the alix05 server can download
# with 250KB/s (umts hsdpa 3g)
alix05:~# wget -cr http://ftp.nl.debian.org/debian/ls-lR.gz
FINISHED --2010-01-10 18:26:01--
Downloaded: 1 files, 6.4M in 26s (252 KB/s)
FINISHED --2010-01-10 18:30:31--
Downloaded: 1 files, 6.4M in 25s (258 KB/s)

# one upload test to the sammy server, demonstrating that the alix05
# server can upload with 60KB/s and that the sammy server can download
# with at least 60KB's (umts hsdpa 3g)
alix05:~# scp ftp.nl.debian.org/debian/ls-lR.gz root@sammy.somewhere.nl:/root/
100% 6578KB  60.9KB/s   01:48

# one upload from the sammy server to the ashley server, demonstrating
# that the sammy server can upload with 274KB/s. (g.shdsl)
sammy:~# scp /root/ls-lR.gz root@powercraft.nl:/root/
100% 6578KB 274.1KB/s   00:24

### THIS IS THE ISSUE, THE DOWNLOAD SPEED OF 17KB/s IS WAY TO LOW ###
# one download from sammy server to alix05 server that is going to slow
alix05:~# scp root@sammy.somewhere.nl:/root/ls-lR.gz ls-lR.gz
100% 6578KB  17.4KB/s   06:19

# control test, downloading from the ashley server to demonstrate that
# the alix05 is capable of download at least with 97KB/s with scp
alix05:~# scp root@powercraft.nl:/root/ls-lR.gz ls-lR.gz
100% 6578KB  96.7KB/s   01:08

------------------------------------------------------------------------

root@ashley:~# tcpdump port 22 and host 62.140.137.45 -i eth1 -n -vv | tee tcpdump-ashley-eth1.txt
    from
alix05:~# scp root@powercraft.nl:/root/ls-lR.gz ls-lR.gz
    100% 6578KB  96.7KB/s   01:08

------------------------------------------------------------------------

sammy:~# tcpdump port 22 and host 62.140.137.45 -i ppp0 -n -vv | tee tcpdump-sammy-ppp0.txt
    from
alix05:~# scp root@sammy.somewhere.nl:/root/ls-lR.gz ls-lR.g
    100% 6578KB  13.9KB/s   07:52

------------------------------------------------------------------------

# othertests:
# scp root@10.10.1.230:/root/ls-lR.gz ls-lR.g

------------------------------------------------------------------------

--------------030008090405030905020009--
