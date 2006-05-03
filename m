From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 03 May 2006 12:45:18 +0000
Subject: Re: VJCOMP Issue with Siemens MC75
Message-Id: <17496.42462.869304.709471@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <1146649565.11976.253.camel@io.sanpeople.com>
In-Reply-To: <1146649565.11976.253.camel@io.sanpeople.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Pieter Loubser writes:
> I think its because when the Siemens replies with the confrej, it
> rejects the vjcomp twice in the same message.

Yes.  The peer is broken.

> It does work if I disable the VJ comp in PPP with "novj" and
> "novjccomp". But I would like not to, for vjcomp is supported  on some
> other GPRS/EDGE modules and this is a generic setup. Anyway it should
> just reject it correctly and continue. The Siemens MC55 module (the
> MC75's predecessor) works fine, and rejects vjcomp properly.

Sometimes, there's little you can do but choose between tweaking your
configuration for a particularly broken peer, or just avoiding that
device in the hope that the manufacturer will fix it.

You could hack the code (you have source, after all), but I doubt that
it'd be good to have the main line of pppd damaged to accomodate this
confused system.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
