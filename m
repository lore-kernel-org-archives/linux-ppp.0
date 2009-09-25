From: Chris Fowler <cfowler@outpostsentinel.com>
Date: Fri, 25 Sep 2009 18:28:17 +0000
Subject: Re: ppp link time limit
Message-Id: <1253903297.6726.674.camel@compaq>
List-Id: <linux-ppp.vger.kernel.org>
References: <004001ca3e15$69a6b9d0$0413010a@scu.escambray.com.cu>
In-Reply-To: <004001ca3e15$69a6b9d0$0413010a@scu.escambray.com.cu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

       maxconnect n
              Terminate the connection when it has been available for
network
              traffic  for  n  seconds (i.e. n seconds after the first
network
              control protocol comes up).


On Fri, 2009-09-25 at 14:21 -0500, Davy Leon wrote:
> Hi guys
> 
> I have a link wich I stablish by running
> 
> pppd call isp
> 
> It' launched by the cron at some scheduled times of the day. I need the link 
> doesn't stay up for more than 30 min, but doesn't know how to do that. No 
> matter the link is idle or being used I want to terminate it once reached 
> the ammount of time specified. How can I do that?
> 
> Cheers
> 
> David 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

