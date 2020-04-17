From: Eivind Naess <enaess@gmail.com>
Date: Fri, 17 Apr 2020 21:13:05 +0000
Subject: Re: [PATCH] Adding EAP-MSCHAPv2 support
Message-Id: <CAKuzOki9kgpmdohOhDSUSV+R_Hr96ETSo1AE5DY-dugsviT9MQ@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAKuzOkiM0Z9DV9LofTtgAi3bEfxzqk0BLm-QpQq0CLHVdT5aAw@mail.gmail.com>
In-Reply-To: <CAKuzOkiM0Z9DV9LofTtgAi3bEfxzqk0BLm-QpQq0CLHVdT5aAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Ok, thanks for the clarification. Is there anything that needs to be
done then? Can this be applied?

On Fri, Apr 17, 2020 at 2:03 PM James Carlson <carlsonj@workingcode.com> wrote:
>
> On 2020-04-17 16:50, Eivind Naess wrote:
> > The RFC draft maybe long expired, but Microsoft still has EAP-MSCHAPv2
> > enabled by default settings. The problem is that if EAP gets
> > negotiated (because the client supports it), EAP-MSCHAPv2 will
> > typically be selected. A workaround would be to disable EAP
> > negotiation on the client side to allow MSCHAPv2 to be selected and
> > that be only if the Microsoft server is configured to allow that. It's
> > mostly a compatibility problem for end-users, especially when using
> > SSTP.
>
> Oh, I have no doubt that they're using it, and that users will want a
> feature like this.  I was only pointing out that the submission comment
> was slightly inaccurate.  There is, as far as I know, no published RFC
> describing this protocol.
>
> The document you're citing is an Internet-Draft, not an RFC.  There's no
> such thing as an "RFC draft."
>
> The difference is important to folks in the IETF (at least).  An RFC
> goes through a documented review and acceptance process and never
> expires.  An I-D is a temporary document that has no necessary review
> whatsoever and expires after a few months.  It's not correct to refer to
> an I-D as any sort of RFC.
>
> --
> James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>



-- 
Cheers,
- Eivind
