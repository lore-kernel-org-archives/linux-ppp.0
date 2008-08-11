From: Bill Unruh <unruh@physics.ubc.ca>
Date: Mon, 11 Aug 2008 00:06:09 +0000
Subject: Re: How to fix continuous ConfReq's on celluar internet connection
Message-Id: <Pine.LNX.4.64.0808101628590.10395@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <489F746B.3040002@123mail.org>
In-Reply-To: <489F746B.3040002@123mail.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Sun, 10 Aug 2008, Marshall Crocker wrote:

> Hi all,
>
> For over a year now I've been having problems with ConfReq's resetting my ppp 
> connection to my cellular EvDO internet provider.  I can connect with no 
> problems but usually the connection will only stay up for a few minutes 
> (sometimes a few seconds) before I receive a ConfReq.  I think the ConfReq is 
> sent because I'm in a fringe area of service and my connection is switching 
> between EvDO (3G broadband speeds) and 1xRTT (144 Kbps 2.5G).  It may also be 
> that I'm between two towers and the connection is bouncing between the two 
> thereby requiring my host to reconfigure.
>
> The biggest problem with this behavior is that the ppp0 interface is brought 
> down after the ConfReq is received.  Any TCP connections that were in 
> progress get closed.  In Windows, the connection is reconfigured but either 
> the interface isn't completely brought down or a "no route to host" isn't 
> sent  for each open connection and the packets just get dropped during the 
> reconfigure and then retransmitted once the connection comes back up so 
> actions such as browsing  web pages only get stalled briefly.
>
> So my questions are
>
> 1) Has anyone else seen this behavior or is it specific to my internet 
> provider?
>
> 2) Is there some pppd option that I'm missing that could solve this problem?
>
> 3) Should I block these ConfReq's once the connection is established using 
> iptables or some other method?  I assume not since the tower may drop my 
> connection if my host doesn't respond.
>
> 4) Maybe I could hack pppd to not bring the connection down during 
> reconfiguration/reauthenication if the connection details are the same (i.e. 
> same local and ptp ip addresses, same dns, etc. )?
>
> I know there is a firmware update to my EvDO card (a Kyocera KPC650) which 
> will allow you to "lock" in a tower and technology (EvDO or 1xRTT) but I 
> don't think it will work in linux unless the KPC650 command and control 
> protocol has been decoded.  It may be possible to do the "lock" from the 
> windows client and then the card stays locked but I don't know.
>
> Any help is greatly appreciated as I have been stuck using XP and ICS instead 
> of putting my EvDO card in my soekris router.
>
> Below is a snip from the pppd debug log.  I can also provide the windows ppp 
> log if that would help.

Don't remove the timing information from the log ( or perpahs you are not
giving the syslog output
Put
local2.*;daemon.*     /var/log/ppplog
into /etc/syslog.conf
and then do 
killall -1 syslogd

(do not forget the -1)
)

You could also try disabling echo req. Perhaps that it triggering the far
end to dump the connection.




>
> Thanks,
> Marshall
>
> local  IP address X.X.X.X
> remote IP address X.X.X.X
> primary   DNS address X.X.X.X
> secondary DNS address X.X.X.X
> Script /etc/ppp/ip-up started (pid 15676)
> Script /etc/ppp/ip-up finished (pid 15676), status = 0x1
> rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <auth pap> <magic 0xdd5ce74b>]
> Connect time 0.3 minutes.
> Sent 1115 bytes, received 778 bytes.
> Script /etc/ppp/ip-down started (pid 15685)
> sent [LCP ConfReq id=0x8e <asyncmap 0x0> <magic 0x6a4b56c2> <pcomp> 
> <accomp>]
> sent [LCP ConfAck id=0x1 <asyncmap 0x0> <auth pap> <magic 0xdd5ce74b>]
> rcvd [LCP ConfAck id=0x8e <asyncmap 0x0> <magic 0x6a4b56c2> <pcomp> 
> <accomp>]
> sent [LCP EchoReq id=0x0 magic=0x6a4b56c2]
> sent [PAP AuthReq id=0xb2 user="XXXXX@cs3g.com" password=<hidden>]
> Script /etc/ppp/ip-down finished (pid 15685), status = 0x0
> rcvd [LCP EchoRep id=0x0 magic=0xdd5ce74b]
> rcvd [PAP AuthAck id=0xb2 ""]
> PAP authentication succeeded
> sent [IPCP ConfReq id=0x57 <compress VJ 0f 01> <addr X.X.X.X> <ms-dns1 
> 0.0.0.0> <ms-dns3 0.0.0.0>]
> rcvd [IPCP ConfReq id=0x1 <addr X.X.X.X>]
> sent [IPCP ConfAck id=0x1 <addr X.X.X.X>]
> rcvd [IPCP ConfRej id=0x57 <compress VJ 0f 01>]
> sent [IPCP ConfReq id=0x58 <addr X.X.X.X> <ms-dns1 0.0.0.0> <ms-dns3 
> 0.0.0.0>]
> rcvd [IPCP ConfNak id=0x58 <ms-dns1 X.X.X.X> <ms-dns3 X.X.X.X>]
> sent [IPCP ConfReq id=0x59 <addr X.X.X.X> <ms-dns1 X.X.X.X> <ms-dns3 
> X.X.X.X>]
> rcvd [IPCP ConfAck id=0x59 <addr X.X.X.X> <ms-dns1 X.X.X.X> <ms-dns3 
> X.X.X.X>]
> Cannot determine ethernet address for proxy ARP
> local  IP address X.X.X.X
> remote IP address X.X.X.X
> primary   DNS address X.X.X.X
> secondary DNS address X.X.X.X
> Script /etc/ppp/ip-up started (pid 15691)
> Script /etc/ppp/ip-up finished (pid 15691), status = 0x1
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
