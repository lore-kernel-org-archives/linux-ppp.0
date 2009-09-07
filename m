From: Nev <nev@watchuktv.co.uk>
Date: Mon, 07 Sep 2009 20:53:35 +0000
Subject: Calling-Station-Id
Message-Id: <4AA572CF.8070900@watchuktv.co.uk>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

This is my very first post, so apologies if I'm posting to the wrong list.

OS CentOS 5.3
Kernel 2.6.18-128

My setup is PPTP client >> INTERNET >> pptpd (1.3.4) / PPP (2.4.4.-2) / 
Radius (2.1.6)

in /etc/pptpd I have noipparam commented in order that the client's IP 
address is pass to PPP

in /var/log/messages the clients ip is passed

Sep  7 21:41:32 vpn1 pppd[9945]: ipparam 78.8X.18X.XX           # (from 
command line)

But what ends in Radius is Calling-Station-Id = "8.87" and not the FULL IP.

I searched google and I can see alot of people have had this problem, 
but I've not be able to find a fix.

Thx
Nev

