From: ben_gal@libero.it
Date: Sun, 27 Feb 2005 10:07:38 +0000
Subject: Re: Client requesting its authentication
Message-Id: <20050227100738.GA4752@ytsejam>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050224162619.GB5787@ytsejam>
In-Reply-To: <20050224162619.GB5787@ytsejam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Feb 24, 2005 at 01:53:20PM -0500, James Carlson wrote:
> That said, I see the point now, and, no, there's no option that
> currently does that.  You'll need to add one or, better yet, make pppd
> just do that by default when EAP TLS client side is configured.


I resolved with this code in auth.c , link_established():


    if(need_peer_eap && !ao->neg_eap) {
       warn("eap required to authenticate us but no suitable secrets");
        lcp_close(unit, "couldn't negotiate eap");
        status = EXIT_AUTH_TOPEER_FAILED;
        return;
    }

    if (need_peer_eap && !ho->neg_eap){
        warn("peer doesn't want to authenticate us with eap");
        lcp_close(unit, "couldn't negotiate eap");
        status = EXIT_PEER_AUTH_FAILED;
        return;
    }


So if the need_peer_eap option is used the eap authentication can't
be skipped.
I don't use LCP Configure-Nak because, as you noticed, if the peer
doesn't ask eap, probably won't accept the suggestion.

Hi.
