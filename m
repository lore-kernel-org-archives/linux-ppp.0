From: Jorge Daniel Sequeira Matias <martin@andorinha.ist.utl.pt>
Date: Tue, 11 Jul 2006 12:18:33 +0000
Subject: Re: pppd stuck in ioctl(TIOCSETD) in Linux 2.6.15.4+
Message-Id: <200607111318.33956.martin@andorinha.ist.utl.pt>
List-Id: <linux-ppp.vger.kernel.org>
References: <004b01c69a3a$6b80c660$0201a8c0@athlon64>
In-Reply-To: <004b01c69a3a$6b80c660$0201a8c0@athlon64>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Friday 30 June 2006 00:26, Paul Mackerras wrote:
> Jorge Daniel Sequeira Matias writes:
> >   It didn't solve. After running 2.6.17.1 for almost 48 hours I already
> > have 4 pppd processes stuck in "ioctl(TIOCSETD..." in the connection
> > finish section.
>
> Try the newly-released version 2.4.4 of pppd, please.

  I have tried pppd v2.4.4 and didn't see any problem because with 2.6.17.1 I 
have a new problem.
  With 2.6.17.1, the "pptpctrl" processes, are heating all the CPU even if the 
VPN user traffic is low (like 40kbits/sec).
  I think this new problem is hiding the "pppd" problem because the VPN server 
is so slow that less people establishes connections. The OS network is now 
very lagged ...

Regards,
Jorge Matias
