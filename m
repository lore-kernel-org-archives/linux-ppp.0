From: Bill Unruh <unruh@physics.ubc.ca>
Date: Thu, 10 Mar 2005 19:17:30 +0000
Subject: Re: Blowfish encryption
Message-Id: <Pine.LNX.4.61.0503101115320.8485@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <1110403872.18073.330.camel@linux.linxdev.com>
In-Reply-To: <1110403872.18073.330.camel@linux.linxdev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, 10 Mar 2005, Christopher Fowler wrote:

> Some of these tin-hat people I tell them to simply buy encrypted modems
> that do the encryption between the.  Are there anyone out there selling
> good ones anymore?
>
> Th issue is that there are two boxes connected via a modem and using PPP
> for IP traffic.  The customer wants to be sure all traffic across that
> phone line is encrypted.  Since they use so many network product some
> old those protocol may be plain-text.  By having ppp encrypt what it
> sends that would cover any data that travels across.
>

What are the systems you use? If it is Linux systems and James says use
ECP. If they are windows machines you may be more limited ( and you sure
cannot rewrite ppp for them either).

Are these two machines stand alone machines whcihyou want to connect? Are
they connected to the net? Are they really worried about wiretapping?


>
> On Thu, 2005-03-10 at 13:17, James Carlson wrote:
>> Christopher Fowler writes:
>>> The only problem with ssh is that it is one protocol.  There are many
>>> protocols that travel across the ppp link.  Some fo them not encryted
>>> and can not be encrypted.
>>>
>>> I stopped using telnet a long time ago.  Also with these devices there
>>> are protocols that are routed across that link we have no control over
>>> so doing encryption inside of ppp would cover all the bases.
>>
>> As I mentioned, if it's really a PPP issue (not clear that it is, as
>> the threat model isn't clear), then ECP is likely to be the right
>> answer.
>>
>> If it's an IP issue (are you worried about non-IP protocols?), then
>> I'd certainly recommend the use of IPsec.  It defends against things
>> that ssh (and, for that matter, SSL/TLS) cannot, works whether or not
>> you use PPP, works on an end-to-end basis, and doesn't require
>> changing everyone's implementations.
>

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
