From: Richard Hartmann <richih.mailinglist@gmail.com>
Date: Tue, 25 May 2010 14:58:16 +0000
Subject: Re: [Patch] fix packet loss and massive ping spikes with PPP
Message-Id: <AANLkTilnueP5HIfX03soMCYE93jubL000rpiOCN1xB2-@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <2d460de71003260850x7f90d04cy79ac853464108182@mail.gmail.com>
In-Reply-To: <2d460de71003260850x7f90d04cy79ac853464108182@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi Walter,


> ppp->rrsched never gets resetted, i assume that is somewhere else ?

*cough* no *cough*


> can you move the whole block into a separate function ?
> then it will be easy to remove the ifdef stuff from the core function.

Did you look at the most current version? It can be found within this
thread or here [1].


Richard

[1] http://lkml.org/lkml/2010/3/31/87
