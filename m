From: walter harms <wharms@bfs.de>
Date: Tue, 25 May 2010 17:30:42 +0000
Subject: Re: [Patch] fix packet loss and massive ping spikes with PPP 	multi-link
Message-Id: <4BFC0942.2030103@bfs.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <2d460de71003260850x7f90d04cy79ac853464108182@mail.gmail.com>
In-Reply-To: <2d460de71003260850x7f90d04cy79ac853464108182@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



Richard Hartmann schrieb:
> Hi Walter,
> 
> 
>> ppp->rrsched never gets resetted, i assume that is somewhere else ?
> 
> *cough* no *cough*
> 
> 
>> can you move the whole block into a separate function ?
>> then it will be easy to remove the ifdef stuff from the core function.
> 
> Did you look at the most current version? It can be found within this
> thread or here [1].
> 
> 
> Richard
> 
> [1] http://lkml.org/lkml/2010/3/31/87
> 

Hi Richard,
thats  looks different. :)

here my questions:

from 	ppp_mp_roundrobin()

  if (ppp->rrsched % ppp->n_channels = i)

since both do not change in that while() loop you can calculate in advance
perhaps ppp->rrsched %= ppp->n_channels before the while ?
(that would reduce my bad feels about variables that only increments also :)

btw: you are doing  after loop() if(pch->chan = NULL) continue;
that means the else in the if below  if (pch->chan) should never be reached.
Or is it likely that some channel will be dropped (?) ?

so the code says:
 go to channel  (ppp->rrsched % ppp->n_channels)
 send packet pch->chan->ops->start_xmit(pch->chan, skb)


btw: this is intentional ? looks strange

	if(ppp_ml_noexplode) {
+	}
+	else {

just my 2 cents,
re,
 wh






