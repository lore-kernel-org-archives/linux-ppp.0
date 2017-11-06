From: David Fernandez <david.fernandez.work@googlemail.com>
Date: Mon, 06 Nov 2017 10:55:11 +0000
Subject: Re: SOLVED: kernel-mode PPPoE does not seem able to work with MPPE.
Message-Id: <ad4df999-ed6b-7981-b3e4-608e2d9aad69@googlemail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <7587137d-f9ae-a4ac-843e-6688af5ff017@googlemail.com>
In-Reply-To: <7587137d-f9ae-a4ac-843e-6688af5ff017@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

On 26/10/17 11:39, David Fernandez wrote:
> Right, seems that the latest kernel has not bother with this at all 
> (at least in kernel.org).
>
> The two patches proposed in the links above are basically all that is 
> needed AFAICS, only that the first one seems wrong in using only 
> ccount to avoid the first re-rekeying, as ccount will wrap around to 0 
> every now and then, so this is the patch that works for me (applied to 
> LEDE kernel 4.4.45, I guess it will apply fine to later kernels, only 
> the line numbers might be different).
>
> --- a/drivers/net/ppp/ppp_mppe.c
> +++ b/drivers/net/ppp/ppp_mppe.c
> @@ -521,11 +521,12 @@ mppe_decompress(void *arg, unsigned char
>                 state->sanity_errors += 100;
>                 goto sanity_error;
>         }
> -       if (state->stateful && ((ccount & 0xff) = 0xff) && !flushed) {
> +       if (state->stateful && ((ccount & 0xff) = 0xff) && !flushed) {/*
>                 printk(KERN_DEBUG "mppe_decompress[%d]: FLUSHED bit 
> not set on "
>                        "flag packet!\n", state->unit);
>                 state->sanity_errors += 100;
> -               goto sanity_error;
> +               goto sanity_error;*/
> +                flushed = 1;
>         }
>
>         /*
> @@ -586,8 +587,9 @@ mppe_decompress(void *arg, unsigned char
>                                  */
>                         }
>                 }
> -               if (flushed)
> +               if (flushed && (state->bits & 1) != 0)
>                         mppe_rekey(state, 0);
> +               state->bits |= 1;
>         }
>
>         /*
>
Fixed to make it work for both linux and windows.
> Basically use the state->bits & 1 as a start flag, given that they are 
> not used at all in the decompressor, is a way of quickly doing it with 
> minimal changes... Feel free to add a proper boolean to the state 
> structure and make it more obvious, but with thos two things I get it 
> working just fine for a long while now.
>
> Regards


