From: Bill Unruh <unruh@physics.ubc.ca>
Date: Wed, 31 Oct 2007 00:32:19 +0000
Subject: Re: IPCP with mobile ISP sometimes gives bogus DNS address
Message-Id: <Pine.LNX.4.64.0710301441330.21200@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <fg82hb$nrp$1@ger.gmane.org>
In-Reply-To: <fg82hb$nrp$1@ger.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, 30 Oct 2007, Marcus Better wrote:

> Hi,
>
> I am connecting to the Swedish mobile ISP Tele2 with PPP using a
> Huawei 3G modem. The PPP link is started, but very often (perhaps half the time or
> more) it ends up assigning bogus DNS addresses 10.11.12.13 and
> 10.11.12.14 which cannot be reached. At other times I get name servers
> with public IPs that do work.
>
> After checking logs from a number of attempts, the following pattern emerges:
> pppd on my side sends up to five (=ipcp-max-failure) IPCP ConfReqs,
> the first with blank info and the remaining like this:
>
> Oct  2 08:08:59 melech pppd[11052]: sent [IPCP ConfReq id=0x2 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
>
> If it receives a ConfReq from the other side before that point,
> everything works out correctly. If not, then pppd starts sending
> empty ConfReqs from id=0x6 and on:
>
> Oct  2 08:09:03 melech pppd[11052]: sent [IPCP ConfReq id=0x6 <addr 0.0.0.0>]
>
> That makes the other end send only an IP address at the end:
>
> Oct  2 08:09:03 melech pppd[11052]: rcvd [IPCP ConfAck id=0x8 <addr 83.188.169.123>]
>
> In the success case, it sends both IP address and DNS settings:
>
> Oct  2 08:12:04 melech pppd[11589]: rcvd [IPCP ConfAck id=0x4 <addr 83.188.169.214> <ms-dns1 130.244.127.161> <ms-dns3 130.244.127.169>]
>
> I'm not able to make much more of the logs below, perhaps someone can tell
> what's going on?
>
> This was also reported to the Debian bug tracking system [1].
>
> Regards,
>
> Marcus
>
> [1] http://bugs.debian.org/cgi-bin/bugreport.cgi?bugD5951
>
>
>
> Log of failure case:
>
> Oct  2 08:08:57 melech pppd[11052]: Serial connection established.
> Oct  2 08:08:57 melech pppd[11052]: using channel 3
> Oct  2 08:08:57 melech pppd[11052]: Using interface ppp0
> Oct  2 08:08:57 melech pppd[11052]: Connect: ppp0 <--> /dev/3gmodem
> Oct  2 08:08:58 melech pppd[11052]: sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x260e3aa4> <pcomp> <accomp>]

You request and asyncmap of 0 and pcomp and acomp.

> Oct  2 08:08:58 melech pppd[11052]: rcvd [LCP ConfReq id=0x0 <asyncmap 0x0> <auth chap MD5> <magic 0x4fafaf6> <pcomp> <accomp>]

He requests ans asyncmap of 0 pcomp acomp and requests that you
authenticate using chap MD5.

> Oct  2 08:08:58 melech pppd[11052]: sent [LCP ConfNak id=0x0 <auth pap>]

You refuse chapMD5 but suggest pap. Note that this is rarely a good idea.
You should be willing to use what the isp wants. In this case however it is
OK as he agrees, but often the ISP does not. What the ISP wants, the ISP
must get, or you go down in flames.


> Oct  2 08:08:58 melech pppd[11052]: rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0x260e3aa4> <pcomp> <accomp>]

He agrees to your asyncmap pcomp and accomp.

> Oct  2 08:08:58 melech pppd[11052]: rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <auth pap> <magic 0x4fafaf6> <pcomp> <accomp>]

He changes his request to pap. Note again he was under absolutely no
obligation to do so.


> Oct  2 08:08:58 melech pppd[11052]: sent [LCP ConfAck id=0x1 <asyncmap 0x0> <auth pap> <magic 0x4fafaf6> <pcomp> <accomp>]

You agree.

> Oct  2 08:08:58 melech pppd[11052]: sent [PAP AuthReq id=0x1 user="melech" password=<hidden>]

You send your credentials.

> Oct  2 08:08:58 melech pppd[11052]: rcvd [LCP DiscReq id=0x2 magic=0x4fafaf6]

NO idea what DiskReq is.

> Oct  2 08:08:58 melech pppd[11052]: rcvd [PAP AuthAck id=0x1 ""]

He says your credentials are OK.

