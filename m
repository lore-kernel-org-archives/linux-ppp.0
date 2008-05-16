From: "cyx_mail" <cyx_mail@foxmail.com>
Date: Fri, 16 May 2008 11:42:48 +0000
Subject: my god , I have tried to solve this problem for 2 days!
Message-Id: <200805161942479069943@foxmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I just want to know, can I use IPC in pppd and pppoe-server? 
I put some code in both pppoe-server and pppd , let them communicate with each other. using shared memory. shmget functions etc.

But pppoe-server can't get the right data that  pppd has write to the shared memory. I have test my lib functions and it just work right. So , why ? is it chance that I can't use IPC in pppd? my god ,I have worked on this problem for 2 days :(


