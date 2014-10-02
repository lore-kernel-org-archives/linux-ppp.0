From: Arne Van Theemsche <arne.vantheemsche@evonet.be>
Date: Thu, 02 Oct 2014 07:29:31 +0000
Subject: ml-ppp bundle dies if initial link fails (even in 2.4.7)
Message-Id: <542CFEDB.6090301@evonet.be>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi all

We can't seem to get ml-ppp to work in a stable way (nor PPPoE, nor 
PPPoL2TP). Even when I found out the master_detach option, we compiled 
2.4.7 but that didn't to the trick.

All links may fail, except for the one who created the bundle, if that 
happens, the link goes down, if-down scripts are called, and all other 
links are nicely closed.

Does anybody have a solution for that?

P.S. tried killing pppd with the HUP signal (as mentioned in the man), 
tried interrupting the link somewhere in the middle, so the LCP fails, 
nothing has helped me so far

kind regards
Arne

