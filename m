From: Bill Unruh <unruh@physics.ubc.ca>
Date: Fri, 25 Sep 2009 18:40:05 +0000
Subject: Re: ppp link time limit
Message-Id: <Pine.LNX.4.64.0909251138490.14531@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <004001ca3e15$69a6b9d0$0413010a@scu.escambray.com.cu>
In-Reply-To: <004001ca3e15$69a6b9d0$0413010a@scu.escambray.com.cu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Fri, 25 Sep 2009, Davy Leon wrote:

> Hi guys
>
> I have a link wich I stablish by running
>
> pppd call isp
>
> It' launched by the cron at some scheduled times of the day. I need the link 
> doesn't stay up for more than 30 min, but doesn't know how to do that. No 
> matter the link is idle or being used I want to terminate it once reached the 
> ammount of time specified. How can I do that?

pppd call isp & sleep 1800; killall pppd

>
> Cheers
>
> David 
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
