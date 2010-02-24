From: walter harms <wharms@bfs.de>
Date: Wed, 24 Feb 2010 09:02:34 +0000
Subject: Re: wrong return code in pppd 2.4.5
Message-Id: <4B84EB2A.80708@bfs.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <4B73C880.2040100@bfs.de>
In-Reply-To: <4B73C880.2040100@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



I did not hear anything concerning the bug below. Any hints ?
Do i need to report somewhere else ?

re,
 wh


walter harms schrieb:
> I found this bug in ppp 2.4.5 (Source:ftp://ftp.samba.org/pub/ppp/ppp-2.4.5.tar.gz).
> 
> After idle the pppd should return with 12 (idle timeout) but does return with 16 (hang up).
> (see log below)
> 
> Is this a known problem ? Is there a patch available ?
> 
> re,
>  wh
> 
> 
> 
> /var/log/messages:
> 
> ....
> Feb 10 11:02:51 mws3-94700737 daemon.notice pppd[1716]: Terminating connection due to lack of activity.
> Feb 10 11:02:51 mws3-94700737 daemon.info pppd[1716]: Connect time 1.4 minutes.
> Feb 10 11:02:51 mws3-94700737 daemon.info pppd[1716]: Sent 3090 bytes, received 3869 bytes.
> Feb 10 11:02:51 mws3-94700737 daemon.debug pppd[1716]: Script /etc/ppp/ip-down started (pid 1751)
> Feb 10 11:02:51 mws3-94700737 daemon.debug pppd[1716]: sent [LCP TermReq id=0x2 "Link inactive"]
> Feb 10 11:02:51 mws3-94700737 daemon.debug pppd[1716]: Script /etc/ppp/ip-down finished (pid 1751), status = 0x0
> Feb 10 11:02:54 mws3-94700737 daemon.debug pppd[1716]: sent [LCP TermReq id=0x3 "Link inactive"]
> Feb 10 11:02:57 mws3-94700737 daemon.notice pppd[1716]: Connection terminated.
> Feb 10 11:02:58 mws3-94700737 daemon.notice pppd[1716]: Modem hangup
> Feb 10 11:02:58 mws3-94700737 daemon.info pppd[1716]: Exit.
> Feb 10 11:02:58 mws3-94700737 user.notice root: pppd terminated with: 16
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
