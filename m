From: James Carlson <carlson@workingcode.com>
Date: Sat, 21 Feb 2004 20:22:43 +0000
Subject: Re: Problems with ppp
Message-Id: <16439.48659.124945.300207@c-24-147-210-59.ne.client2.attbi.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <BAY15-F30oYAPNXRPmc0000689e@hotmail.com>
In-Reply-To: <BAY15-F30oYAPNXRPmc0000689e@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Juan Pablo Romero writes:
> Feb 21 14:08:13 localhost pppd[2888]: rcvd [IPCP ConfReq id=0xef <addr 
> 200.39.61.2>]
> Feb 21 14:08:13 localhost pppd[2888]: sent [IPCP ConfAck id=0xef <addr 
> 200.39.61.2>]
> Feb 21 14:08:15 localhost pppd[2888]: rcvd [IPCP ConfReq id=0xf0 <addr 
> 200.39.61.2>]
> Feb 21 14:08:15 localhost pppd[2888]: sent [IPCP ConfAck id=0xf0 <addr 
> 200.39.61.2>]

It's still pretty clear that the peer cannot hear anything you're
saying past LCP negotiation, which is a symptom of low-level
communications trouble.  It's hard to tell exactly what the problem
is, though.

Other things to try:

	- see if "default-asyncmap" works.

	- check that the configuration commands ("AT...") sent to the
          modem are correct.

	- try using "novj noccp".

	- if the device is actually a Winmodem, you're on your own.

-- 
James Carlson                                  <carlson@workingcode.com>
