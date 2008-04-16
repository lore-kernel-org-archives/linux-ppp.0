From: Bill Unruh <unruh@physics.ubc.ca>
Date: Wed, 16 Apr 2008 18:30:06 +0000
Subject: RE: Install ppp modules
Message-Id: <Pine.LNX.4.64.0804161128430.8016@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <00bb01c89fde$e9dadd10$9602a8c0@saschaxp1>
In-Reply-To: <00bb01c89fde$e9dadd10$9602a8c0@saschaxp1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, 16 Apr 2008, Charlie Brady wrote:

>
> On Wed, 16 Apr 2008, Bill Unruh wrote:
>
>>  On Wed, 16 Apr 2008, Charlie Brady wrote:
> ...
>> >   Perhaps. Another possibility is that somebody upgraded the kernel rpm 
>> >   and
>> >   then hasn't yet rebooted.
>>
>>  No idea how that would produce an installation with no modules.
>
> That would produce an installation where the modules were in a different 
> directory, corresponding to a different kernel than the one currently 
> running.

If he used rpm -U AND the kernels all had the same name under Centos. Or he
did rpm -e on a running kernel ( which is bad).

But I would have assumed that he told us all of the /lib/modules paths that
he had, but maybe not. 
>

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
