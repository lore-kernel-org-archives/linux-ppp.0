From: Pieter Loubser <ploubser@multenet.com>
Date: Thu, 07 Sep 2006 06:45:07 +0000
Subject: Re: serial device access from welcome script
Message-Id: <1157611507.30188.136.camel@io.sanpeople.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200609061445.20406.thilo@riessner.de>
In-Reply-To: <200609061445.20406.thilo@riessner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Have you removed the "lock" option from your ppp options file
(/etc/ppp/options)?



> >From a program called by the welcome script which tries to access the serial 
> port (in this case /dev/ttyI0) I get the errormessage:
> 	Port or socket open error!
> I guess, that the serial port is blocked by the pppd.
> Is there any possibility to access the serial port nevertheless?
> Thanks for any help
> 
> Thilo
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

