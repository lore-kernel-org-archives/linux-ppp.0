From: "Gustavo Fernando Padovan" <gfpadovan@gmail.com>
Date: Fri, 13 Jun 2008 18:01:52 +0000
Subject: Re: possible bug on ppp_async
Message-Id: <6b53b1990806131101o2c2d0845pc9acf9696a267886@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <6b53b1990806091123l74a06bebu34160ad08366d1a8@mail.gmail.com>
In-Reply-To: <6b53b1990806091123l74a06bebu34160ad08366d1a8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Wed, Jun 11, 2008 at 5:55 PM, Gustavo Fernando Padovan
<gfpadovan@gmail.com> wrote:
> On Mon, Jun 9, 2008 at 6:03 PM, Alan Cox <alan@redhat.com> wrote:
>> On Mon, Jun 09, 2008 at 03:23:33PM -0300, Gustavo Fernando Padovan wrote:
>>> The problem occurs when the execution enters on switch's default case
>>> and call tty_mode_ioctl() and the cmd is not TCGETS or cmd is not
>>> TCGETA. I don't know why this happens, but happens. On kernel 2.6.23
>>
>> Which ioctl is making it go silly ?
>>
>>> tty_mode_ioctl(). This is the unique real change between the two
>>> versions, the others are only code restructuring. Then I made this
>>> patch to revert part of changes and make modem works again. I don't
>>> know if this is correct. I just put the modem to work.
>>
>> It's very useful as we now know what change has had the effect, but not
>> what your pppd is doing which is breaking it (and thus where the real bug
>> may lie)
>>
>>> --- a/drivers/net/ppp_async.c.     2008-06-09 13:12:25.000000000 -0300
>>> +++ b/drivers/net/ppp_async.c      2008-06-09 13:15:57.000000000 -0300
>>> @@ -309,6 +309,11 @@
>>>                 err =3D 0;
>>>                 break;
>>>
>>> +       case TCGETS:
>>> +       case TCGETA:
>>> +               err =3D tty_mode_ioctl(tty, file, cmd, arg);
>>> +               break;
>>> +
>>>         case TCFLSH:
>>>                 /* flush our buffers and the serial port's buffer */
>>>                 if (arg =3D TCIOFLUSH || arg =3D TCOFLUSH)
>>> @@ -324,8 +329,7 @@
>>>                 break;
>>>
>>>         default:
>>> -               /* Try the various mode ioctls */
>>> -               err =3D tty_mode_ioctl(tty, file, cmd, arg);
>>> +               err =3D -ENOIOCTLCMD;
>>
>> Can you add a printk to log which ioctl calls end up here and what they
>> return (both with/without the patch). That should give the needed info to
>> identify what is being done and returned which then breaks it.
>
> I made two tries to connect with and without the patch. The tries are
> separated by a blank line.
>
> Debug without the patch:
>  [ 5955.465357] cmd =3D 21506 (TCSETS)
>  [ 5955.465369] err =3D 0
>  [ 5955.465372] ----------
>
>  [ 5987.058871] TCGETS
>  [ 5987.059094] err =3D 0
>  [ 5987.059276] ----------
>  [ 5987.059645] TCGETS
>  [ 5987.059786] err =3D 0
>  [ 5987.059863] ----------
>  [ 5987.060008] cmd =3D 21534 (TIOCGSERIAL)
>  [ 5987.060117] err =3D -515     (-ENOIOCTLCML)
>  [ 5987.060194] ----------
>  [ 5987.060283] cmd =3D 21506
>  [ 5987.060371] err =3D 0
>  [ 5987.060444] ----------
>  [ 5987.110619] cmd =3D 21506
>  [ 5987.110760] err =3D 0
>  [ 5987.110836] ----------
>  [ 5987.110949] cmd =3D 21506
>  [ 5987.111037] err =3D 0
>  [ 5987.111109] ----------
>  [ 5987.111192] TCGETS
>  [ 5987.111272] err =3D 0
>  [ 5987.111345] ----------
>  [ 6000.334483] cmd =3D 21506
>  [ 6000.334494] err =3D 0
>  [ 6000.334496] ----------
>
> Debug with the patch:
> [ 8207.865204] cmd =3D 21506 (TCSETS)
> [ 8207.865213] err =3D -515
> [ 8207.865215] ----------
>
> [ 8866.939075] cmd =3D 21506
> [ 8866.939084] err =3D -515
> [ 8866.939086] ----------
>
> The problem seems the ioctl TCSETS, with the patch (and on kernel
> 2.6.23) it returns immediately, and on kernel 2.6.24 (without the
> patch) it goes to tty_mode_ioctl().

This patch also resolves the 'bug'. It intercepts TCSETS on
switch(cmd) and return -ENOIOCTLCMD;


--- a/drivers/net/ppp_async.c        2008-06-13 11:59:10.000000000 -0300
+++ b/drivers/net/ppp_async.c     2008-06-13 11:58:34.000000000 -0300
@@ -323,6 +323,10 @@
                err =3D 0;
                break;

+    case TCSETS:
+        err =3D -ENOIOCTLCMD;
+        break;
+
        default:
                /* Try the various mode ioctls */
                err =3D tty_mode_ioctl(tty, file, cmd, arg);


>
>>
>> From that I can work out what is going on and what the right fix may be.
>>
>> Alan
>>
>>
>
>
>
> --
> ----------------------------------------------
> Gustavo Fernando Padovan
> Engenharia de Computa=E7=E3o 2006
> LAS - Laborat=F3rio de Administra=E7=E3o e Seguran=E7a de Sistemas
> Instituto de Computa=E7=E3o - UNICAMP
>
> gfpadovan@gmail.com
> ra061316@students.ic.unicamp.br
> pao@jabber.org
> -------------------------------------------
>
> Seja Livre, use Software Livre
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
