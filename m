From: Johan Gill <johane@lysator.liu.se>
Date: Thu, 04 Mar 2004 10:33:27 +0000
Subject: Strange problem seeing certain websites over dial-up connection
Message-Id: <404705F7.40308@lysator.liu.se>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi, I would be happy if anyone has a clue about this.

When I use my Slackware 8.1 system with a modem (kernel 2.4.18, I also 
tried 2.4.24), I cannot access the websites www.amigbg.com and 
www.viforaldrar.se with any browser. This works on another Linux system 
(2.4.20-28.8smp, without a modem). I can telnet the hosts, so my 
location should not be the problem. The problem is that an HTTP request 
is sent, but no answer is recorded. Both webservers were IIS 5.0 when I 
checked the other day. I could rip the packets apart in a few weeks to 
see what I find, but I thought I should post this now.

Some .config lines:
CONFIG_PPP=m
# CONFIG_PPP_MULTILINK is not set
# CONFIG_PPP_FILTER is not set
CONFIG_PPP_ASYNC=m
CONFIG_PPP_SYNC_TTY=m
CONFIG_PPP_DEFLATE=m
CONFIG_PPP_BSDCOMP=m
CONFIG_PPPOE=m

And lsmod says:
Module                  Size  Used by    Not tainted
ppp_deflate             2968   2  (autoclean)
zlib_deflate           17880   0  (autoclean) [ppp_deflate]
bsd_comp                3992   0  (autoclean)
ppp_async               6560   1  (autoclean)
ppp_generic            15872   3  (autoclean) [ppp_deflate bsd_comp 
ppp_async]
slhc                    4656   1  (autoclean) [ppp_generic]

Regards
/Johan Gill <johane@lysator.liu.se>

