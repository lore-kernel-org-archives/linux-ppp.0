From: Paul Mackerras <paulus@samba.org>
Date: Thu, 29 Jun 2006 23:26:00 +0000
Subject: Re: pppd stuck in ioctl(TIOCSETD) in Linux 2.6.15.4+
Message-Id: <17572.24968.657123.681689@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <004b01c69a3a$6b80c660$0201a8c0@athlon64>
In-Reply-To: <004b01c69a3a$6b80c660$0201a8c0@athlon64>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Jorge Daniel Sequeira Matias writes:

>   It didn't solve. After running 2.6.17.1 for almost 48 hours I already have 4 
> pppd processes stuck in "ioctl(TIOCSETD..." in the connection finish section.

Try the newly-released version 2.4.4 of pppd, please.

Paul.
