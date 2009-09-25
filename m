From: Bill Unruh <unruh@physics.ubc.ca>
Date: Fri, 25 Sep 2009 20:28:11 +0000
Subject: Re: ppp link time limit
Message-Id: <Pine.LNX.4.64.0909251327300.22303@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <004001ca3e15$69a6b9d0$0413010a@scu.escambray.com.cu>
In-Reply-To: <004001ca3e15$69a6b9d0$0413010a@scu.escambray.com.cu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Yes, using maxconnect is probably a better idea if you have multiple pppd
running.


On Fri, 25 Sep 2009, Chris Fowler wrote:

>       maxconnect n
>              Terminate the connection when it has been available for
> network
>              traffic  for  n  seconds (i.e. n seconds after the first
> network
>              control protocol comes up).
>
>
> On Fri, 2009-09-25 at 14:21 -0500, Davy Leon wrote:
>> Hi guys
>>
>> I have a link wich I stablish by running
>>
>> pppd call isp
>>
>> It' launched by the cron at some scheduled times of the day. I need the link
>> doesn't stay up for more than 30 min, but doesn't know how to do that. No
>> matter the link is idle or being used I want to terminate it once reached
>> the ammount of time specified. How can I do that?
>>
>> Cheers
>>
>> David
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
