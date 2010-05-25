From: Richard Hartmann <richih.mailinglist@gmail.com>
Date: Tue, 25 May 2010 09:52:12 +0000
Subject: Re: [Patch] fix packet loss and massive ping spikes with PPP
Message-Id: <AANLkTik_QdZN_nFoOVD3-1JTGN5oxRySCdV5_eDqvQve@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <2d460de71003260850x7f90d04cy79ac853464108182@mail.gmail.com>
In-Reply-To: <2d460de71003260850x7f90d04cy79ac853464108182@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-ppp@vger.kernel.org, erik_list@caneris.com

Hi all,

unfortunately, I lack the thread [1] in which John and Erik so I am
replying in my initial thread.

Unfortunately, our own patch is still in its initial state even though
we tried to clean it up to the Kernel's standard.

As you can see in [1], there is a real problem with multilink ppp. Thus,
I wanted to take the opportunity to ask for someone who is more familiar
with both C and the Linux Kernel than we are to have a go at getting
this code cleaned up and into mainline.


Any and all feedback appreciated,
Richard

[1] http://marc.info/?l=linux-ppp&m7429724125841&w=2
