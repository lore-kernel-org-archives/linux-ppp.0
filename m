From: Gordon Henderson <gordon@drogon.net>
Date: Fri, 21 Oct 2011 11:16:38 +0000
Subject: Multilink PPPoE - Header corruption
Message-Id: <alpine.DEB.2.00.1110201134350.11377@unicorn.drogon.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Searching the archives, I see that this list has been relatively quiet as 
of late - probably because the PPP systems are considered stable and "just 
work"... However I've hit an interesting issue that I can't find any 
solution to..

I have a Linux based router - nothing fancy, however it has 8 Intel 
Ethernet ports - 4 x Gb, 4 x 10/100. It's running Debian, with a custom 
compiled 2.6.35.13 kernel tailored to the hardware. (Although I've just 
now tried 3.0.4 with the same issues)

(using that 2.6.35 kernel as it's the latest flagged for long-term support 
and I'm using it elsewhere in routers/servers, etc. I'm not averse to 
trying a different kernel though - especially if someone can say "Oh look, 
a regression, try this" or something)

Anyway, one of the 10/100 Ethernet ports is running PPPoE to a Vigor 120 
modem acting as a PPPoE <> PPPoA bridge to the ISP. This is working fine 
and is something I've done several times in the past.

Another 2 ports connect in a similar manner via a pair of Vigor 120's to a 
different ISP who is providing a bonded service.

I can bring each of these lines up individually and pass data over them 
without any issues. I can bring them both up, and I see the links bundled 
together in the log messages, however then the fun begins... I can ping 
the far end (and remote hosts in-general), but I can't transfer any data. 
In particular what appears to be happening is that the first SYN packet 
that leaves the router is corrupted, or the SYN+ACK packet is response to 
a remote connection is similarly corrupted.

e.g. tshark looking at the Ethernet port connecting the router to the 
modem when I try to connect in remotely (ssh - 195.10.225.68 is my remote 
host, 93.89.81.142 is the router)

   7.494318 195.10.225.68 -> 93.89.81.142 TCP 40323 > 22
 	 [SYN] Seq=0 WinX40 Len=0 TSV3234063 TSER=0 MSS46 WS=6

The router then sends the syn+ack back... or should have, but sends this:

   7.498888 93.89.81.142 -> 195.10.225.68 TCP 22 > 40323[Malformed Packet]

the far-end also sees a zero-length header message.

The link does work in some way though - e.g. if I bring up one link, 
establish a connection - e.g. an scp of a big file, then I bring up the 
2nd line it carries on working - at double the speed - which is to be 
expected - but if I then try a new connection, the syn/syn+ack packet will 
be corrupted as before.

I've tried the various firewalling, mtu and mss clamping on and off, 
particular values, etc. to no avail. I've also tried the kernel PPPoE 
driver as well as the RP userspace one too.

So it's quite frustrating!

A quick glance at the code suggests no changes since about 2005, which 
sort of implys that many others are using it successfully, or no-one is 
and I'm the first to try for some years (which I don't believe!)

The ISP doing the bonding line has other customers doing the same, but I'm 
not convinced it's an issue with them - seeing that corrupted packet come 
out of my router sort of points the finger right at it from what I reckon.

If anyone has any clues, suggestions or ideas, I'm all ears! I may not be 
able to try out much as the site is generally "live" with people using the 
initial link to the first ISP on a daily basis, so any tests/experiments 
may have to wait until an evening or weekend, but at this stage I'm 
willing to try almost anything...

Cheers,

Gordon
(Based in the UK if any makes any difference)
