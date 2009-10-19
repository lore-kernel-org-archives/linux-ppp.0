From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Mon, 19 Oct 2009 12:36:11 +0000
Subject: Re: kernel panic in latest vanilla stable, while using nameif with
Message-Id: <4ADC5D3B.8010006@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200910190002.39937.denys@visp.net.lb> <e6d1cecd0910182034t9d24859mc6f392875b36ad17@mail.gmail.com>
In-Reply-To: <e6d1cecd0910182034t9d24859mc6f392875b36ad17@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Michal Ostrowski <mostrows@gmail.com>
Cc: Denys Fedoryschenko <denys@visp.net.lb>, netdev <netdev@vger.kernel.org>, linux-ppp@vger.kernel.org, paulus@samba.org, mostrows@earthlink.net

Michal Ostrowski a =E9crit :
> Here's my theory on this after an inital look...
>=20
> Looking at the oops report and disassembly of the actual module binary
> that caused the oops, one can deduce that:
>=20
> Execution was in pppoe_flush_dev().  %ebx contained the pointer "struct
> pppox_sock *po", which is what we faulted on, excuting "cmp %eax, 0x190(%=
ebx)".
> %ebx value was 0xffffffff (hence we got "NULL pointer dereference at 0x18=
f").
>=20
> At this point "i" (stored in %esi) is 15 (valid), meaning that we got a v=
alue
> of 0xffffffff in pn->hash_table[i].
>=20
>>From this I'd hypothesize that the combination of dev_put() and release_s=
ock()
> may have allowed us to free "pn".  At the bottom of the loop we alreayd
> recognize that since locks are dropped we're responsible for handling
> invalidation of objects, and perhaps that should be extended to "pn" as w=
ell.
> --
> Michal Ostrowski
> mostrows@gmail.com
>=20
>=20

Looking at this stuff, I do believe flush_lock protection is not
properly done.

At the end of pppoe_connect() for example we can find :

err_put:
        if (po->pppoe_dev) {
                dev_put(po->pppoe_dev);
                po->pppoe_dev =3D NULL;
        }

This is done without any protection, and can therefore clash with=20
pppoe_flush_dev() :

	spin_lock(&flush_lock);
	po->pppoe_dev =3D NULL; /* ppoe_dev can already be NULL before this point =
*/
	spin_unlock(&flush_lock);

	dev_put(dev);    /* oops */
