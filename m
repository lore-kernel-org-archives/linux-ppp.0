From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Tue, 21 Dec 2010 05:43:36 +0000
Subject: Re: [PATCH] ppp: allow disabling multilink protocol ID compression
Message-Id: <1292910216.2627.156.camel@edumazet-laptop>
List-Id: <linux-ppp.vger.kernel.org>
References: <20101220195833.26786ec5@nehalam>
In-Reply-To: <20101220195833.26786ec5@nehalam>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Stephen Hemminger <shemminger@vyatta.com>
Cc: Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org

Le lundi 20 décembre 2010 à 19:58 -0800, Stephen Hemminger a écrit :
> Linux would not connect to other router running old version Cisco IOS (12.0).
> This is most likely a bug in that version of IOS, since it is fixed
> in later versions. As a workaround this patch allows a module parameter
> to be set to disable compressing the protocol ID.
> 
> See: https://bugzilla.vyatta.com/show_bug.cgi?id979
> 
> RFC 1990 allows an implementation to formulate MP fragments as if protocol
> compression had been negotiated.  This allows us to always send compressed
> protocol IDs.  But some implementations don't accept MP fragments with
> compressed protocol IDs.  This parameter allows us to interoperate with
> them.  The default value of the configurable parameter is the same as the
> current behavior:  protocol compression is enabled.  If protocol compression
> is disabled we will not send compressed protocol IDs.
> 
> This is based on an earlier patch by Bob Gilligan (using a sysctl).
> Module parameter is writable to allow for enabling even if ppp
> is already loaded for other uses.
> 
> Signed-off-by: Stephen Hemminger <shemminger@vyatta.com>

Acked-by: Eric Dumazet <eric.dumazet@gmail.com>


