From: "Miguel-Munoz" <miguelmunoz@sepsa.es>
Date: Thu, 22 Jul 2004 09:11:36 +0000
Subject: Re: pppd and AT+WMUX(Multiplex mode)
Message-Id: <001301c46fcb$ec299990$08330680@sepsa.es>
List-Id: <linux-ppp.vger.kernel.org>
References: <loom.20040721T163210-958@post.gmane.org>
In-Reply-To: <loom.20040721T163210-958@post.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Continuing with the same issue...
I=B4m trying to do the same with the same modem.
I=B4m thinking in use a 'virtual' ttyS, changing the device driver.
So I would have a point where I could extarct the headers
(data or commands), almost from the port.
Am I wrong?

Thanks

Miguel

----- Original Message -----=20
From: <carlsonj@workingcode.com>
To: "Simon Chow" <simonchow@keytechsys.com.hk>
Cc: <linux-ppp@vger.kernel.org>
Sent: Wednesday, July 21, 2004 5:44 PM
Subject: Re: pppd and AT+WMUX(Multiplex mode)


> Simon Chow writes:
> > I am researching how to handle the AT packets and Data packets offered
by
> > the Wavecom GSM modem in AT+WMUX=3D1 mode. I want to modify the pppd
programme
> > and I think that the tty.c in pppd may be the key to change. The
charshunt
> > function manipulates both the raw bytes sent from and received by the
serial
> > port. However, I am still in an initial stage.
>
> I don't think that analysis is right.  The charshunt task is invoked
> only in a few cases (e.g., where the 'record', 'notty', or 'socket'
> options are used), and isn't the normal data path.  The normal data
> path is in the kernel, not user space.
>
> > I wonder if the pppd tool can handle the multiplex mode offered by
Wavecom
> > GSM modem. Thanks.
>
> Not today.  I think you'd have to modify the PPP modules in the Linux
> kernel to detect the switching mechanism and feed the data up to pppd
> first.  Otherwise, it'll probably be handled as bad PPP frames and
> discarded.
>
> --=20
> James Carlson                                 <carlsonj@workingcode.com>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

