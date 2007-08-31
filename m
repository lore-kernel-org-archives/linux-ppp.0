From: "Dennis Aberilla" <daberill@gmail.com>
Date: Fri, 31 Aug 2007 05:39:47 +0000
Subject: Re: PPP loses compression sync when TCP transaction starts.
Message-Id: <57e69ca80708302239r24afe7cfw6bb81eb51156c905@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <57e69ca80708212104t1fbd99f7jc3beaa4b34997ffc@mail.gmail.com>
In-Reply-To: <57e69ca80708212104t1fbd99f7jc3beaa4b34997ffc@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 8/22/07, James Cameron <james.cameron@hp.com> wrote:
> What is the underlying data link, /dev/pts/0 ?
>
> --
> James Cameron                         http://quozl.netrek.org/
> HP Open Source, Volunteer             http://opensource.hp.com/
> PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
>
Yep, I missed out some details here, sorry for that.

Since I have to route packets to/from ppp to/from my serial
connection, I have a shunt program that talks to a file descriptor
from /dev/ptmx and tell pppd to use the corresponding /dev/pts/0.

Hmm... more updates... I've realized that this problem does not occur
when using BSD-compression.

I dug on this a little further and noticed that in linux-2.4.18, there
are two files "zlib.[ch]" in drivers/net that's actually used by
ppp_deflate.c. Why is it not using the kernel's "inflate.c"?? I
noticed that these "zlib.[ch]" files are no longer in 2.6.20; so as an
experiment, I copied these two files from 2.4.18 including
drivers/net/ppp_deflate.c to 2.6.20 and use them instead; the result:
Deflate works!

Could there be a bug somewhere in the deflate code?

Cheers!
