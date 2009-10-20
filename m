From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Tue, 20 Oct 2009 03:42:26 +0000
Subject: Re: kernel panic in latest vanilla stable, while using nameif with
Message-Id: <4ADD31A2.4030702@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200910190002.39937.denys@visp.net.lb>	 <e6d1cecd0910182034t9d24859mc6f392875b36ad17@mail.gmail.com>	 <4ADC5D3B.8010006@gmail.com>	 <e6d1cecd0910190619t3e009e1by49cc8f7307eb7cdb@mail.gmail.com>	 <20091019155034.GA5233@lenovo>	 <e6d1cecd0910190905x382bfc23w2987c84aa0837609@mail.gmail.com>	 <4ADC9DE2.5010308@gmail.com>	 <e6d1cecd0910191107h899a4ffs588f2413093dfb4b@mail.gmail.com>	 <4ADCB3A4.8060408@gmail.com> <e6d1cecd0910191354o16d023d2lbe2761a97e88acea@mail.gmail.com>
In-Reply-To: <e6d1cecd0910191354o16d023d2lbe2761a97e88acea@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Michal Ostrowski <mostrows@gmail.com>
Cc: Cyrill Gorcunov <gorcunov@gmail.com>, Denys Fedoryschenko <denys@visp.net.lb>, netdev <netdev@vger.kernel.org>, linux-ppp@vger.kernel.org, paulus@samba.org, mostrows@earthlink.net

Michal Ostrowski a =E9crit :
> Access of po->pppoe_dev is guarded by sk->sk_state & PPPOX_CONNECTED,
> and all use cases now rely on the socket lock.  Because of this, the
> ref-count on the namespace held by the socket object suffices to hold
> the namespace in existence and so we don't need to ref-count the
> namespace in PPPoE. The flush_lock is gone.
>=20

Seems good !

But can we use lock_sock() in __pppoe_xmit() context ?



