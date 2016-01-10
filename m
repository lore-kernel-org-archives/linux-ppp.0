From: Michael O'Connor <mike@jazmin.com.au>
Date: Sun, 10 Jan 2016 23:13:29 +0000
Subject: Re: Add support for IPv6 RADIUS attributes
Message-Id: <5B1BC493-0974-433F-AEB1-65D4DFC5DE2C@jazmin.com.au>
List-Id: <linux-ppp.vger.kernel.org>
References: <20160108142012.GL19014@drscott.swordarmor.fr>
In-Reply-To: <20160108142012.GL19014@drscott.swordarmor.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi

I think it should validate against the dictionary then only use the parameters it needs.

This seems to be the standard I've see in other software.

Mike

> On 11 Jan 2016, at 9:22 AM, Charlie Brady <charlieb-linux-ppp@budge.apana.org.au> wrote:
> 
> 
> 
>> On Sun, 10 Jan 2016, Michael Richardson wrote:
>> 
>> I also have patches to the radius module to use the latest (and maintained)
>> radcli client library at:  https://github.com/nmav/radcli
>> 
>> What is your application? As I read your patches, they just make ppp ignore
>> the attributes.  Do you intend to do more with the data?
> 
> On the face of it, the reason for Alarig's patch is to prevent pppd 
> calling 'error()' in response to unknown attributes. As I've already 
> pointed out, there is a much simpler patch to achieve that end.
> 
> The radius plugin of pppd shouldn't be trying to validate radius config 
> files; it should just read the data it needs from the file. If it finds 
> other stuff, it can just ignore it.
> 
>> 
>> I have patches on both radcli and pppd sides, which haven't all settled yet,
>> so I haven't pushed them anywhere yet.
>> 
>> I'm not sure what the ultimate point of your patches are though.
>> Non-LL IPv6 addresses are not assigned through IP6CP, but rather through RA
>> and/or DHCPv6.   I have a daemon, called rfc6204d, which does this at scale,
>> but it is not yet sufficiently field tested to release.
>> 
>> --
>> ]               Never tell me the odds!                 | ipv6 mesh networks [
>> ]   Michael Richardson, Sandelman Software Works        | network architect  [
>> ]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
