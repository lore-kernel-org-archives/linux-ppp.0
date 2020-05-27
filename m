From: Patrick Mahan <mahan@mahan.org>
Date: Wed, 27 May 2020 19:16:07 +0000
Subject: PPP cycling between UP and DOWN
Message-Id: <f44e7e14-1621-7141-66a3-3a2218e8db86@mahan.org>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

PPP v2.3.11
RP-PPPOE v3.12
Linux 2.6.35

I am seeing some issues with respect to how PPP is handling a PPPoE connection.

My PPPoE connection gets established and pppd reports UP via the ip-up script. 
Then at some point (sometimes within a second, sometimes hours) pppd reports down 
via the ip-down script, but does not exit then re-establishes the UP state and 
reports it via ip-up.

I have a script that monitors by this by having a modified ip-up and ip-down 
script write a value to a specific file under /var/run/pppd/ and if it is 
ip-down, then I schedule a restart of pppd to occur once the pppd image exits.  I 
have assumed that ip-down being triggered is and indication that PPPoE connection 
is down and over.

But I am now seeing that this assumption could be incorrect.  I don't claim to 
understand the entire protocol layers involved.  But is it supported that a PPPoE 
connection can shift back from the IPCP layer to the LCP layer?  Then back?

Or is this a ppp protocol issue.  I see in the pppd code that we can moved to a 
down state if we get a request to restart negotiations, so I can see that my 
assumption may be incorrect.

Any help is appreciated.

Thanks,

Patrick
