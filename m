From: nick <lupusdacicus@netscape.net>
Date: Wed, 07 Apr 2004 17:17:35 +0000
Subject: hi
Message-Id: <4075967B.4010907@netscape.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


I am trying to connect to the internet through PPPD. I did edit 
/etc/ppp/peers/myconnect
/etc/chatscripts/myconnect
/etc/ppp/pap-secrets
and when I do:
pppd call myconnect
it does connect to dialup server, because I see it with
tail /var/logs/messages (I believe that is the location). I see that I 
am given an IP and I also see the peer/server's IP.

I tried to do something like:
lynx http://mail.yahoo.com
but I am told:
"Unable to connect/find to host". I tried ping and traceroute.... but I 
can only ping the computer I am connected with through PPPD, nothing 
goes through.

Can anyone give me some ideas ? What goes wrong ? How can I configure 
the routing and network ? I mean, I only have a computer, there is no 
real network, I have no DNS bought, no IPs (I get an IP from my dial up 
server).


Thank you,
Nick


