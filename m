From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 21 Jan 2008 21:26:32 +0000
Subject: Re: RSA SecureId (RFC 4793) support
Message-Id: <18325.3592.265264.996551@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <dff43e6d0801200848j5afdc8d7w9df3d1da0f701bf8@mail.gmail.com>
In-Reply-To: <dff43e6d0801200848j5afdc8d7w9df3d1da0f701bf8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Nestor Urquiza writes:
> I just wanted to understand if you have any plan to give support for
> RSA SecureId (EAP-POTP) which corresponds to EAP type 15.

I don't have any plan to do it at the moment.  I suppose it's possible
that I might be interested in the future -- but no plans right now, so
if you want it, you'll need to do it yourself.

> The specifications are publicly available as you see from IETF RFC
> 4793 ... The EAP Protected One-Time Password Protocol (EAP-POTP).

That's an "Informational" RFC based on an individual submission.  This
means that it hasn't been through the normal IETF working group
technical review process.  It was just submitted by a contributor,
reviewed by the AD and IESG, and published.

It's worth noting that this is different from a standards-track
document, and the differences can be substantial, depending on the
submitter.  I have no reason to doubt that the submitter does high
quality work (if nothing else, 82 pages has a lot of "thud factor"),
but it's something to consider.

There are also multiple patent claims on it, and from a cursory
investigation, it seems that at least one of those claims might
require royalties in order to implement.  I'd have to be awfully
serious about implementing it in order to be willing to bother with
the hassle of getting appropriate legal representation in order to
proceed.

> After some further reading I realized that the specs are publicly
> available and someone has patched pppd to support EAP-TLS.  I guess
> supporting EAP-POTP shouldn't be that hard since EAP-TLS and EAP-POTP
> are just different types from the same rfc 3748.

The hard part is getting the interactive behavior to work right.
Features such as "new PIN" (found in EAP-POTP) aren't supported by the
current EAP design in pppd.  Instead, the design allows for queries
that are satisfied in the same way as PAP or CHAP -- usually, static
configuration in a *-secrets file, or a simple plug-in.

As for EAP-TLS, there's no support in the current code for that, but
in looking over RFC 2716, it seems to be around one tenth the
complexity of EAP-POTP, and the EAP Type value is 13 rather than 32
for POTP.

Other than that the two protocols are based on EAP, I don't see how
they're really related at all or how having one would help implement
another.  It's sort of like saying that since both SMTP and HTTP are
based on TCP, building one shouldn't be hard if you've got the other.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
