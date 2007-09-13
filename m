From: "Dennis Aberilla" <daberill@gmail.com>
Date: Thu, 13 Sep 2007 21:32:24 +0000
Subject: Re: PPP loses compression sync when TCP transaction starts.
Message-Id: <57e69ca80709131432x4669b0f7i12a0d0a4e3234e96@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <57e69ca80708212104t1fbd99f7jc3beaa4b34997ffc@mail.gmail.com>
In-Reply-To: <57e69ca80708212104t1fbd99f7jc3beaa4b34997ffc@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 8/31/07, James Carlson <carlsonj@workingcode.com> wrote:
> Dennis Aberilla writes:
> > I dug on this a little further and noticed that in linux-2.4.18, there
> > are two files "zlib.[ch]" in drivers/net that's actually used by
> > ppp_deflate.c. Why is it not using the kernel's "inflate.c"?? I
>
> Because there are some significant behavioral differences between
> "standard" stream-oriented Deflate compression and the
> datagram-oriented variant that PPP uses.  For more information, see
> RFC 1979 and the comments in PPP's zlib.[ch].  The additions are
> Z_PACKET_FLUSH, inflateIncomp, deflateOutputPending, and support for
> discarding output.
>
> > noticed that these "zlib.[ch]" files are no longer in 2.6.20; so as an
> > experiment, I copied these two files from 2.4.18 including
> > drivers/net/ppp_deflate.c to 2.6.20 and use them instead; the result:
> > Deflate works!
> >
> > Could there be a bug somewhere in the deflate code?
>
> Certainly could.  It's tricky stuff.
>
> --
> James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
>
Cheers to you mate! It now makes sense, thanks very much. I'm just
wondering why these files (PPP zlib) were inexistent in 2.6.20.
