From: Bill Unruh <unruh@physics.ubc.ca>
Date: Tue, 30 Dec 2003 18:49:28 +0000
Subject: Re: help with PPP and RH 9 external modem
Message-Id: <Pine.LNX.4.50.0312301047080.19140-100000@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <16369.39445.600544.576631@h006008986325.ne.client2.attbi.com>
In-Reply-To: <16369.39445.600544.576631@h006008986325.ne.client2.attbi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, 29 Dec 2003, Mike Rosenlof wrote:

> 
> Folks,
> modem dials, then nothing.  Debug info follows...
> 
> Debug output logging gives me the following:
> 
> ------------
> Dec 29 16:03:37 Mike modprobe: modprobe: Can't locate module ppp0

Try modprobe ppp
befor you you run this.
See if the file /dev/ppp
exits.

> Dec 29 16:03:37 Mike modprobe: modprobe: Can't locate module ppp0
> Dec 29 16:03:37 Mike pppd[4283]: pppd 2.4.1 started by root, uid 0
> Dec 29 16:03:37 Mike modprobe: modprobe: Can't locate module ppp0
> Dec 29 16:03:37 Mike pppd[4283]: using channel 1
> Dec 29 16:03:37 Mike pppd[4283]: Using interface ppp0
> Dec 29 16:03:37 Mike pppd[4283]: Connect: ppp0 <--> /dev/ttyS1
> Dec 29 16:03:37 Mike pppd[4283]: sent [LCP ConfReq id=0x1 <asyncmap
> 0x0> <magic
> 0x8867dfe6> <pcomp> <accomp>]


> Dec 29 16:04:04 Mike last message repeated 9 times

The far side is not answering. You have not told us what the far side is
nor how you are contacting them.

See
www.theory.physics.ubc.ca/ppp-linux.html for step by step guide to
debugging ppp.

> Dec 29 16:04:07 Mike pppd[4283]: Terminating on signal 15.
> Dec 29 16:04:07 Mike pppd[4283]: sent [LCP TermReq id=0x2 "User
> request"]
> Dec 29 16:04:10 Mike pppd[4283]: sent [LCP TermReq id=0x3 "User
> request"]
> Dec 29 16:04:13 Mike pppd[4283]: Connection terminated.
> Dec 29 16:04:13 Mike pppd[4283]: Exit.
>  --------------
> 
> lsmod includes the following
> 
> -----------
> Module                  Size  Used by    Not tainted
> usb-storage            66048   1 
> ppp_async               8960   0  (autoclean)
> ppp_generic            22588   0  (autoclean) [ppp_async]
> ------------
> 
> modules.conf includes the following:
> 
> -------
> alias /dev/ppp		ppp_generic
> alias char-major-108	ppp_generic
> alias tty-ldisc-3	ppp_async
> alias tty-ldisc-14	ppp_synctty
> alias ppp-compress-21	bsd_comp
> alias ppp-compress-24	ppp_deflate
> alias ppp-compress-26	ppp_deflate
> ----------
> 
> 
> 
> 
> ==> Mike Rosenlof
> Louisville, Colorado, USA
> 
> __________________________________
> Do you Yahoo!?
> New Yahoo! Photos - easier uploading and sharing.
> http://photos.yahoo.com/
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
