From: James Carlson <carlsonj@carlson.workingcode.com>
Date: Wed, 16 Jun 2004 12:06:22 +0000
Subject: PPP state machine
Message-Id: <16592.14270.257179.415153@carlson.workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1087365446.1118.10.camel@Bhaskar>
In-Reply-To: <1087365446.1118.10.camel@Bhaskar>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Bhaskar-ROCSYS writes:
 > I am trying to put the complete PPP state machine into the kernel space.

The first big question to ask is "why?"  Why do you want to do this?
It will undoubtedly reduce functionality (it's hard to link to system
libraries or launch external helper programs from kernel space) and
lower system stability and security.  By far, the most complex piece
of PPP is the state machine and related support components.  Why would
anyone want these complex bits added to the kernel?

What is the problem being solved?  I don't think it can be a
performance issue, since the state machine is part of the control
path, and the entire data path is already in the kernel.

 > Farsync depends on syncppp code which contains the implementation of the
 > PPP protocol.  But the code is not complete.  There is not
 > authentication phase and IPCP protocol implementation is not complete.

I take it that this means that there's some third party code that
you're using that's designed this way.  I'd suggest changing that code
so that it just behaves as a normal synchronous interface, and use
pppd as it is.

 > Is it possible to port the user space code to kernel space.  If so how
 > do I proceed.  
 > Did anyone tried this?

Other than embedded systems, where there's often no kernel/user
distinction, I don't think so.
