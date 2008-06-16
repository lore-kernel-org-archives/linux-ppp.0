From: "Gustavo Fernando Padovan" <gfpadovan@gmail.com>
Date: Mon, 16 Jun 2008 12:54:01 +0000
Subject: Re: possible bug on ppp_async
Message-Id: <6b53b1990806160554n66217fb1rd6a6b3f4b1da167@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <6b53b1990806091123l74a06bebu34160ad08366d1a8@mail.gmail.com>
In-Reply-To: <6b53b1990806091123l74a06bebu34160ad08366d1a8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Fri, Jun 13, 2008 at 4:38 PM, Alan Cox <alan@redhat.com> wrote:
> On Fri, Jun 13, 2008 at 03:01:52PM -0300, Gustavo Fernando Padovan wrote:
>> > The problem seems the ioctl TCSETS, with the patch (and on kernel
>> > 2.6.23) it returns immediately, and on kernel 2.6.24 (without the
>> > patch) it goes to tty_mode_ioctl().
>
> That is a fix for a long standing bug. It makes TCSETS/TCGETS work correc=
tly
> on a ppp session.  So the bug is in your user space code somewhere it app=
ears
> and just happens to be triggered by fixing other bugs.
I tested with other dialer and all works fine now. The bug was in the
dialer wvdial.
Sorry for inconvenience.
>
>



--=20
----------------------------------------------
Gustavo Fernando Padovan
Engenharia de Computa=E7=E3o 2006
LAS - Laborat=F3rio de Administra=E7=E3o e Seguran=E7a de Sistemas
Instituto de Computa=E7=E3o - UNICAMP

gfpadovan@gmail.com
ra061316@students.ic.unicamp.br
pao@jabber.org
-------------------------------------------

Seja Livre, use Software Livre
