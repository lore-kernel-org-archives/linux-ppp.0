From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 28 Jan 2015 14:39:24 +0000
Subject: Re: multiple pppd instances -- resolv.conf challenges and suggested improvement
Message-Id: <54C8F49C.30104@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <68DDEA33-3E3A-456B-BFF4-14209A181864@nowonline.co.uk>
In-Reply-To: <68DDEA33-3E3A-456B-BFF4-14209A181864@nowonline.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 01/26/15 13:32, Lee Essen wrote:
> Hi Bill,
> 
> Thanks for the reply, I acknowledge that the buildroot approach is suboptimal, however it doesn't seem right that every instance of pppd will write to the same file regardless or what you choose to do with it!
> 
> In order to get clever (prioritise for example) with multiple instances I need to use either separate resolv.conf files, or do the work in the ppp-up script. The latter approach is perfectly acceptable, however having all the pppd processes overwriting the same resolv.conf file in a completely non-deterministic way seems wrong to me??
> 
> I realise that my particular problem with buildroot is more problematic than non-buildroot people would experience (and I'm quite happy to solve it with my proposed patch) but I thought it worth suggesting.

(Note: I'm a maintainer on the Solaris side, I haven't a clue what
"buildroot" might be.)

What you're asking for already exists.  Let them overwrite
/etc/ppp/resolv.conf, and just ignore that file.  It doesn't matter and
its contents are irrelevant.

Create an /etc/ppp/ip-up script, and put all of your clever logic there.
 The DNS server addresses will be given to you as $DNS1 and $DNS2, and
you can use this to create or modify the real /etc/resolv.conf as
desired.  The variables will be left unset if an address wasn't given.
(This weird Microsoft extension gives you two addresses.  No, I don't
know why it's specifically two addresses and not a list, nor why this
was done down at the link layer rather than a simple stateless DHCP
INFORM message.)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
