From: Bill Unruh <unruh@physics.ubc.ca>
Date: Wed, 08 Feb 2006 22:30:12 +0000
Subject: Re: [PATCH] ppp: don't use 0 in pointer context
Message-Id: <Pine.LNX.4.61.0602081426050.13964@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <17386.27957.822041.83512@gargle.gargle.HOWL>
In-Reply-To: <17386.27957.822041.83512@gargle.gargle.HOWL>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, 9 Feb 2006, Herbert Xu wrote:

> James Carlson <carlsonj@workingcode.com> wrote:
>> Alexey Dobriyan writes:
>>> -     if (ap = 0)
>>> +     if (!ap)
>>
>> And the solution is to treat it as a boolean instead?!  I'm not sure
>> which is more ugly.
>
> Treating it as a boolean looks good to me.  It's better than the existing
> code because it shuts sparse up.

It is not an integer so I assume that is why you do not like it being
tested against 0. However it is also not a boolean, and testing it as a
boolean is just as bad as testing it as an integer. explicitly cast the 0
(char *)0 
or something if you are really worried.
At present ap is cast from a pointer to an integer, and compared. Casting
it as a boolean certainly sounds no better ( and it would depend on how
that implicit casting was done. I could imagine a cast implimentation which would totally
screw up that boolean test).
