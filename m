From: Marcos Dione <mdione@fcq.unc.edu.ar>
Date: Wed, 07 Jun 2006 16:07:53 +0000
Subject: Re: (4 ADSL lines)
Message-Id: <20060607130753.vl9n0ydx4lz4ws0o@webmail.fcq.unc.edu.ar>
List-Id: <linux-ppp.vger.kernel.org>
References: <17536.56952.835156.343138@cargo.ozlabs.ibm.com>
In-Reply-To: <17536.56952.835156.343138@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Quoting Paul Mackerras <paulus@samba.org>:
> This patch might help.  It adds an option for the rp-pppoe pppd plugin
> that lets you specify that pppd should only listen to one specific
> ethernet MAC address.  You should then be able to run 4 instances of
> pppd on the one machine, all using the one ethernet NIC on that
> machine, and give each instance of pppd the ethernet MAC address of
> one of the 4 ADSL modems.  I haven't tested this sort of setup myself,
> so let me know if this helps.  The new option is called "pppoe-mac"
> and takes one argument, the MAC address formatted as xx:xx:xx:xx:xx:xx.

  I tried the patch today. It applies ok, but then it doesn't compile. here=
's
the error I got:

cc -O2 -g -I../../../include/linux '-DVERSION=3D"3.3"' -c -o pppoe-discover=
y.o
pppoe-discovery.c
pppoe-discovery.c: In function 'main':
pppoe-discovery.c:77: error: too few arguments to function 'discovery'
make[4]: *** [pppoe-discovery.o] Error 1

  indeed, that line reads:

    ...
    discovery(conn);
    ...

  it's not a grave bug. I'll be trying the patch anyway today. I hope to ha=
ve
news soon.

--=20
Marcos Dione
Departamento de C=F3mputos
Facultad de Ciencias Qu=EDmicas - UNC

----------------------------------------------------------------
Facultad de Ciencias Qu=C3micas - Universidad Nacional de C=C3rdoba

