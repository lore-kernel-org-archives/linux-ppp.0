From: Tomas Lund <tlund@nxs.se>
Date: Sun, 20 Mar 2011 11:23:18 +0000
Subject: Re: Huawei E398 4G/LTE USB-modem - IPCP fails under pppd 2.4.5
Message-Id: <Pine.LNX.4.61.1103181456350.12352@envy.nxs.se>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.61.1103181230280.12352@envy.nxs.se>
In-Reply-To: <Pine.LNX.4.61.1103181230280.12352@envy.nxs.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Fri, 18 Mar 2011, James Carlson wrote:

> Ah, 4G. That's difficult.

The difference between how PS works in 2G/3G/4G is not really that big, 
its mostly the name of the boxes and the interfaces that change :)

> Typically, with 4G-type devices, this means that either the 
> authentication failed or that the phone isn't properly registered with 
> the network.

Autentication is disabled in the network and you should be able to send 
anything you want. Access is allowed by the MME and the PGW based on the 
IMSI and configuration made in the HSS.

>> In windows, I am running the application that comes with the modem to 
>> connect, and I have collected a sniff of the serial port between the 
>> modem and windows where IPCP works and posted it at 
>> http://tlund.pp.se/ppp/windows_ppp_sniff.txt
>
> That shows a blank (!) user name being sent.
>
>> I suspect that Huawei PPP/IPCP implementation in the modem requires it 
>> to be done JUST the way that their application does it, instead of just 
>> following the relevant RFC:s.
>
> Possibly so.  It may require some experimentation to figure out just 
> what it wants to see.

I was hoping it should be possible to figure out exactly what the Huawei 
windows application does differently from what pppd does based on my 
sniff. :)

>> I am willing to provide any additional details that might be needed, do 
>> additional sniffing and try any patches or config changes you might 
>> have.
>
> Try using this:
>
> 	user ""
>
> and adjust /etc/ppp/chap-secrets to match.

I tried that, and it made no difference. I also went back to the windows 
box and entered a username/password to see what happened, and it made no 
difference there either.

However, after moving it back to the linux box again, I found someting 
curious! The defined PDP-contexts in the modem (as shown by AT+CGDCONT?) 
was all empty! (possibly removed by doing AT&F, not verified yet)

In my chat-script I always overwrite the APN-name based on what IMSI the 
SIM-card has (i use alot of different dongles and SIM-cards and move them 
around alot), so .. just on a whim, I quickly edited the script not to do 
this, and just go ahead and sedn ATDT*99# anyways, without an APN set.

Success!

I do not yet understand why or how, but this magically worked. :)

I am going to sniff the control-plane of the MME and the SGW to see what 
actually happens in the PDP set-up signaling.

Best regards,
Tomas
