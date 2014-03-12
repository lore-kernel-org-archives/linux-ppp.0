From: terry white <twhite@aniota.com>
Date: Wed, 12 Mar 2014 12:14:42 +0000
Subject: Re: Suspecting kernel timing bug in ppp or tty drivers
Message-Id: <Pine.LNX.4.64.1403120452230.17831@yossarian>
List-Id: <linux-ppp.vger.kernel.org>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B180258@post.tritech.se>
 <20140310194007.GC3392@kroah.com> <ED3E0BCACD909541BA94A34C4A164D4C5B180A77@post.tritech.se>
 <20140311185019.GA32618@kroah.com>
In-Reply-To: <20140311185019.GA32618@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org, linux-serial@vger.kernel.org


... ciao:

" Some data about the system:
  - PPP daemon v2.4.5
  - Linux kernel v3.2.51 (same error with v2.6.35 though)

  That's a really old kernel version, can you try 3.13 or newer?  
  Lots of work has been done in the tty layer since 3.2 was released."
 
   my reading of this 'thread' suggests that "pppd" and/or "serial" have 
started "DEMANDING" bleeding edge kernel versions.  if that 'correct', for 
me anyway, it's going to prove problematic.  that aside, it doesn't seem 
like the most elegant solution, to problems it's meant to address ...

-- 
... it's not what you see ,
    but in stead , notice ...
