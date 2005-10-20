From: Boky Gmail <verynotbad@gmail.com>
Date: Thu, 20 Oct 2005 10:56:53 +0000
Subject: Re: Authentificating with certificates ("unknown authentication type 13; Naking")
Message-Id: <e8666cf90510200356p49ec00c7n77484916a8ed9c83@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <e8666cf9050727142635284b29@mail.gmail.com>
In-Reply-To: <e8666cf9050727142635284b29@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Yes, we know about EAP-TLS.

But EAP-TLS does not allow you to use MPPE/MPPC (128bit) since
MPPE/MPPC patch expects that you use MS-CHAP[v2] authentification and
EAP-TLS patch uses EAP authentification.

Did you hack the EAP-TLS patch to provide correct credentials to
MPPE/MPPC patch. Are you sure you are using MPPE/MPPC?

I thought I was (PPTP said in output log it negotiated MPPE 128bit)
but I was getting errors like "Unknown protocol 0x??...".

As it turns out when I added "require-mppe" to my options the tunnel
was not being setup anymore and I started getting errors in the lines
of "MS-CHAP[v2] required for MPPE/MPPC".

If you have a patch for this we'd of course be more than happy to se it.

Cheers,
Bojan

On 10/20/05, Jan Just Keijser <jan.just.keijser@gmail.com> wrote:
> hi all,
>
> there already is a patch to do EAP-TLS authentication with ppp; see
>   http://eaptls.spe.net
> for details. I've just completed the patch against ppp-2.4.3 to allow
> MPPE encryption with EAP-TLS. I have created two versions:
> - one against the ppp_mppe module which supports 128bit MPPE but no MPPC
> - one against the ppp_mppe_mppc module which supports 40/56/128 bit MPPE
> and MPPC (but there are some licensing issues, I believe, with using MPPC).
> Tested it with both XP and W2K as clients, Linux as a PoPToP server -
> works beautifully :)
