From: Richard Hartmann <richih.mailinglist@gmail.com>
Date: Fri, 26 Mar 2010 16:39:27 +0000
Subject: Re: [Patch] fix packet loss and massive ping spikes with PPP
Message-Id: <v2v2d460de71003260939w4877df7em9e3084a315b0962f@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <2d460de71003260850x7f90d04cy79ac853464108182@mail.gmail.com>
	 <20100326160226.0159ac3b@lxorguk.ukuu.org.uk>
In-Reply-To: <20100326160226.0159ac3b@lxorguk.ukuu.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-ppp@vger.kernel.org

On Fri, Mar 26, 2010 at 17:02, Alan Cox <alan@lxorguk.ukuu.org.uk> wrote:

> You should be able to manage that I'm sure:

Hopefully. We will see :)


> MODULE_PARM_DESC(ml_expode, "Set this to zero to disabling multilink \
>        fragmentation when talking to cisco devices");

To be exact, this is not a Linux vs. Cisco issue, but a Linux vs. world
issue.

At least the last-level support of Telefonica and QSC was definite and
adamant about not enabling fragmentation on _any_ PPP multi-link, ever.

Also, I am not sure if it would not be better to default to no
fragmentation and enable it optionally. I am aware that changing default
behaviour is always a bit of a problem but to the best of my knowledge
enabling fragmentation is a bug in any and all real-world applications.


Richard
