From: Bhaskar-ROCSYS <vbhaskar@rocsys.com>
Date: Wed, 16 Jun 2004 12:41:10 +0000
Subject: Re: PPP state machine
Message-Id: <1087388970.2646.10.camel@Bhaskar>
List-Id: <linux-ppp.vger.kernel.org>
References: <1087365446.1118.10.camel@Bhaskar>
In-Reply-To: <1087365446.1118.10.camel@Bhaskar>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi
First of all thanks for the response.

To answer to big question of "Why?", farsync card that I am using has 4
interfaces.  And the application in which i am working on may need all
the 4 interfaces to be up.
If I have to use the existing code, then I need to run 4 different
instances of pppd.  And if I want to use the same code, then I need to
go for a design similar to pppoe.  For such design i need to write code
both in kernel space and user space.
I decide to stick to kernel space and implement the complete state
machine in kernel space.  I am only interested in state machine.  Once
this is done I will initiate the state machine from the sync ppp code.

I think for implementing the state machine is independent of the mode.


Regards
bhaskar
On Wed, 2004-06-16 at 17:36, James Carlson wrote:
> Bhaskar-ROCSYS writes:
>  > I am trying to put the complete PPP state machine into the kernel space.
> 
> The first big question to ask is "why?"  Why do you want to do this?
> It will undoubtedly reduce functionality (it's hard to link to system
> libraries or launch external helper programs from kernel space) and
> lower system stability and security.  By far, the most complex piece
> of PPP is the state machine and related support components.  Why would
> anyone want these complex bits added to the kernel?

> 
> What is the problem being solved?  I don't think it can be a
> performance issue, since the state machine is part of the control
> path, and the entire data path is already in the kernel.
> 
>  > Farsync depends on syncppp code which contains the implementation of the
>  > PPP protocol.  But the code is not complete.  There is not
>  > authentication phase and IPCP protocol implementation is not complete.
> 
> I take it that this means that there's some third party code that
> you're using that's designed this way.  I'd suggest changing that code
> so that it just behaves as a normal synchronous interface, and use
> pppd as it is.
> 
>  > Is it possible to port the user space code to kernel space.  If so how
>  > do I proceed.  
>  > Did anyone tried this?
> 
> Other than embedded systems, where there's often no kernel/user
> distinction, I don't think so.


