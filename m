From: jfj <jfj@freemail.gr>
Date: Mon, 18 Sep 2006 20:29:34 +0000
Subject: Re: pppd security
Message-Id: <450F01AE.9060306@freemail.gr>
List-Id: <linux-ppp.vger.kernel.org>
References: <450EBBCE.5030204@freemail.gr>
In-Reply-To: <450EBBCE.5030204@freemail.gr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Carlson wrote:

>>If so, does it sound like a feasible idea to hack the kernel to forbid
>>opening the /dev/ppp device to other processes, once pppd is working?
> 
> 
> It sounds plausible, but since I don't understand the trust model
> you're working with, I'm afraid I can't address the broader questions.
> 
> (In particular, pppd needs a substantial amount of privilege in order
> to run the /etc/ppp/ip-{up,down} scripts properly.  Given that level
> of privilege, and the trust that it necessarily implies, I think that
> if you have problems in pppd, you're already sunk, no matter how you
> try to limit the scope.)
> 

The trust model is this: We suppose that malware is running.
Suppose from a buffer overflow in libPNG which achieved
priviledge escallation to root. It is OK for malware to run but
it will not be able to connect to anyone. Thus the attacker
will be blind, he will never know that the malware is
working and it will operate in isolation. Therefore,
nobody will be able to *control* the host or *get* data from
it. Sure, the running malware may delete everything :)

So the host may be compromised but it will be more like the
good old viruses that were transmitted in the boot sector
and didn't have a link to their creator.

Anyway. Thanks for the tips.

jerald

