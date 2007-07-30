From: Jan Just Keijser <jan.just.keijser@gmail.com>
Date: Mon, 30 Jul 2007 11:31:53 +0000
Subject: RE: eap/tls - smartcard ppp extension
Message-Id: <46ADCC29.3070400@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20070729190056.GA18150@ns.wegener-net.de>
In-Reply-To: <20070729190056.GA18150@ns.wegener-net.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

hi Norbert,

I've made a few updates to this patch, see
  http://www.nikhef.nl/~janjust/ppp <http://www.nikhef.nl/%7Ejanjust/ppp>
this patch
- allow client and server support for EAP/TLS
- supports pppd 2.4.3 and 2.4.4

this patch has also been submitted to the ppp development team.

cheers,

JJK

> Hello,
> based on the eap/tls extension pppd 2.4.3 - eaptls 0.7
> we found at
> http://eaptls.spe.net/download.html 
> <http://eaptls.spe.net/download.html> we extended ppp to be able use 
> use smartcards for authentication.
> We would like to contribute this code for incorporation in ppp, if 
> there is no other extension for this available.
> Are you interested in this patch?
> if so: Which license should this extension have?
>
> Regards
> Norbert Wegener
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org 
> <mailto:majordomo@vger.kernel.org>
> More majordomo info at  http://vger.kernel.org/majordomo-info.html 
> <http://vger.kernel.org/majordomo-info.html>

