From: Charlie Brady <charlieb-linux-ppp@budge.apana.org.au>
Date: Mon, 06 Nov 2017 14:19:38 +0000
Subject: Re: SOLVED: kernel-mode PPPoE does not seem able to work with MPPE.
Message-Id: <Pine.LNX.4.64.1711060918150.1146@e-smith.charliebrady.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="-1463809535-1892769251-1509977978=:1146"
List-Id: <linux-ppp.vger.kernel.org>
References: <7587137d-f9ae-a4ac-843e-6688af5ff017@googlemail.com>
In-Reply-To: <7587137d-f9ae-a4ac-843e-6688af5ff017@googlemail.com>
To: linux-ppp@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463809535-1892769251-1509977978=:1146
Content-Type: TEXT/PLAIN; charset="utf-8"
Content-Transfer-Encoding: 8bit


Why would you do this, rather than just delete the code you are removing?

> --- a/drivers/net/ppp/ppp_mppe.c
> +++ b/drivers/net/ppp/ppp_mppe.c
> @@ -521,11 +521,12 @@ mppe_decompress(void *arg, unsigned char
>                 state->sanity_errors += 100;
>                 goto sanity_error;
>         }
> -       if (state->stateful && ((ccount & 0xff) == 0xff) && !flushed) {
> +       if (state->stateful && ((ccount & 0xff) == 0xff) && !flushed)
> {/*
>                 printk(KERN_DEBUG "mppe_decompress[%d]: FLUSHED
> bit not set on "
>                        "flag packet!\n", state->unit);
>                 state->sanity_errors += 100;
> -               goto sanity_error;
> +               goto sanity_error;*/
> +                flushed = 1;
>         }

---1463809535-1892769251-1509977978=:1146--
