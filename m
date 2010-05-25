From: walter harms <wharms@bfs.de>
Date: Tue, 25 May 2010 10:18:26 +0000
Subject: Re: [Patch] fix packet loss and massive ping spikes with PPP 	multi-link
Message-Id: <4BFBA3F2.2000301@bfs.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <2d460de71003260850x7f90d04cy79ac853464108182@mail.gmail.com>
In-Reply-To: <2d460de71003260850x7f90d04cy79ac853464108182@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



Richard Hartmann schrieb:
> Hi all,
> 
> unfortunately, I lack the thread [1] in which John and Erik so I am
> replying in my initial thread.
> 
> Unfortunately, our own patch is still in its initial state even though
> we tried to clean it up to the Kernel's standard.
> 
> As you can see in [1], there is a real problem with multilink ppp. Thus,
> I wanted to take the opportunity to ask for someone who is more familiar
> with both C and the Linux Kernel than we are to have a go at getting
> this code cleaned up and into mainline.
> 
> 
> Any and all feedback appreciated,
> Richard
> 


Hi Richard,
i am not an export on kernel programming but i took a quick look into
patch and it look reasonable.
by looking at the patch only:

ppp->rrsched never gets resetted, i assume that is somewhere else ?

can you move the whole block into a separate function ?
then it will be easy to remove the ifdef stuff from the core function.

#if multi_link
 function()
{

	do shomething
}
#else
function();
#endif

you get the idea ?

re,
 wh