> Oct  2 08:08:58 melech pppd[11052]: PAP authentication succeeded
> Oct  2 08:08:58 melech pppd[11052]: sent [IPCP ConfReq id=0x1 <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]

You request that he supply you with an IP address and two dns server
addresses.


> Oct  2 08:08:59 melech pppd[11052]: rcvd [IPCP ConfNak id=0x1 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]

He supplies you with those but also windows server addresses. And below he
demands that you accept them. That is apparently a non-negotiable demand
for him. 
Put in at least one, maybe 2
ms-wins 0.0.0.0
into your pppd options. He wants them for some insane reason. But an ISP's
insanity must be catered to or he will go away in a snit.


> Oct  2 08:08:59 melech pppd[11052]: sent [IPCP ConfReq id=0x2 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]

You say OK you will use the dns, but refuse to use the wins.

> Oct  2 08:09:00 melech pppd[11052]: rcvd [IPCP ConfNak id=0x2 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]

He insists.

> Oct  2 08:09:00 melech pppd[11052]: sent [IPCP ConfReq id=0x3 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]

You again decline, and eventually the two discussions peter out and you go
your separate ways.


> Oct  2 08:09:01 melech pppd[11052]: rcvd [IPCP ConfNak id=0x3 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
> Oct  2 08:09:01 melech pppd[11052]: sent [IPCP ConfReq id=0x4 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
> Oct  2 08:09:02 melech pppd[11052]: rcvd [IPCP ConfNak id=0x4 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
> Oct  2 08:09:02 melech pppd[11052]: sent [IPCP ConfReq id=0x5 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
> Oct  2 08:09:03 melech pppd[11052]: rcvd [IPCP ConfNak id=0x5 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
> Oct  2 08:09:03 melech pppd[11052]: sent [IPCP ConfReq id=0x6 <addr 0.0.0.0>]
> Oct  2 08:09:03 melech pppd[11052]: rcvd [IPCP ConfReq id=0x0]
> Oct  2 08:09:03 melech pppd[11052]: sent [IPCP ConfNak id=0x0 <addr 0.0.0.0>]
> Oct  2 08:09:03 melech pppd[11052]: rcvd [IPCP ConfNak id=0x6 <addr 83.188.169.123>]

He supplies you with an address, but by this time he is obviously sulking
and goes away eventually.


> Oct  2 08:09:03 melech pppd[11052]: sent [IPCP ConfReq id=0x7]
> Oct  2 08:09:03 melech pppd[11052]: rcvd [IPCP ConfNak id=0x7 <addr 83.188.169.123>]
> Oct  2 08:09:03 melech pppd[11052]: sent [IPCP ConfReq id=0x8 <addr 83.188.169.123>]
> Oct  2 08:09:03 melech pppd[11052]: rcvd [IPCP ConfAck id=0x8 <addr 83.188.169.123>]
> Oct  2 08:09:04 melech pppd[11052]: rcvd [IPCP ConfReq id=0x1]
> Oct  2 08:09:04 melech pppd[11052]: sent [IPCP ConfAck id=0x1]
> Oct  2 08:09:04 melech pppd[11052]: Could not determine remote IP address: defaulting to 10.64.64.64
> Oct  2 08:09:04 melech pppd[11052]: Cannot determine ethernet address for proxy ARP
> Oct  2 08:09:04 melech pppd[11052]: local  IP address 83.188.169.123
> Oct  2 08:09:04 melech pppd[11052]: remote IP address 10.64.64.64
> Oct  2 08:09:04 melech pppd[11052]: primary   DNS address 10.11.12.13
> Oct  2 08:09:04 melech pppd[11052]: secondary DNS address 10.11.12.14
> Oct  2 08:09:04 melech pppd[11052]: Script /etc/ppp/ip-up started (pid 11065)
>
>
> Log of success case:
>
> Oct  2 08:12:00 melech pppd[11589]: Serial connection established.
> Oct  2 08:12:00 melech pppd[11589]: using channel 4
> Oct  2 08:12:00 melech pppd[11589]: Using interface ppp0
> Oct  2 08:12:00 melech pppd[11589]: Connect: ppp0 <--> /dev/3gmodem
> Oct  2 08:12:01 melech pppd[11589]: sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x8d65e535> <pcomp> <accomp>]
> Oct  2 08:12:01 melech pppd[11589]: rcvd [LCP ConfReq id=0x3 <asyncmap 0x0> <auth chap MD5> <magic 0x4fdc5be> <pcomp> <accomp>]
> Oct  2 08:12:01 melech pppd[11589]: sent [LCP ConfNak id=0x3 <auth pap>]
> Oct  2 08:12:01 melech pppd[11589]: rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0x8d65e535> <pcomp> <accomp>]
> Oct  2 08:12:01 melech pppd[11589]: rcvd [LCP ConfReq id=0x4 <asyncmap 0x0> <auth pap> <magic 0x4fdc5be> <pcomp> <accomp>]
> Oct  2 08:12:01 melech pppd[11589]: sent [LCP ConfAck id=0x4 <asyncmap 0x0> <auth pap> <magic 0x4fdc5be> <pcomp> <accomp>]
> Oct  2 08:12:01 melech pppd[11589]: sent [PAP AuthReq id=0x1 user="melech" password=<hidden>]
> Oct  2 08:12:01 melech pppd[11589]: rcvd [LCP DiscReq id=0x5 magic=0x4fdc5be]
> Oct  2 08:12:01 melech pppd[11589]: rcvd [PAP AuthAck id=0x1 ""]
> Oct  2 08:12:01 melech pppd[11589]: PAP authentication succeeded
> Oct  2 08:12:01 melech pppd[11589]: sent [IPCP ConfReq id=0x1 <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
> Oct  2 08:12:02 melech pppd[11589]: rcvd [IPCP ConfNak id=0x1 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
> Oct  2 08:12:02 melech pppd[11589]: sent [IPCP ConfReq id=0x2 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
> Oct  2 08:12:03 melech pppd[11589]: rcvd [IPCP ConfNak id=0x2 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
> Oct  2 08:12:03 melech pppd[11589]: sent [IPCP ConfReq id=0x3 <addr 0.0.0.0> <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
> Oct  2 08:12:04 melech pppd[11589]: rcvd [IPCP ConfReq id=0x2]
> Oct  2 08:12:04 melech pppd[11589]: sent [IPCP ConfNak id=0x2 <addr 0.0.0.0>]
> Oct  2 08:12:04 melech pppd[11589]: rcvd [IPCP ConfNak id=0x3 <addr 83.188.169.214> <ms-dns1 130.244.127.161> <ms-dns3 130.244.127.169>]

OK, this time the remote machine does not insist on ms-wins. The ISP
probably has a whole bunch of computers answering the phones, and some of
them are more obnoxious than others.


> Oct  2 08:12:04 melech pppd[11589]: sent [IPCP ConfReq id=0x4 <addr 83.188.169.214> <ms-dns1 130.244.127.161> <ms-dns3 130.244.127.169>]
> Oct  2 08:12:04 melech pppd[11589]: rcvd [IPCP ConfAck id=0x4 <addr 83.188.169.214> <ms-dns1 130.244.127.161> <ms-dns3 130.244.127.169>]
> Oct  2 08:12:05 melech pppd[11589]: rcvd [IPCP ConfReq id=0x3]
> Oct  2 08:12:05 melech pppd[11589]: sent [IPCP ConfAck id=0x3]
> Oct  2 08:12:05 melech pppd[11589]: Could not determine remote IP address: defaulting to 10.64.64.64

Well, the remote guy should have also sent his IP but it does not matter.
It is only you that uses that IP address anyway, so whatever it is you know
it.


> Oct  2 08:12:05 melech pppd[11589]: Cannot determine ethernet address for proxy ARP
> Oct  2 08:12:05 melech pppd[11589]: local  IP address 83.188.169.214
> Oct  2 08:12:05 melech pppd[11589]: remote IP address 10.64.64.64
> Oct  2 08:12:05 melech pppd[11589]: primary   DNS address 130.244.127.161
> Oct  2 08:12:05 melech pppd[11589]: secondary DNS address 130.244.127.169
>
>
> /etc/ppp/peers/tele2-3g:
> -----------------------------------
> 3gmodem 921600
> connect '/usr/sbin/chat -v -f /etc/ppp/tele2-3g.chat'
> noipdefault
> novj
> noccp
> noauth
> local
> defaultroute
> usepeerdns
> debug
> ----------------------------------
>
>
> /etc/ppp/tele2-3g.chat:
> ----------------------------------
> TIMEOUT 5
> ABORT "NO CARRIER"
> ABORT "NO DIALTONE"
> ABORT "NO ANSWER"
> ABORT "BUSY"
> "" ATZ
> OK AT+CPIN 00
> TIMEOUT 2
> OK-AT-OK AT+CGDCONT=1,"IP","internet.tele2.se"
> TIMEOUT 5
> OK ATDT*99***1#
> CONNECT
> ----------------------------------
>
> /etc/ppp/options is the default, with the following appended:
> -------------
> deflate 12
> bsdcomp 12
> predictor1
> -------------
>
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
