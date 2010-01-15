From: Jelle de Jong <jelledejong@powercraft.nl>
Date: Fri, 15 Jan 2010 14:20:55 +0000
Subject: Re: slow transfer speed issue between two ppp based servers
Message-Id: <4B5079C7.9030706@powercraft.nl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------020101050502020606060001"
List-Id: <linux-ppp.vger.kernel.org>
References: <4B4AFA68.4020500@powercraft.nl>
In-Reply-To: <4B4AFA68.4020500@powercraft.nl>
To: linux-ppp@vger.kernel.org

This is a multi-part message in MIME format.
--------------020101050502020606060001
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

James Carlson wrote, on 11-01-10 15:38:
> Is there any chance you could make the raw tcpdump files (rather than
> the decoded text output) available?  It's much harder to debug things
> when information has been subtracted.
> 
> Based on what little is available here, I'm seeing what seems to be an
> RTT that jumps around a lot, from a few milliseconds on up to 150
> milliseconds, and causing TCP to misbehave.  It's likely that this is a
> kernel issue that needs to be investigated.

I created an new tcpdump of the issue and attached it in the mail.

http://filebin.ca/zmmnws/tcpdump01.tar.gz

I changed the sammy servers pppoe connection to an normal eth5
interface to an ciso router that is providing a 50/50mbit fiber
interface. So the upload speed of the sammy server should be very
high. But is only 30KB when uploading to my mobile umts systems. When
uploading form an other server to the umts systems the upload speed is
the max of that server (100kB) so the umts systems should not be the
problem here.

We opened the tcmpdumps with wireshark and did an analyse > export
info and it showed a lot of "TCP Fast retransmissions" compared to the
the other tcmpdump of the good download from the ashley server.

I also tried the below kernels, but it did not change anything.

linux-image-686 | 2.6.30
linux-image-686 | 2.6.31
linux-image-686 | 2.6.32
linux-image-amd64 | 2.6.30
linux-image-amd64 | 2.6.32

If anybody can have a look at the tcp dumps or maybe have other
suggestion to get more debug info?

Best regards,

Jelle



--------------020101050502020606060001
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
FINISHED --2010-01-15 13:43:41--
Downloaded: 1 files, 6.5M in 39s (168 KB/s)
FINISHED --2010-01-15 13:44:54--
Downloaded: 1 files, 6.5M in 46s (143 KB/s)


# one upload test to the sammy server, demonstrating that the alix05
# server can upload with 60KB/s and that the sammy server can download
# with at least 60KB's (umts hsdpa 3g)
alix05:~# scp ftp.nl.debian.org/debian/ls-lR.gz root@sammy.somewhere.nl:/root/
100% 6607KB  61.2KB/s   01:48

# one upload from the sammy server to the ashley server, demonstrating
# that the sammy server can upload with 274KB/s. (g.shdsl)
sammy:~# scp /root/ls-lR.gz root@powercraft.nl:/root/
100% 6608KB   1.3MB/s   00:05

### THIS IS THE ISSUE, THE DOWNLOAD SPEED OF 17KB/s IS WAY TO LOW ###
# one download from sammy server to alix05 server that is going to slow
alix05:~# scp root@sammy.somewhere.nl:/root/ls-lR.gz ls-lR.gz
100% 6578KB  17.4KB/s   06:19

# control test, downloading from the ashley server to demonstrate that
# the alix05 is capable of download at least with 97KB/s with scp
alix05:~# scp root@powercraft.nl:/root/ls-lR.gz ls-lR.gz
100% 6608KB  88.1KB/s   01:15

------------------------------------------------------------------------

root@ashley:~# tcpdump port 22 and host 62.140.137.47 -i eth1 -w tcpdump-raw-ashley-eth1.txt
    from
alix05:~# scp root@powercraft.nl:/root/ls-lR.gz ls-lR.gz
    100% 6608KB  89.3KB/s   01:14

------------------------------------------------------------------------

sammy:~# tcpdump port 22 and host 62.140.137.47 -i eth5 -w tcpdump-raw-sammy-eth5.txt
    from
alix05:~# scp root@sammy.somewhere.nl:/root/ls-lR.gz ls-lR.g
    100% 6608KB  24.5KB/s   04:30

------------------------------------------------------------------------

# othertests:
# scp root@10.10.1.230:/root/ls-lR.gz ls-lR.g

------------------------------------------------------------------------

mv /root/tcpdump-ashley-eth1.txt /home/jelle/tcpdump-raw-ashley-eth1.txt
chown jelle:jelle /home/jelle/tcpdump-raw-ashley-eth1.txt
chmod 644 /home/jelle/tcpdump-raw-ashley-eth1.txt

scp --verbose /root/tcpdump-raw-sammy-eth5.txt root@powercraft.nl:/root/
# on ashley
mv /root/tcpdump-raw-sammy-eth5.txt /home/jelle/tcpdump-raw-sammy-eth5.txt
chown jelle:jelle /home/jelle/tcpdump-raw-sammy-eth5.txt
chmod 644 /home/jelle/tcpdump-raw-sammy-eth5.txt

------------------------------------------------------------------------



--------------020101050502020606060001--
