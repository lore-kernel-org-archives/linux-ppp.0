From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Mon, 19 Oct 2009 17:12:02 +0000
Subject: Re: kernel panic in latest vanilla stable, while using nameif with
Message-Id: <4ADC9DE2.5010308@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200910190002.39937.denys@visp.net.lb>	 <e6d1cecd0910182034t9d24859mc6f392875b36ad17@mail.gmail.com>	 <4ADC5D3B.8010006@gmail.com>	 <e6d1cecd0910190619t3e009e1by49cc8f7307eb7cdb@mail.gmail.com>	 <20091019155034.GA5233@lenovo> <e6d1cecd0910190905x382bfc23w2987c84aa0837609@mail.gmail.com>
In-Reply-To: <e6d1cecd0910190905x382bfc23w2987c84aa0837609@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Michal Ostrowski <mostrows@gmail.com>
Cc: Cyrill Gorcunov <gorcunov@gmail.com>, Denys Fedoryschenko <denys@visp.net.lb>, netdev <netdev@vger.kernel.org>, linux-ppp@vger.kernel.org, paulus@samba.org, mostrows@earthlink.net

Michal Ostrowski a =E9crit :
> Here's a bigger patch that just gets rid of flush_lock altogether.
>=20
> We were seeing oopses due to net namespaces going away while we were using
> them, which turns out is simply due to the fact that pppoew wasn't claimi=
ng ref
> counts properly.
>=20
> Fixing this requires that adding and removing entries to the per-net hash=
-table
> requires incrementing and decrementing the ref count.  This also allows u=
s to
> get rid of the flush_lock since we can now depend on the existence of
> "pn->hash_lock".
>=20
> We also have to be careful when flushing devices that removal of a hash t=
able
> entry may bring the net namespace refcount to 0.
>=20

Your patch is mangled (tabulation -> white spaces),

and I dont believe namespace refcount can reach 0 inside pppoe_flush_dev(),
it would be a bug from core network code.


