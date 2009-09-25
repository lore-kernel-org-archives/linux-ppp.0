From: "Davy Leon" <davy@scu.escambray.com.cu>
Date: Fri, 25 Sep 2009 18:20:12 +0000
Subject: ppp link time limit
Message-Id: <004001ca3e15$69a6b9d0$0413010a@scu.escambray.com.cu>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi guys

I have a link wich I stablish by running

pppd call isp

It' launched by the cron at some scheduled times of the day. I need the link 
doesn't stay up for more than 30 min, but doesn't know how to do that. No 
matter the link is idle or being used I want to terminate it once reached 
the ammount of time specified. How can I do that?

Cheers

David 

