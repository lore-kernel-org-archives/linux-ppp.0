From: Lie Arne <Arne.Lie@sintef.no>
Date: Fri, 12 Sep 2008 14:44:21 +0000
Subject: ppp  XMIT_WAKEUP flag: who sets it?
Message-Id: <39417DF3286A66428FA558987839F44F064DF865@SINTEFXCH01.sintef.no>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


 Hi,

We have now found a workaround for our problems with PPP dropping
packets:
1. Our tty driver now returns "0" to ppp_async_push() instead og
"-EAGAIN"
2. We had to modify the line 
"if (test_bit(XMIT_WAKEUP, &ap->xmit_flags) && ppp_async_push(ap)) { "
in ppp_async_process() to become:
"if (ppp_async_push(ap)) { "

since apparently no process/function in our system sets the XMIT_WAKEUP.
Can anybody tell us who is / should be responsible for setting this
flag?

Our workaround seems working stable though. :-) 

Best regards
 
Arne Lie
SINTEF ICT, Dept. of Communication Systems

e-mail: arne.lie@sintef.no 
