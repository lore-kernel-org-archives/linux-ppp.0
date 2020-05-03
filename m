From: =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date: Sun, 03 May 2020 10:31:51 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <CAPJ9Yc8eDBsGtFy_juZ3Z6biKKD4-JoNg0icv4otHK=o66aBZw@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Wed, 22 Apr 2020 at 19:45, David Bala=C5=BEic <xerces9@gmail.com> wrote:
>
> Hi!
>
> I have a router running openwrt connected to a GPON ONT, running a
> PPPoE connection (hw details below).
>
> The problem is, that after some random time one to 20 hours, the
> connection breaks. Then in about a minute it reconnects (successfully,
> each time).

Mystery solved.

I added a debug output to kernel pppoe.c:

pr_info("pppoe: pppoe_disc_rcv /my patch/  PADT received, sid=3D%d, SRC:
%02x:%02x:%02x:%02x:%02x:%02x, DST: %02x:%02x:%02x:%02x:%02x:%02x\n",
ph->sid,
eth_hdr(skb)->h_source[0],
eth_hdr(skb)->h_source[1],
eth_hdr(skb)->h_source[2],
eth_hdr(skb)->h_source[3],
eth_hdr(skb)->h_source[4],
eth_hdr(skb)->h_source[5],
eth_hdr(skb)->h_dest[0],
eth_hdr(skb)->h_dest[1],
eth_hdr(skb)->h_dest[2],
eth_hdr(skb)->h_dest[3],
eth_hdr(skb)->h_dest[4],
eth_hdr(skb)->h_dest[5]
);

When the problem happens, it prints:

pppoe: pppoe_disc_rcv /my patch/  PADT received, sid=3D1, SRC:
a4:7b:2c:9e:c7:44, DST: 44:4e:6d:fd:c7:39

My HWaddr is c4:xxxxxx:ed

After that, the pppoe module closes the connection.

So the problem was as already suspected, that pppoe does not properly
check if the received PADT packet belongs to its ppp session.

I'll patch it up soon (if someone does not beat me to it).

Regards,
David
