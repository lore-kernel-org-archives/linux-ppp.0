From: Paul Mackerras <paulus@samba.org>
Date: Wed, 16 Jun 2004 12:58:14 +0000
Subject: Re: PPP state machine
Message-Id: <16592.17382.643051.894441@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1087365446.1118.10.camel@Bhaskar>
In-Reply-To: <1087365446.1118.10.camel@Bhaskar>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Bhaskar-ROCSYS writes:

> To answer to big question of "Why?", farsync card that I am using has 4
> interfaces.  And the application in which i am working on may need all
> the 4 interfaces to be up.
> If I have to use the existing code, then I need to run 4 different
> instances of pppd.  And if I want to use the same code, then I need to

Those 4 instances will share code, only the data pages will be private
to each process.  If you said you needed thousands of instances I
might have some sympathy.  If you really need to trim it down you
could link pppd against one of the smaller libc implementations that
are out there instead of using glibc.

> go for a design similar to pppoe.  For such design i need to write code
> both in kernel space and user space.
> I decide to stick to kernel space and implement the complete state
> machine in kernel space.  I am only interested in state machine.  Once
> this is done I will initiate the state machine from the sync ppp code.

Unfortunately the authors of the syncppp code in Linux have never
converted it to use the ppp_generic module.  That would be the correct
approach IMO.

I can't see any advantage to putting the state machine in the kernel
apart from saving a few pages of memory, and if memory is that tight,
why are you running Linux anyway?

Paul.
