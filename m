From: Bill Unruh <unruh@physics.ubc.ca>
Date: Thu, 10 Mar 2005 19:13:46 +0000
Subject: Re: Blowfish encryption
Message-Id: <Pine.LNX.4.61.0503101112130.8485@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <1110403872.18073.330.camel@linux.linxdev.com>
In-Reply-To: <1110403872.18073.330.camel@linux.linxdev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, 10 Mar 2005, Christopher Fowler wrote:

> The only problem with ssh is that it is one protocol.  There are many
> protocols that travel across the ppp link.  Some fo them not encryted
> and can not be encrypted.
I think you have to be much clearer on what you want to do, and whee you
think your threat is coming from.

>
> I stopped using telnet a long time ago.  Also with these devices there
> are protocols that are routed across that link we have no control over
> so doing encryption inside of ppp would cover all the bases.
>
  Which ones are you worried about?

>
> On Thu, 2005-03-10 at 12:53, Bill Unruh wrote:
>> On Wed, 9 Mar 2005, Christopher Fowler wrote:
>>
>>> Hello,
>>>
>>> I've been thinking about encryption in pppd.  By reading my emails
>>> you've probably have an idea of what we do with pppd.  Since I don't use
>> Bad idea. There is already a well accepted throughly tested way of doing
>> this. It is called ssh. Use it.
>> Trying to overload ppp  is not the way to do it ( and yes I know it is
>> done).
>>
>> Note that tapping a modem comjunication is hard at the best of times due to
>> cross training refections etc.
>>
>>> pppd to attach a windows desktop to a Linux server I was thinking about
>>> maybe an implementation of Blowfish type encryption between two pppd
>>> processes.  There could be a command line argument that runs on
>>> encryption and the two processes could determine in the LCP phase that
>>> they are to encrypt all data between them.    This is mainly for those
>>> individuals who think that the phone company will tap their line and see
>>> their data.  Not very useful in tunnels since programs like vtun do the
>>> encryption for pppd.
>>>
>>> Is this something that might be feasible?  I'm not looking to add
>>> certificate based encryption like SSL but encryption like SSH, Vtun and
>>> others.  Would a windows connection croak if it dialed into my box and
>>> my box wanted to use encryption?  Would the windows ppp process be smart
>>> enough to reject that request?  Has anything like this been tried yet?
>>>
>>
>> Use ssh.
>>> Thanks,
>>> Chris
>>>
>>>
>>> -
>>> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
