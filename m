From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 18 Mar 2011 13:11:13 +0000
Subject: Re: Huawei E398 4G/LTE USB-modem - IPCP fails under pppd 2.4.5
Message-Id: <4D8359F1.4070900@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.61.1103181230280.12352@envy.nxs.se>
In-Reply-To: <Pine.LNX.4.61.1103181230280.12352@envy.nxs.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Tomas Lund wrote:
> I have a Huawei E398 4G/LTE USB-modem where IPCP fails under pppd 2.4.5
> but works in Windows.

Ah, 4G.  That's difficult.

> Mar 18 12:16:04 localhost pppd[18558]: sent [IPCP ConfReq id=0x1 <addr
> 0.0.0.0>]
> Mar 18 12:16:05 localhost pppd[18558]: rcvd [IPCP ConfNak id=0x1]

Typically, with 4G-type devices, this means that either the
authentication failed or that the phone isn't properly registered with
the network.

What happens here (and it's really just cell-phone brain-damage; nobody
else does it this way) is that the PPP server you're talking to sends
back a fake "success" message regardless of what credentials you offer,
and it delays actually doing the authentication work until you start IPCP.

When you start IPCP, the PPP server sends your credentials to a central
system that either responds with the IP address you should use, which
the PPP server then sends back to you.  If authentication fails, though,
the PPP server wigs out (I think that's the technical term ;-}) and
starts sending garbage.

Some of these systems will send back a bogus, unusable "default" IP
address.  Some will hang up the call.  Some will terminate LCP or IPCP.
 It seems that this one sends a thoroughly bogus IPCP Configuration-Nak
that lacks any options.

I guess once you walk away from one part of the standard as written, you
might as well go completely nuts.  ;-}

Anyway, check your configured user name / passphrase.  Make sure that
any special characters in the passphrase are escaped properly.

> In windows, I am running the application that comes with the modem to
> connect, and I have collected a sniff of the serial port between the
> modem and windows where IPCP works and posted it at
> http://tlund.pp.se/ppp/windows_ppp_sniff.txt

That shows a blank (!) user name being sent.

> I suspect that Huawei PPP/IPCP implementation in the modem requires it
> to be done JUST the way that their application does it, instead of just
> following the relevant RFC:s.

Possibly so.  It may require some experimentation to figure out just
what it wants to see.

> I am willing to provide any additional details that might be needed, do
> additional sniffing and try any patches or config changes you might have.

Try using this:

	user ""

and adjust /etc/ppp/chap-secrets to match.

That seems to be what the peer wants.  If that doesn't work, someone
with access to the hardware (possibly you) will have to tinker around
with the code to see what might work.

I doubt it's something that could be done effectively at a distance.  I
probably don't have the time to do it, but perhaps someone else on the
list does ...

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
