From: James Carlson <carlsonj@carlson.workingcode.com>
Date: Wed, 16 Jun 2004 12:43:03 +0000
Subject: Re: PPP state machine
Message-Id: <16592.16471.446265.776880@carlson.workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1087365446.1118.10.camel@Bhaskar>
In-Reply-To: <1087365446.1118.10.camel@Bhaskar>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Bhaskar-ROCSYS writes:
 > Hi
 > First of all thanks for the response.
 > 
 > To answer to big question of "Why?", farsync card that I am using has 4
 > interfaces.  And the application in which i am working on may need all
 > the 4 interfaces to be up.
 > If I have to use the existing code, then I need to run 4 different
 > instances of pppd.

Right.  Is having four daemons a problem?  It makes the links easy to
administer and configure.  What's the problem being solved?

 >  And if I want to use the same code, then I need to
 > go for a design similar to pppoe.  For such design i need to write code
 > both in kernel space and user space.

Since you're talking about sync PPP, I don't understand the reference
to PPPoE.  PPPoE is a bit of an ugly hack that involves (on Linux)
multiple trips in and out of the kernel for the data path.  I don't
know why you'd want to do that.

The user space daemon already supports running on sync ports, and the
implementation is efficient -- it doesn't involve the pty tricks as
done for PPPoE.  The data path is all in the kernel.

As far as I can tell, you don't need to change anything in user space.
You just need a sync driver for your card.

 > I decide to stick to kernel space and implement the complete state
 > machine in kernel space.  I am only interested in state machine.  Once
 > this is done I will initiate the state machine from the sync ppp code.
 > 
 > I think for implementing the state machine is independent of the mode.

In that case, best of luck.
