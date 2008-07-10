From: Dan Williams <dcbw@redhat.com>
Date: Thu, 10 Jul 2008 11:27:03 +0000
Subject: Re: PPP: "Re: IPCP with mobile ISP sometimes gives bogus DNS
Message-Id: <1215689223.16792.15.camel@localhost.localdomain>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.64.0807091111210.11494@bugs.comnets.uni-bremen.de>
In-Reply-To: <Pine.LNX.4.64.0807091111210.11494@bugs.comnets.uni-bremen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, 2008-07-09 at 11:42 +0200, Markus Becker wrote:
> Hi all,
> 
> several 3G cards (e.g. from Option) are reporting 10.11.12.13 as DNS 
> server, when they are not yet attached to a network, as you probably know, 
> see http://marc.info/?l=linux-ppp&w=2&r=1&s=bogus+DNS&q=b
> 
> There seem to be 2 possible solutions to this:
> 1) Patch PPP to accept MS-WINS settings and use high values for 
> ipcp-max-configure, ipcp-max-failure, ipcp-max-terminate and/or 
> ipcp-restart. See 
> http://bugs.debian.org/cgi-bin/bugreport.cgi?bugD5711 .
> (I am using the mentioned patch currently. Works fine for me.)
> 
> 2) Checking with AT command CGATT, whether the device is attached to a 
> network and only try to dial in when this is true. 
> (http://marc.info/?l=linux-ppp&m1305432406467&w=2)
> 
> In order to get this fixed, I have several questions:
> 
> a) The Debian bug report states, this has been sent upstream. Has upstream 
> accepted, denied or forgotten about it? Is there an upstream bugzilla for
> linux-ppp?
> 
> b) Marco, could this patch be part of the Debian package? Dan, how is this 
> done in Fedora?
> 
> c) Dan, could solution 2 be integrated into NM?

Yes, #2 is something we should be doing in NM (it's AT+CSS? for CDMA
cards).  The only icky part is that we'd have to open the serial device
when we aren't using it to periodically poll the card waiting for
association to the network.  Right now NM only opens the serial device
when it connects.  Not sure if that's something we care about, but we
probably shouldn't keep the serial device open all the time that the
card is plugged in and NM is active.

A periodic poll of the modem (every 10 or 15 seconds?) is probably a
good start here.  It would ask for association status, and if the modem
was associated, also ask for signal strength.

Dan

