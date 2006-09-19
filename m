From: jfj <jfj@freemail.gr>
Date: Tue, 19 Sep 2006 12:07:21 +0000
Subject: Re: pppd security
Message-Id: <450FDD79.9090404@freemail.gr>
List-Id: <linux-ppp.vger.kernel.org>
References: <450EBBCE.5030204@freemail.gr>
In-Reply-To: <450EBBCE.5030204@freemail.gr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Carlson wrote:

>jfj writes:
>  
>
>>The trust model is this: We suppose that malware is running.
>>Suppose from a buffer overflow in libPNG which achieved
>>priviledge escallation to root. It is OK for malware to run but
>>it will not be able to connect to anyone.
>>    
>>
>
>What's the point in that?
>
>If your fix becomes common practice, then attackers will just learn to
>open /dev/kmem and rewrite the bits that are preventing them from
>doing what they need to do.  Or more simply just overwrite a binary
>that has the privileges desired, and exec that.
>
>If your fix doesn't become common practice, then the problem (to a
>large extent) hasn't been solved.
>  
>

In order for this to work is must not be common practice.
I'm trying to secure a very specific system. The logic is that it
will be a custom system where, for example, one must do a
couple of ioctl()s on a socket before it is activated. If the
ioctl()s are known, we've done nothing.

It is based on trying to predict what a malware would
attempt and sabotage it by adding non-standard calls.
Without feedback from the inside, the attackers work
will be quite difficult.

And if the malware tries too many things, it will be
detected sooner or later. (/dev/kmem disabled by
CAP_RAWIO)

Now I'm thinking about getting `struct ppp*` from `struct file*`
in ppp_open() and failing if n_channels is non zero. Sounds reasonable?

jerald

