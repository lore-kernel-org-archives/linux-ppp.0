From: Matteo Croce <mcroce@redhat.com>
Date: Fri, 23 Nov 2018 18:34:35 +0000
Subject: Re: [PATCH v3] pppoe: custom host-uniq tag
Message-Id: <CAGnkfhxEymaUSnzMkt6ty0hcCVSSsc3TdPGttJO4CBj=2WsusQ@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20181107235243.676-1-mcroce@redhat.com>
In-Reply-To: <20181107235243.676-1-mcroce@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Sat, Nov 10, 2018 at 6:55 AM Paul Mackerras <paulus@ozlabs.org> wrote:
>
> On Thu, Nov 08, 2018 at 12:52:43AM +0100, Matteo Croce wrote:
> > Add pppoe 'host-uniq' option to set an arbitrary
> > host-uniq tag instead of the pppd pid.
> > Some ISPs use such tag to authenticate the CPE,
> > so it must be set to a proper value to connect.
>
> In the absence of a man page for rp-pppoe, I'd like to see a
> description of the new option and the syntax for its argument in the
> patch description.
>

I'll specify in the help message that the string must be in hex format

> And unfortunately, I think there is a user-triggerable buffer overrun
> that you've added:
>
> > +static inline int parseHostUniq(const char *uniq, PPPoETag *tag)
> > +{
> > +    unsigned i, len = strlen(uniq);
> > +
> > +#define hex(x) \
> > +    (((x) <= '9') ? ((x) - '0') : \
> > +        (((x) <= 'F') ? ((x) - 'A' + 10) : \
> > +            ((x) - 'a' + 10)))
> > +
> > +    if (!len || len & 1)
> > +        return 0;
> > +
> > +    for (i = 0; i < len; i += 2)
> > +    {
> > +        if (!isxdigit(uniq[i]) || !isxdigit(uniq[i+1]))
> > +            return 0;
> > +
> > +        tag->payload[i / 2] = (char)(hex(uniq[i]) << 4 | hex(uniq[i+1]));
> > +    }
> > +
> > +#undef hex
> > +
> > +    tag->type = htons(TAG_HOST_UNIQ);
> > +    tag->length = htons(len / 2);
> > +    return 1;
> > +}
> > +
>
> If I give a sufficiently long argument to the host-uniq option, I can
> overflow conn->hostUniq and write whatever I want into whatever
> follows it in the heap, can't I?
>
> Paul.

Right. I'll add a check against PPPoETag.payload size.
I'm sending a v4

-- 
Matteo Croce
per aspera ad upstream
