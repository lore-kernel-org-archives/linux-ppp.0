From: "Miguel-Munoz" <miguelmunoz@sepsa.es>
Date: Wed, 15 Sep 2004 13:05:43 +0000
Subject: Re: Multiple I/O on a serial device
Message-Id: <003e01c49b24$edc0a5d0$08330680@sepsa.es>
List-Id: <linux-ppp.vger.kernel.org>
References: <41483B26.7040708@alphalink.fr>
In-Reply-To: <41483B26.7040708@alphalink.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Hi,

Now, I=B4m just trying to do something like this.
Somebody told me that you can use PTYs (pseudo terminals).
You can look in man: "openpty" and "forkpty".
The question is to do a simple task that create a pseudo-terminal.
This PTY is like a pipe; on one end you see the pipe, and on
the other you see a virtual ttySxx, where you can attach pppd.
After this, the new task can read from the other end and
decide if put the data to a real ttySxx.

Please, if you are suceed on it, let me know.

Miguel
----- Original Message -----=20
From: "Nicolas Olivier" <nolivier@alphalink.fr>
To: <linux-ppp@vger.kernel.org>
Sent: Wednesday, September 15, 2004 2:52 PM
Subject: Multiple I/O on a serial device


>
> Hello,
>
> I'm trying to setup multiple instances of locals ppp in order to test a
L2TP daemon.
> The problem, is that once ppp sets up the line discipline nothing can be
read from or
> written to the associated serial device. So I was wondering if there was
an easy way
> to do multiple I/O on a serial, or maybe "link" I/O of two serials.
> If anyone has suggestions, it would be greatly appreciated.
>
> Nicolas Olivier
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

