From: Bill Unruh <unruh@physics.ubc.ca>
Date: Thu, 24 Feb 2005 22:38:09 +0000
Subject: Re: Client requesting its authentication
Message-Id: <Pine.LNX.4.61.0502241433250.9942@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050224162619.GB5787@ytsejam>
In-Reply-To: <20050224162619.GB5787@ytsejam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, 24 Feb 2005 ben_gal@libero.it wrote:

> On Thu, Feb 24, 2005 at 02:18:44PM -0800, Bill Unruh wrote:
>>> In tls there's a client and a server. Roles cannot be swapped
>>
>> This is NOT true in ppp, which is what you are doing.
>
> But I cannot do reverse authentication and it can't too.

Why not? Just put require-eap into your ppp/options. and you will ask him
for eap. NOw he may refuse, but that is up to him. YOu cannot force someone
else to do something.

>
>>>
>>> Yes. This isn't a problem.
>>> The problem is when I trust him, but we haven't shown driver licenses each
>>> other.
>>
>> If you walk away because he does not show his license to you then you DO
>> NOT trust him.
>
> Eh ? :)

It may be a problem with English. I interpreted your sentence to be 
"the problem is, if I trust him, but we haven't shown...." You might be
saying " the problem is at what time do I trust him-- certainly not if we
have not shown driver ....."

Which did you mean? Do you trust him? If not ask to see his license. Do not
stand there hinting that it would be nice if he volunarily showed you his
license. And then walk away when he does not take the hint.

What prevents you from putting
require-eap
into your options file which will result in your eap asking him to
authenticate himself to you and you to him with eap?

>

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
