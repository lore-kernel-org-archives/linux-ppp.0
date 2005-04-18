From: =?ISO-8859-1?Q?Timo_Ter=E4s?= <ext-timo.teras@nokia.com>
Date: Mon, 18 Apr 2005 09:58:16 +0000
Subject: Detecting end of GSM datacall
Message-Id: <426384B8.6050809@nokia.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

I'm currently using PPP with GSM datacalls (PC connected using Bluetooth 
to mobile phone) and it works just fine. However, if I terminate the 
phone call from my mobile phone the loss of link is not detected.

I tracked down the reason: since the PPP link is between PC and remote 
computer, the mobile phone does not send any PPP packets that the link 
is dead. Instead it just sends '\r\nNO CARRIER\r\n'. And leaves the 
Bluetooth connection in AT command mode. Thus PPP stays happily up.

This AT info is received by the PPP async driver, but it stores it and 
does not process it since PPP_FLAG is never received in ppp_async_input().

Now I'm wondering what would be the proper way to fix this?

Thanks,
   Timo
