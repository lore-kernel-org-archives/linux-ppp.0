From: Bhaskar-ROCSYS <vbhaskar@rocsys.com>
Date: Wed, 16 Jun 2004 05:52:49 +0000
Subject: PPP state machine
Message-Id: <1087365446.1118.10.camel@Bhaskar>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi all,
I am trying to put the complete PPP state machine into the kernel space.

PPP implementation in linux is divided into kernel space code and user
space code.  The state machine is implemented in user space.  

I am trying to put the complete state machine into the kernel space and
make it work with Farsync card(V.35 interface).

Farsync depends on syncppp code which contains the implementation of the
PPP protocol.  But the code is not complete.  There is not
authentication phase and IPCP protocol implementation is not complete.

Is it possible to port the user space code to kernel space.  If so how
do I proceed.  
Did anyone tried this?


TIA

Regards
bhaskar





