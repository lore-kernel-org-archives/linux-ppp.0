From: Bill Unruh <unruh@physics.ubc.ca>
Date: Thu, 02 Feb 2006 21:47:57 +0000
Subject: Re: EDGE modem gives error.. LCP: timeout sending config requests
Message-Id: <Pine.LNX.4.61.0602021341230.21576@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <BAD05164DBF6BF44AD171A36DBC6E77505DACA6A@pusehe0w.eh.pweh.com>
In-Reply-To: <BAD05164DBF6BF44AD171A36DBC6E77505DACA6A@pusehe0w.eh.pweh.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, 2 Feb 2006, Desai, Ankit (Export) wrote:

> Hi,

It is almost certainly never going to work. The other side, whatever it is
demands pap authentication, you refuse. They then refuse to allow you to
connect. End of story.

Why are you refusing to connect via pap?

You need an entry in /etc/ppp/pap-secrets and you need the 
user <username> 
option to pppd to let it know which of the lines in pap-secrets to use
(yes, you need it even if there is only  one line)


>
> I am trying to use EDGE wireless modem to create a ppp connection. The
> wireless modem is an embedded Multi-tech edge modem. The problem is: during
> connection, the modem spits out error message: LCP: timeout sending config
> requests.
>
> My /etc/ppp/options file as follows:
> -detach
> debug
> /dev/ttyS0
> connect '/usr/sbin/chat -v -V -t3 -f /etc/ppp/chat'
>
> My /etc/ppp/chat file is:
>
> ''		'AT'
> OK		'AT+CFUN=1'
> AT+CFUN		'\c'
> OK		'AT&F'
> AT&F		'\c'
> OK		'AT&D1'
> AT&D1   	'\c'
> OK		'AT+CGDCONT=1,"IP","proxy","",0,0'
> AT+CGDCONT 	'\c'
> TIMEOUT 30
> OK		'AT+CGREG=1'
> CGREG:\s1-\c-	'ATD*99***1#'
> CONNECT 	'\d\c'
>
> The weird part is those above two files work well with the EDGE PCMCIA modem
> (Cingular GC82) but they don't work with the Multitech embedded modem.

Those lines seem to work perfectly well with the Multitech as well. It is
not a modem problem. It is an authentication problem.

>
> Any help will be appreciated.
>
> The debug message is as follows:

Send the whole message including the timestamps. They can often give
information. (In this case they are not really needed as far as I can tell.

>
> Perms of /dev/ttyS0 are ok, no 'mesg n' neccesary.
> AT
> OK
> AT+CFUN=1
> OK
> AT&F
> OK
> AT&D1
> OK
> AT+CGDCONT=1,"IP","proxy","",0,0
> OK
> AT+CGREG=1
> OK
> ATD*99***1#
> CONNECTSerial connection established.
> using channel 24
> Using interface ppp0
> Connect: ppp0 <--> /dev/ttyS0
> rcvd [LCP ConfReq id=0x4 <mru 1600> <auth pap> <magic 0x5cd90830> <asyncmap

They request pap

> 0x0> <pcomp> <accomp>]
> sent [LCP ConfReq id=0x1 <magic 0xdf5ba0ae> <pcomp> <accomp>]
> sent [LCP ConfRej id=0x4 <mru 1600> <auth pap> <asyncmap 0x0>]

You refuse pap

> rcvd [LCP ConfAck id=0x1 <magic 0xdf5ba0ae> <pcomp> <accomp>]
> rcvd [LCP ConfReq id=0x5 <auth pap> <magic 0x5cd90830> <pcomp> <accomp>]

They request it,

> sent [LCP ConfRej id=0x5 <auth pap>]

You refuse it.

This continues about 1000 times until they finally give up.

<rest of boring negotiation removed.>

So set up your system to use pap.


