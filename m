From: Charlie Brady <charlieb-linux-ppp@budge.apana.org.au>
Date: Fri, 25 Apr 2008 14:43:48 +0000
Subject: Re: Re: Re: how to use compress modul in ppp process
Message-Id: <Pine.LNX.4.64.0804251039460.31508@e-smith.charlieb.ott.istop.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200804250001085508333@gmail.com>
In-Reply-To: <200804250001085508333@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


On Fri, 25 Apr 2008, C.J wrote:

> Hi ,
>
>> I don't know that anything you have said indicates that MPPC is available.
>> It rarely is.
>
> Sorry for mine behavior. I thought it maybe the pppol2tp driver's 
> bug(have not handle this case).

Why did you think that?

> Now I'll ask l2tp user about that.

I very much doubt that will be relevant.

l2tp is just an encapsulation layer which has nothing to do with MPPC.

Do you have a good reason for apparently ignoring my statement that MPPC 
is usually not supported by the ppp modules in the kernel? Are you quite 
sure that your kernel (or kernel modules) has been specifically patched to 
support MPPC? If not, you cannot use MPPC, not matter how you configure 
your client.
