From: Christoph Schulz <develop@kristov.de>
Date: Tue, 15 Jul 2014 06:35:29 +0000
Subject: Re: [PATCH net 1/1] net: ppp: fix creating PPP pass and active filters
Message-Id: <53C4CBB1.5000202@kristov.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <53C28297.4080507@kristov.de> <53C29DAA.8020405@gmail.com> <20140713180735.209671xd9qjsgmo7@berry.schulz.ip-v6.eu> <53C2D541.8080900@redhat.com> <20140715065458.15013qglk08wv3mq@kristov.noip.me> <53C4B9BF.1020902@gmail.com>
In-Reply-To: <53C4B9BF.1020902@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Varka Bhadram <varkabhadram@gmail.com>, Daniel Borkmann <dborkman@redhat.com>
Cc: netdev@vger.kernel.org, linux-ppp@vger.kernel.org, paulus@samba.org, isdn@linux-pingi.de

Hello!

Am 15.07.2014 07:18, schrieb Varka Bhadram:
> There are can be two solutions:
> 
> 1. Replace the long function name (sk_unattached_filter_create) with the simple macro.
>     We can define the macro locally with our driver name.I don't know how many people
>     will accept it. For this we have to change the entire filter framework.
> 
> 2. Shorten the argument name 'pass_filter/active_filter'.
>     For this also we need to change the entire framework. People many not be accept it.

Is the 80 characters limit really that strong?
Documentation/SubmittingPatches contains the paragraph:

> The style checker should be viewed as
> a guide not as the final word.  If your code looks better with
> a violation then its probably best left alone.

IMHO defining and using local macros only to shorten two lines does not
improve code readability. Note that we talk about 83 and 85 characters,
respectively, not about >= 100.


Regards,

Christoph Schulz

