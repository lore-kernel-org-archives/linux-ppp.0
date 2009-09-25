From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 25 Sep 2009 18:56:14 +0000
Subject: Re: ppp link time limit
Message-Id: <4ABD124E.9090101@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <004001ca3e15$69a6b9d0$0413010a@scu.escambray.com.cu>
In-Reply-To: <004001ca3e15$69a6b9d0$0413010a@scu.escambray.com.cu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Davy Leon wrote:
> Hi guys
> 
> I have a link wich I stablish by running
> 
> pppd call isp
> 
> It' launched by the cron at some scheduled times of the day. I need the
> link doesn't stay up for more than 30 min, but doesn't know how to do
> that. No matter the link is idle or being used I want to terminate it
> once reached the ammount of time specified. How can I do that?

I should probably port this option over from the OpenSolaris variant of
pppd:

     maxconnect n

         Terminate the connection after it has been available for
         network  traffic for n seconds (that is, n seconds after
         the first  network  control  protocol  starts).  An  LCP
         Time-Remaining  message  is  sent  when  the  first  NCP
         starts, and again when 5, 2, and 0.5 minutes are remain-
         ing.

Without that option, one way of doing what you ask is to use the
"linkname" parameter to force a reliable PID file name, and then just
sleep and kill the process based on the contents of that file.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
