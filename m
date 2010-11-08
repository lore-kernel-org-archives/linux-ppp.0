From: Richard Hartmann <richih.mailinglist@gmail.com>
Date: Mon, 08 Nov 2010 14:05:30 +0000
Subject: Re: [Patch] fix packet loss and massive ping spikes with PPP multi-link
Message-Id: <AANLkTi=GHmqeb=8rMZAnpqdKGbTEf2mRYhygX1aC2hyD@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <2d460de71003260850x7f90d04cy79ac853464108182@mail.gmail.com>
 <20100326160226.0159ac3b@lxorguk.ukuu.org.uk> <4BACE827.4070006@gmail.com>
 <20100326170428.6c1ad66c@lxorguk.ukuu.org.uk> <4BB31E00.8060204@netservers.co.uk>
 <20100529021624.GA2538@brick.ozlabs.ibm.com> <4C03E1CD.4000809@netservers.co.uk>
 <4C0670E2.1090708@netservers.co.uk>
In-Reply-To: <4C0670E2.1090708@netservers.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Ben McKeegan <ben@netservers.co.uk>
Cc: Paul Mackerras <paulus@samba.org>, netdev@vger.kernel.org, linux-ppp@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>, "Alexander E. Patrakov" <patrakov@gmail.com>, linux-kernel@vger.kernel.org, gabriele.paoloni@intel.com

On Wed, Jun 2, 2010 at 16:55, Ben McKeegan <ben@netservers.co.uk> wrote:

> Still working on this, updating the patch wasn't as trivial as I thought as
> it clashed with Gabriele Paoloni's ppp_mp_explode redesign.  However, while
> looking at this code I believe I have found a bug which might have been
> contributing to the poor performance the OP was experiencing.   For the case
> where channel speeds are unknown and there are more than 2 channels it would
> miscalculate the fragment sizes so they are not balanced on the channels.
>
> Patch for the bug to follow immediately.

Is there any update on this? It's been quite some time since you last updated
on this issue.


Thanks a lot,
Richard
