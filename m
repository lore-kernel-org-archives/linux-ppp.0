From: "Simon Chow" <simonchow@keytechsys.com.hk>
Date: Fri, 23 Jul 2004 08:47:28 +0000
Subject: Re: pppd and AT+WMUX(Multiplex mode)
Message-Id: <cdqjku$68j$1@sea.gmane.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <loom.20040721T163210-958@post.gmane.org>
In-Reply-To: <loom.20040721T163210-958@post.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

<carlsonj@workingcode.com> wrote in message
news:16638.36676.350168.813237@carlson.workingcode.com...
> Simon Chow writes:
> > I am researching how to handle the AT packets and Data packets offered
by
> > the Wavecom GSM modem in AT+WMUX=1 mode. I want to modify the pppd
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
> -- 
> James Carlson                                 <carlsonj@workingcode.com>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


How about I modify the ppp_async_input function in ppp_async.c to detect the
0xAA and 0xDD, and the ppp_async_push function to encapsulate the PPP frame
with 0xDD?



