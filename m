From: carlsonj@workingcode.com
Date: Thu, 28 Oct 2004 12:54:55 +0000
Subject: Re: ppp 2.4.3 cvs authentication issue
Message-Id: <16768.60447.480154.73089@carlson.workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20041028124517.7204.qmail@web25210.mail.ukl.yahoo.com>
In-Reply-To: <20041028124517.7204.qmail@web25210.mail.ukl.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

a b writes:
> I'm trying to set up a pptpd server under Mandrake
> 10.0 and I think my problem is related to pppd and the
> authentication.

You're the server side?  Then why is your peer demanding that you
authenticate yourself?

> client:
> 
> cat /etc/ppp/peers/pptp0 
[...]
> refuse-pap
> refuse-eap
> refuse-chap
> refuse-mschap
> require-mschap-v2

There's the misconfiguration.  The client should not have the above
five options.  Instead, it should just have "noauth."  (As long as the
client doesn't have a default route, it won't even need "noauth.")

> Please note that if I simply change two lines on both
> sides:
> 
> add noauth and comment out require-mschap-v2 I get

Don't change both sides.  The server looks fine.  It's the client
that's misconfigured.

You have it set up so that both sides demand authentication and both
sides *refuse* that demand.  What else could possibly be the result?

-- 
James Carlson                                 <carlsonj@workingcode.com>
