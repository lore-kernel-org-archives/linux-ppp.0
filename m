From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 24 Feb 2005 16:37:29 +0000
Subject: Re: Client requesting its authentication
Message-Id: <16926.713.195098.289204@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050224162619.GB5787@ytsejam>
In-Reply-To: <20050224162619.GB5787@ytsejam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

ben_gal@libero.it writes:
> Is there in pppd an option to specify that we want the peer 
> authenticate us using EAP, and to refuse to continue if it does not 
> request us ?
> I need it to perform an eap-tls authentication.

You'd do it with "refuse-pap refuse-chap refuse-mschap
refuse-mschap-v2".

But, before you go to that trouble, you should know that the default
behavior of pppd is to refuse proposed authentication methods that do
not have corresponding key material with which to authenticate.

In other words, as long as you don't add entries in
/etc/ppp/pap-secrets and /etc/ppp/chap-secrets that match on the
"client" and "server" names, pppd will automatically refuse those
other authentication methods if proposed by the peer.

In general, you shouldn't add and shouldn't have to add pppd options
for most "sensible" behaviors.  When configuring pppd (or, really, any
software), fewer specified options is better.

-- 
James Carlson                                 <carlsonj@workingcode.com>
