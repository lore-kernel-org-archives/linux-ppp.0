From: Edgard Lima <edgard.lima@gmail.com>
Date: Sat, 28 Jul 2012 14:17:20 +0000
Subject: Re: DCD and EOF
Message-Id: <CAK9rZUBpS3qbDbKshfmYpt6uPs9mY804Bn985f9VeZbKpGdeoA@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAK9rZUB745VY28ptj29dNDCXVGg0CAF3H0_iDZoTkbpNwQmA9A@mail.gmail.com>
In-Reply-To: <CAK9rZUB745VY28ptj29dNDCXVGg0CAF3H0_iDZoTkbpNwQmA9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

>
> Are you observing that pppd is not noticing when DCD gets deasserted?

Yep, it wasn't and for that reason it delayed a bit till reconnect. To
tell you the truth, I'm not 100% confident the serial driver was fine
and the modem was correctly configured with something like AT&C1

To make it work as expected I did some changes by hand on pppd code do
access the GPIO connected to DCD modem pin and close the connection.

> If so, what kernel version are you using (I presume it's Linux since
> you're asking on the linux-ppp mailing list), and what version of pppd?

pppd version 2.4.3 and linux version 2.4.19

But now Im porting my whole system to pppd 2.4.5 (latest) and linux 2.6.37


Lets suppose I have my serial driver sending EOF and DCD is detected.
How fast will PPPD will close and redial ? Do you have some advises
about patches I could apply to PPPD or configuration parameters to set
to speedup this process ?

And, I would like to also make the first connection faster (basically
gprs and possibly a line modem), could we please give me some tips how
could I do that? Something like try to patch to skip some steps, or
even configurations parameters would be worth to try to fine tune?

Thanks again and best regards

>
> Paul.



-- 
Edgard Lima
http://EdgardLima.com
http://www.linkedin.com/in/edgardlima
edgard.lima@gmail.com
