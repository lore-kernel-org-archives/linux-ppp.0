From: Cyrill Gorcunov <gorcunov@gmail.com>
Date: Mon, 19 Oct 2009 15:50:34 +0000
Subject: Re: kernel panic in latest vanilla stable, while using nameif with
Message-Id: <20091019155034.GA5233@lenovo>
List-Id: <linux-ppp.vger.kernel.org>
References: <200910190002.39937.denys@visp.net.lb> <e6d1cecd0910182034t9d24859mc6f392875b36ad17@mail.gmail.com> <4ADC5D3B.8010006@gmail.com> <e6d1cecd0910190619t3e009e1by49cc8f7307eb7cdb@mail.gmail.com>
In-Reply-To: <e6d1cecd0910190619t3e009e1by49cc8f7307eb7cdb@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Michal Ostrowski <mostrows@gmail.com>
Cc: Eric Dumazet <eric.dumazet@gmail.com>, Denys Fedoryschenko <denys@visp.net.lb>, netdev <netdev@vger.kernel.org>, linux-ppp@vger.kernel.org, paulus@samba.org, mostrows@earthlink.net

[Michal Ostrowski - Mon, Oct 19, 2009 at 08:19:23AM -0500]
|
| The entire scheme for managing net namespaces seems unsafe.  We depend
| on synchronization via pn->hash_lock, but have no guarantee of the
| existence of the "net" object -- hence no way to ensure the existence
| of the lock itself.  This should be relatively easy to fix though as
| we should be able to get/put the net namespace as we add remove
| objects to/from the pppoe hash.
|

Hmm... it seems not. The only possible scenario I see (for such nonexistence
namespace is that when it was cached via RCU and returned before grace peri=
od
elapsed, so perhaps we need to call synchronize_net somewhere).

|=20
| Once you solve this existence issue, the flush_lock can be eliminated
| altogether since all of the relevant code paths already depend on a
| write_lock_bh(&pn->hash_lock), and that's the lock that should be use
| to protect the pppoe_dev field.
|=20
| Another patch to follow later...
|=20
| --
| Michal Ostrowski
| mostrows@gmail.com
|=20
|=20
|=20
| On Mon, Oct 19, 2009 at 7:36 AM, Eric Dumazet <eric.dumazet@gmail.com> wr=
ote:
| > Michal Ostrowski a =E9crit :
| >> Here's my theory on this after an inital look...
| >>
| >> Looking at the oops report and disassembly of the actual module binary
| >> that caused the oops, one can deduce that:
| >>
| >> Execution was in pppoe_flush_dev(). =A0%ebx contained the pointer "str=
uct
| >> pppox_sock *po", which is what we faulted on, excuting "cmp %eax, 0x19=
0(%ebx)".
| >> %ebx value was 0xffffffff (hence we got "NULL pointer dereference at 0=
x18f").
| >>
| >> At this point "i" (stored in %esi) is 15 (valid), meaning that we got =
a value
| >> of 0xffffffff in pn->hash_table[i].
| >>
| >>>From this I'd hypothesize that the combination of dev_put() and releas=
e_sock()
| >> may have allowed us to free "pn". =A0At the bottom of the loop we alre=
ayd
| >> recognize that since locks are dropped we're responsible for handling
| >> invalidation of objects, and perhaps that should be extended to "pn" a=
s well.
| >> --
| >> Michal Ostrowski
| >> mostrows@gmail.com
| >>
| >>
| >
| > Looking at this stuff, I do believe flush_lock protection is not
| > properly done.
| >
| > At the end of pppoe_connect() for example we can find :
| >
| > err_put:
| > =A0 =A0 =A0 =A0if (po->pppoe_dev) {
| > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_put(po->pppoe_dev);
| > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0po->pppoe_dev =3D NULL;
| > =A0 =A0 =A0 =A0}

Yep, this is unsafe, thanks!

| >
| > This is done without any protection, and can therefore clash with
| > pppoe_flush_dev() :
| >
| > =A0 =A0 =A0 =A0spin_lock(&flush_lock);
| > =A0 =A0 =A0 =A0po->pppoe_dev =3D NULL; /* ppoe_dev can already be NULL =
before this point */
| > =A0 =A0 =A0 =A0spin_unlock(&flush_lock);
| >
| > =A0 =A0 =A0 =A0dev_put(dev); =A0 =A0/* oops */
| >
|=20

Denys, could you check if the patch below help?

	-- Cyrill
---
 drivers/net/pppoe.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Index: linux-2.6.git/drivers/net/pppoe.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D--- linux-2.6.git.orig/drivers/net/pppoe.c
+++ linux-2.6.git/drivers/net/pppoe.c
@@ -312,9 +312,9 @@ static void pppoe_flush_dev(struct net_d
 			}
 			sk =3D sk_pppox(po);
 			spin_lock(&flush_lock);
+			dev_put(po->pppoe_dev);
 			po->pppoe_dev =3D NULL;
 			spin_unlock(&flush_lock);
-			dev_put(dev);
=20
 			/* We always grab the socket lock, followed by the
 			 * hash_lock, in that order.  Since we should
@@ -708,10 +708,12 @@ end:
 	release_sock(sk);
 	return error;
 err_put:
+	spin_lock(&flush_lock);
 	if (po->pppoe_dev) {
 		dev_put(po->pppoe_dev);
 		po->pppoe_dev =3D NULL;
 	}
+	spin_unlock(&flush_lock);
 	goto end;
 }
=20
