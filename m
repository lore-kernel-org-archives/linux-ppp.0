From: "Nestor Urquiza" <nestor.urquiza@gmail.com>
Date: Sun, 20 Jan 2008 16:54:09 +0000
Subject: Re: RSA SecurId (RFC 4793) support
Message-Id: <dff43e6d0801200854m3869e9e3v42f9fcf9d7e62c05@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

subject typo corrected...

On Jan 20, 2008 11:48 AM, Nestor Urquiza <nestor.urquiza@gmail.com> wrote:
> Hi guys,
> I just wanted to understand if you have any plan to give support for
> RSA SecurId (EAP-POTP) which corresponds to EAP type 15.
>
> The specifications are publicly available as you see from IETF RFC
> 4793 ... The EAP Protected One-Time Password Protocol (EAP-POTP).
>
> I posted some months ago a question asking for support at pptp mailing
> list since by that time I had no idea about PPP and EAP and I was
> guessing RSA SecurId authentication was something related to PPTP.
>
> After some further reading I realized that the specs are publicly
> available and someone has patched pppd to support EAP-TLS.  I guess
> supporting EAP-POTP shouldn't be that hard since EAP-TLS and EAP-POTP
> are just different types from the same rfc 3748.
>
> Thanks in advance,
>
> -Nestor
>
