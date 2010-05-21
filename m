From: Erik L <erik_list@caneris.com>
Date: Fri, 21 May 2010 15:37:43 +0000
Subject: Re: Multilink packet loss 2.6.32
Message-Id: <29943195.48.1274456263763.JavaMail.root@zimbra.caneris.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20084927.34.1274296640775.JavaMail.root@zimbra.caneris.com>
In-Reply-To: <20084927.34.1274296640775.JavaMail.root@zimbra.caneris.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi John,

We applied this patch on a test CPE and LNS against 2.6.32 and the issues appear to be resolved! We're still conducting more extensive testing, but so far it's looking good.

Thanks
Erik


----- Original Message -----
From: "Johannes Jakob" <jj@globalways.net>
To: "Erik L" <erik_list@caneris.com>
Cc: linux-ppp@vger.kernel.org
Sent: Thursday, May 20, 2010 4:35:54 AM
Subject: Re: Multilink packet loss 2.6.32

Hi Erik,

we are experiencing similar problems with linux based CPEs and cisco
based LNS systems.
We did some testing with a self-made patch experimenting with
ppp_mp_explode:

http://lkml.org/lkml/2010/3/26/170

I should mention that we are working with 2.6.31 systems and the patch
should be applied against the corresponding sources.
Are your problems related to 2.6.32 specifically?

We are not that familiar with ppp- or kernel development, so this can't
be considered a final solution for the problem, but our results with
this workaround look promising. It would be great if any of the more
experienced developers on this list could have a look at this problem
and solve it the "right" way.

Greetings,

John


On 19.05.2010, at 21:17, Erik L wrote:

> Hi,
>
> We're using ppp both on our ADSL LNSs and on customer CPEs. Both ends
> are running 2.6.32 kernels. We've been trying to resolve a packet loss
> issue which occurs with multilink for over a week with no success. We
> suspect the issue has to do with fragmentation, possibly something
> wrong with ppp_mp_explode in ppp_generic.c, but we're not sure what.
>
> I don't want to overwhelm the list with all the data we've gathered so
> far just yet, but if anyone has any ideas, they'd be most appreciated.
>
> Thanks
> Erik
