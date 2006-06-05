From: Marcos Dione <mdione@fcq.unc.edu.ar>
Date: Mon, 05 Jun 2006 14:29:56 +0000
Subject: Re: 4 adsl lines in one nic
Message-Id: <20060605112956.isxirfbgsduskswk@webmail.fcq.unc.edu.ar>
List-Id: <linux-ppp.vger.kernel.org>
References: <20060602131035.sdpe7qwh59c084ow@webmail.fcq.unc.edu.ar>
In-Reply-To: <20060602131035.sdpe7qwh59c084ow@webmail.fcq.unc.edu.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Quoting Michal Ostrowski <mostrows@earthlink.net>:
> Ah... do you know if you are even using the kernel-assisted pppoe?  I
> assume that is not the case.

  I really don't know. I don't see any loaded module except these:

$ lsmod
Module                  Size  Used by
ppp_deflate             5664  0
zlib_deflate           20536  1 ppp_deflate
bsd_comp                5376  0
ppp_async               9952  4
crc_ccitt               1952  1 ppp_async
ppp_generic            25844  19 ppp_deflate,bsd_comp,ppp_async
slhc                    6240  1 ppp_generic

--=20
Marcos Dione
Departamento de C=F3mputos
Facultad de Ciencias Qu=EDmicas - UNC

----------------------------------------------------------------
Facultad de Ciencias Qu=C3micas - Universidad Nacional de C=C3rdoba

