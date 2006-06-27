From: "Jorge Daniel Sequeira Matias" <martin@andorinha.ist.utl.pt>
Date: Tue, 27 Jun 2006 22:50:30 +0000
Subject: Re: pppd stuck in ioctl(TIOCSETD) in Linux 2.6.15.4+
Message-Id: <006801c69a3c$29f846d0$0201a8c0@athlon64>
List-Id: <linux-ppp.vger.kernel.org>
References: <004b01c69a3a$6b80c660$0201a8c0@athlon64> <44A1B482.80901@trash.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org
Cc: Netfilter Development Mailinglist <netfilter-devel@lists.netfilter.org>


----- Original Message ----- 
From: "Patrick McHardy" <kaber@trash.net>
To: "Jorge Daniel Sequeira Matias" <martin@andorinha.ist.utl.pt>
Cc: <linux-ppp@vger.kernel.org>; "Netfilter Development Mailinglist" 
<netfilter-devel@lists.netfilter.org>
Sent: Tuesday, June 27, 2006 11:43 PM
Subject: Re: pppd stuck in ioctl(TIOCSETD) in Linux 2.6.15.4+



>> [...]
> Does the problem go away without the ip_conntrack_pptp module loaded?

  When I had the 2.6.15.4 installed I have recompiled without this module. 
The problem didn't go away.
  I know that 2.6.16.x has a different Netfilter structure but I have not 
tried yet to remove "ip_conntrack_pptp" with this version.
  Right now I have 2.6.16.16 with the module loaded.

Regards,
Jorge Matias

