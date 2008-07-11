From: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
Date: Fri, 11 Jul 2008 11:09:35 +0000
Subject: Re: PPP: "Re: IPCP with mobile ISP sometimes gives bogus DNS address"
Message-Id: <48773F6F.3010308@teltonika.lt>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.64.0807091111210.11494@bugs.comnets.uni-bremen.de>
In-Reply-To: <Pine.LNX.4.64.0807091111210.11494@bugs.comnets.uni-bremen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Also you can take a look at my patch recently posted to
linux-ppp@vger.kernel.org

Re: PPP difficulties regarding connection establishment and bogus DNS 
received
07/01/2008 02:50 PM

Markus Becker wrote:
> Hi all,
> 
> several 3G cards (e.g. from Option) are reporting 10.11.12.13 as DNS 
> server, when they are not yet attached to a network, as you probably 
> know, see http://marc.info/?l=linux-ppp&w=2&r=1&s=bogus+DNS&q=b
> 
> There seem to be 2 possible solutions to this:
> 1) Patch PPP to accept MS-WINS settings and use high values for 
> ipcp-max-configure, ipcp-max-failure, ipcp-max-terminate and/or 
> ipcp-restart. See http://bugs.debian.org/cgi-bin/bugreport.cgi?bugD5711 .
> (I am using the mentioned patch currently. Works fine for me.)
> 
> 2) Checking with AT command CGATT, whether the device is attached to a 
> network and only try to dial in when this is true. 
> (http://marc.info/?l=linux-ppp&m1305432406467&w=2)
> 
> In order to get this fixed, I have several questions:
> 
> a) The Debian bug report states, this has been sent upstream. Has 
> upstream accepted, denied or forgotten about it? Is there an upstream 
> bugzilla for
> linux-ppp?
> 
> b) Marco, could this patch be part of the Debian package? Dan, how is 
> this done in Fedora?
> 
> c) Dan, could solution 2 be integrated into NM?
> 
> Markus
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

