From: "cyx_mail" <cyx_mail@foxmail.com>
Date: Wed, 21 May 2008 06:47:16 +0000
Subject: about pppd termination?
Message-Id: <200805211447103125311@foxmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi, All:

	I think there are two reasons that cause pppd terminate himself: (1) the link has down (2) pppd has received SIGTERM
Whether these two kinds of termination process eventually go to a same path? or they finally call the same function. And the function is "die()" ? Thanks :) 


