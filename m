From: Michal Ostrowski <mostrows@earthlink.net>
Date: Fri, 29 Dec 2006 13:28:24 +0000
Subject: Re: rp-pppoe requires PF_PACKET (Re: Help with PPPoE)
Message-Id: <1167398906.13060.65.camel@kdsk1.austin.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4594F417.9060000@freemail.gr>
In-Reply-To: <4594F417.9060000@freemail.gr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

PF_PACKET sockets are also required to be able to send/receive
raw ethernet frames in order to negotiate the PPPoE session, and thus
rp-pppoe depends on them.  It's not just a matter of getting the
interface number; PF_PACET sockets are integral to the functionality of
this plugin.

-- 
Michal Ostrowski <mostrows@earthlink.net>


On Fri, 2006-12-29 at 02:55 -0800, jfj wrote:
> Thanks for the confirmation (it is helpful!).
> 
> I found the problem and that is that rp-pppoe requires
> PF_PACKET sockets, which are disabled on my kenrel.
> 
> I'd really like to avoid this. It seems rp-pppoe uses
> packet sockets to get the inteface number. Anybody knows
> if this can be avoided with a bit of hacking?
> 
> Otherwise, we should mention that Kernel PPPoE depends
> on PF_PACKET :(
> And improve the error mesages of rp-pppoe.
> 
> jf.
> 
> Gilles Espinasse wrote:
> 
> >>Now when I type
> >>
> >>pppd eth0
> >>
> >>I get
> >>
> >>unrecognized option 'eth0'
> >>
> >>But wasn't the plugin supposed to enable this device?
> >>
> >>If I use this script in /etc/ppp/peers/mydsl
> >>
> >>#
> >># PPP over Ethernet options (using roaring pinguin external program)
> >>#
> >>plugin rp-pppoe.so
> >>    
> >>
> >It work for me with this exact line
> >plugin rp-pppoe.so eth0
> >...
> >Then you should be able to do
> >pppd call mydsl
> >
> >Gilles
> >
> >  
> >
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


