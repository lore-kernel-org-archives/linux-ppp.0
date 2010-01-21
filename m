From: "Leslie Rhorer" <lrhorer@satx.rr.com>
Date: Thu, 21 Jan 2010 15:19:28 +0000
Subject: RE: pppd hangs on SIGHUP
Message-Id: <2B.D9.01403.870785B4@cdptpa-omtalb.mail.rr.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <8D.DA.01403.892965B4@cdptpa-omtalb.mail.rr.com>
In-Reply-To: <8D.DA.01403.892965B4@cdptpa-omtalb.mail.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



> -----Original Message-----
> From: linux-ppp-owner@vger.kernel.org [mailto:linux-ppp-
> owner@vger.kernel.org] On Behalf Of James Carlson
> Sent: Thursday, January 21, 2010 6:40 AM
> To: Leslie Rhorer
> Cc: linux-ppp@vger.kernel.org
> Subject: Re: pppd hangs on SIGHUP
> 
> Leslie Rhorer wrote:
> > 2875: /usr/sbin/pppd call cricket
> > (No symbols found)
> > 0xb7f14424: ???? (8, 2, 808e580, bff2eaa8, 97aeea0, 97aeeb8)
> > 0x08069654: ???? (8, ffffffff)
> > 0x0806d751: ???? (807bee4, 0, 0, bff2eaf8, 808b884, ffffffff)
> > 0x08062ca9: ???? (0, 0, 0, 806656f, 80813ae, 807c098) + 10
> > 0x0805164b: ???? (80905e0, 80905e4, c, b3b, 0, c) + b0
> > 0x0805226f: ???? (807bc70, 804f930, bff2ec38, b7d50455, 3, bff2ec64) +
> 50
> > 0xb7d50455: ???? (8051890, 3, bff2ec64, 807bc70, 807bc60, b7f23250) +
> > 400d13a8
> 
> Compiling pppd first with "-g" would probably have been a good idea.

	I'll try re-compiling it.

> It looks like this is a system call on fd 8, which is the modem device:
> 
> > pppd       2875       root    8u      CHR      166,0               4814
> > /dev/ttyACM0
> 
> ... but that's just a guess.
> 
> > 	I am not deeply familiar with Linux.  What is a good debugger
> > available for it, preferably from a Debian mirror?
> 
> The GNU debugger 'gdb' is decent.

	I'll scarf it.

