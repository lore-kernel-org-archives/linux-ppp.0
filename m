From: Mohan V <mohanv@aftek.com>
Date: Thu, 13 Jan 2005 08:18:58 +0000
Subject: Performance of USB over PPP
Message-Id: <41E62C22.6050904@aftek.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello all,

I am using usb-serial driver and got the PPP over USB running 
successfully using this driver.  I am able to ping between the device 
and host and viceversa successfully. I am also able to do ftp. When i 
try to transfer a file of 1MB size from host to device, the transfer 
takes 1minute. For files sizes in the range of hundreds of KB, I get a 
throughput of 30kbps.
I wanted to know whether the performance of USB is affected by the PPP.

Thanks for your time..

Regards,
mohan.

