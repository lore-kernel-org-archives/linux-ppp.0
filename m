From: Gilles Espinasse <g.esp@free.fr>
Date: Tue, 12 Sep 2006 08:17:02 +0000
Subject: Re: Re-2: Authentication problems
Message-Id: <1158049022.45066cfe0c078@imp1-g19.free.fr>
List-Id: <linux-ppp.vger.kernel.org>
References: <0001E280.45068483@aressi.fr>
In-Reply-To: <0001E280.45068483@aressi.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Selon Ludovic MARCILLY <lmarcilly@aressi.fr>:

>
> First of all, thank you for your answer! Now it works. In fact, i have put
> the
> auth-pap in my config files because i think i have to put it in order to
> authenticate me to the server with pap. It seems that i was wrong...
>
> So i can't put these options in the config file on the client side? If i
> understand, he server ask the client for PAP, CHAP or MS-CHAP method to
> authenticate? The client doesn't choose authentication method? Is it right?
>
If one authentication is not configured on the client side, pppd will answer
with a nak on the request and could offer another authentication method if
available (that the server may or not accept).

If one authentication method is configured on the client side but you don't want
this method to be used, add -chap or -pap for example respectively to your
options.

Gilles
