From: Charlie Brady <charlieb-linux-ppp@budge.apana.org.au>
Date: Wed, 20 Nov 2013 22:01:24 +0000
Subject: Re: Double radius accounting
Message-Id: <Pine.LNX.4.64.1311201658480.12149@e-smith.charliebrady.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <1683678123.142102.1384983923718.JavaMail.zimbra@yetopen.it>
In-Reply-To: <1683678123.142102.1384983923718.JavaMail.zimbra@yetopen.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


On Wed, 20 Nov 2013, Lorenzo Milesi wrote:

> Is it normal to see the radius plugin initializaion TWICE?

I think because it is reading /etc/ppp/options twice. From 'man pppd':

OPTIONS FILES
   Options can be taken from files as well as the command line.  Pppd reads options from the
   files /etc/ppp/options, ~/.ppprc and /etc/ppp/options.ttyname (in that order) before pro
   cessing  the options on the command line.

What happens if you remove 'option /etc/ppp/options' from pptpd.conf?

