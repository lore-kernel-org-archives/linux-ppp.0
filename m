From: tony.chamberlain@lemko.com
Date: Sun, 29 Aug 2010 04:55:17 +0000
Subject: GRE read error PPP server
Message-Id: <W5737214545173441283057717@webmail54>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I succesfully set u a PPTP connection from one machine to a machine in
China.  I am now doing the same thing from another machine (different
public IP) however I get the following on the server side:


 pptpd[9943]: CTRL: Client #.#.#.# control connection finished
 pptpd[10056]: CTRL: Client #.#.#.# control connection started
 pptpd[10056]: CTRL: Starting call (launching pppd, opening GRE)
 pppd[10068]: Plugin /usr/lib/pptpd/pptpd-logwtmp.so loaded.
 pppd[10068]: pppd 2.4.3 started by root, uid 0
 pppd[10068]: Using interface ppp1
 pppd[10068]: Connect: ppp1 <--> /dev/pts/3
 pptpd[10056]: GRE: Bad checksum from pppd.

for privacy I put #.#.#.# in place of the actual IP address just above in this message.  I also get
bad reads from GRE.  This machine is also in China but different location.
And it has a router IP address to come in which is different from its
local IP address.  I do allow 10 IP addresses in the ppptpd config or
whatever.  I get that error  about 100 reduced to 10 for not enough IP
addresses but I am guessing that is OK and it would allow 100 conenctions
if you gave enough IP addresses.

Anyway any idea why I get the above errors?  My guess is it goes through
more routers and maybe some routers are squelching or changing or
inhibiting this GRE traffic?  Make sense?  What could we do?



