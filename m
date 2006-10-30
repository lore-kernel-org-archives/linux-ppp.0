From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 30 Oct 2006 12:48:04 +0000
Subject: Re: Way how frames are read in pppd
Message-Id: <17733.62596.807197.644325@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <4540C35F.9010104@beronet.com>
In-Reply-To: <4540C35F.9010104@beronet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Christian writes:
> Hi List (James:-)
> 
> I have still some issues with my litle project. Let me explain for short
> what i'm doing:
> 
> 
> Application (synchdlc) <---> Stdin/Stdout <----> pppd (synchdlc)

That diagram doesn't make sense to me.

Standard input and output can be open on a pseudoterminal (pty), and
pppd will work that way, but ptys accept only async data, not sync.

Ptys emulate terminals, which are devices attached to the system by
way of asynchronous ports.  They don't emulate synchronous
interfaces.  You'll need to invent your own sort of pty-like driver if
you want to run synchronous.

> to ensure boundaries i have hacked pppd to add framing for stdin/stdout,
> so that packets in pppd transmitted to stdout contain headers and
> packets received contain headers as well.

That sounds like a brutal hack.  What are you trying to do?

> My problem is the following:
> 
> I don't understand where exactly the  PPP(IP) frames are read in pppd
> and transmitted to the master_pty. It is certainly not (only) in
> read_packet. I have found out that the kernel writes correct packets
> with copy_to_user to the userspace. pppd reads them and somehow
> transmits them to the master_fd. At this point the boundaries got lost.
> 
> I have tried to read the pppd code for a while, but i think i can't see
> the forest anymore because of all the trees.

It's still not at all clear to me what you're trying to do, or why
you're doing it.

You're using async devices here -- ptys -- so why are you expecting
synchronous behavior?

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
