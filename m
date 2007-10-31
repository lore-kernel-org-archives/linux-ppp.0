From: James Cameron <james.cameron@hp.com>
Date: Wed, 31 Oct 2007 00:48:00 +0000
Subject: Re: IPCP with mobile ISP sometimes gives bogus DNS address
Message-Id: <20071031004800.GH3609@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <fg82hb$nrp$1@ger.gmane.org>
In-Reply-To: <fg82hb$nrp$1@ger.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, Oct 30, 2007 at 05:32:19PM -0700, Bill Unruh wrote:
>> Oct  2 08:08:58 melech pppd[11052]: rcvd [LCP DiscReq id=0x2 
>> magic=0x4fafaf6]
>
> NO idea what DiskReq is.

LCP disconnection request.  I see it too on my 3G modem, when it is
working fine.  It seems to have no effect, and pppd ignores it.  It
would be annoying if it had an effect.

>> Oct  2 08:08:59 melech pppd[11052]: rcvd [IPCP ConfNak id=0x1 <ms-dns1 
>> 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 
>> 10.11.12.14>]
>
> He supplies you with those but also windows server addresses. And
> below he demands that you accept them. That is apparently a
> non-negotiable demand for him. Put in at least one, maybe 2
> ms-wins 0.0.0.0
> into your pppd options. He wants them for some insane reason. But an
> ISP's insanity must be catered to or he will go away in a snit.

Chuckle.  Agreed.  In this case, it is the firmware of the modem.  The
on-air radio protocol does not do PPP.

>> Oct  2 08:09:03 melech pppd[11052]: sent [IPCP ConfNak id=0x0 <addr 
>> 0.0.0.0>]
>> Oct  2 08:09:03 melech pppd[11052]: rcvd [IPCP ConfNak id=0x6 <addr 
>> 83.188.169.123>]
>
> He supplies you with an address, but by this time he is obviously
> sulking and goes away eventually.

I've heard said that the supplying of an address requires communication
over the radio link ... I've seen this step delayed.  Most of the other
responses are too fast to involve the radio link.

>> Log of success case:
>>
>> Oct  2 08:12:04 melech pppd[11589]: rcvd [IPCP ConfNak id=0x3 <addr 
>> 83.188.169.214> <ms-dns1 130.244.127.161> <ms-dns3 130.244.127.169>]
>
> OK, this time the remote machine does not insist on ms-wins. The ISP
> probably has a whole bunch of computers answering the phones, and some
> of them are more obnoxious than others.

It should be the same modem.  Presumably this means that the response of
the modem may depend in part on the data it has gathered over the radio
link.  It is closed-source firmware.

> Well, the remote guy should have also sent his IP but it does not
> matter.  It is only you that uses that IP address anyway, so whatever
> it is you know it.

I've had a few debates with people who think that the remote IP address
of the link should be something legitimate, but it really does not
matter.  pppd will work whatever the remote address is, as far as I can
tell.  The packets are not addressed to that remote address.  Point to
point routing is by device, not by IP address.

-- 
James Cameron
http://ftp.hp.com.au/sigs/jc/
