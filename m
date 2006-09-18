From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 18 Sep 2006 20:46:03 +0000
Subject: Re: pppd security
Message-Id: <17679.1419.804724.890626@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <450EBBCE.5030204@freemail.gr>
In-Reply-To: <450EBBCE.5030204@freemail.gr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

jfj writes:
> The trust model is this: We suppose that malware is running.
> Suppose from a buffer overflow in libPNG which achieved
> priviledge escallation to root. It is OK for malware to run but
> it will not be able to connect to anyone.

What's the point in that?

If your fix becomes common practice, then attackers will just learn to
open /dev/kmem and rewrite the bits that are preventing them from
doing what they need to do.  Or more simply just overwrite a binary
that has the privileges desired, and exec that.

If your fix doesn't become common practice, then the problem (to a
large extent) hasn't been solved.

> Thus the attacker
> will be blind, he will never know that the malware is
> working and it will operate in isolation. Therefore,
> nobody will be able to *control* the host or *get* data from
> it. Sure, the running malware may delete everything :)
> 
> So the host may be compromised but it will be more like the
> good old viruses that were transmitted in the boot sector
> and didn't have a link to their creator.

As long as the system still has a network connection, and root remains
all-powerful, I think you're stuck with that problem.

I suspect that achieving what you describe really means reigning in
the power of root, so that even if someone gets access to UID 0, he
doesn't have access to the rest of the system, and drastically
reducing the scope of [bracketing] privileges, so that nothing that
requires additional privileges is ever using libPNG in the first
place.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
