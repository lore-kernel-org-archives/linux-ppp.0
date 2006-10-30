From: Paul Mackerras <paulus@samba.org>
Date: Mon, 30 Oct 2006 23:15:53 +0000
Subject: Re: Way how frames are read in pppd
Message-Id: <17734.34729.950457.744885@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4540C35F.9010104@beronet.com>
In-Reply-To: <4540C35F.9010104@beronet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Christian writes:

> I have a device which gives me a function to transmit data in a hdlc
> frame, so i can just call some function like:
> 
> tx_frame(char *p, int l);
> 
> and i can be sure the data will come out on the other side in exactly 1
> hdlc frame with size l.
> 
> on the other hand i have installed a callback like
> 
> rx_frame(char *p, int l);
> 
> where i receive the data from exactly 1 hdlc frame with length l.

Have a look at Documentation/networking/ppp_generic.txt and
drivers/net/ppp_synctty.c in the Linux kernel sources.

Paul.
