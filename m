From: James Chapman <jchapman@katalix.com>
Date: Mon, 30 Jul 2007 11:14:16 +0000
Subject: Re: build #309 failed for 2.6.23-rc1-gd941cf5 in linux/drivers/net/pppol2tp.c
Message-Id: <46ADC808.204@katalix.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200707272022.50619.toralf.foerster@gmx.de>
In-Reply-To: <200707272022.50619.toralf.foerster@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Hi Toralf,

Toralf F=F6rster wrote:
> Hello,
>=20
> the build with the attached .config failed, make ends with:
> ...
>   CC      arch/i386/lib/usercopy.o
>   AR      arch/i386/lib/lib.a
>   GEN     .version
>   CHK     include/linux/compile.h
>   UPD     include/linux/compile.h
>   CC      init/version.o
>   LD      init/built-in.o
>   LD      .tmp_vmlinux1
> drivers/built-in.o: In function `pppol2tp_getsockopt':
> pppol2tp.c:(.text+0x454dd): undefined reference to `udp_prot'
> drivers/built-in.o: In function `pppol2tp_setsockopt':
> pppol2tp.c:(.text+0x46771): undefined reference to `udp_prot'
> drivers/built-in.o: In function `pppol2tp_sendmsg':
> pppol2tp.c:(.text+0x4753d): undefined reference to `ip_queue_xmit'
> drivers/built-in.o: In function `pppol2tp_xmit':
> pppol2tp.c:(.text+0x47a64): undefined reference to `ip_queue_xmit'
> make: *** [.tmp_vmlinux1] Error 1

I don't understand how udp_prot or ip_queue_xmit could ever be=20
undefined. 2.6.23-rc1 builds just fine for me. Is this the standard=20
kernel from kernel.org?

--=20
James Chapman
Katalix Systems Ltd
http://www.katalix.com
Catalysts for your Embedded Linux software development

