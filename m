From: rajendra boppana <rajendra.boppana@gmail.com>
Date: Thu, 06 May 2010 13:41:51 +0000
Subject: Re: How do I track the bytes across the /dev/pppx interface?
Message-Id: <loom.20100506T153531-549@post.gmane.org>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

hi paul 

I am new building images for devices but am learning to use that and i like to
know whether you have implemented PPP and were successfull in filtering the
traffic which is not useful and always resets idle timer in demand dial mode .
did you use active filters or the precompiled filter ? if so can you please
share your knowledge.

problem description:

 the bellow expression doesn't filter any traffic and keeps the link up 

active-filter 'outbound and  not (icmp[0] = 0)'

and where as 

active-filter 'outbound and (icmp[0] != 0)'

doesn't allow any traffic to make the link up....

thanks in advance for much needed help.

regards,
rajendra
 



