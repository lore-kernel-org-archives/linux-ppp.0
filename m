From: Christopher Fowler <cfowler@outpostsentinel.com>
Date: Tue, 08 Mar 2005 16:03:39 +0000
Subject: Re: IPCP ConfRej's forever
Message-Id: <1110297818.18073.128.camel@linux.linxdev.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1110253772.18073.91.camel@linux.linxdev.com>
In-Reply-To: <1110253772.18073.91.camel@linux.linxdev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I'm debating about upgrading to 2.4.3 on the remote end but I looked in
the ChangeLog that comes with the source and see nothing about this.  I
assumed that if it was a bug it was not fixed due to it not being listed
in the changeLog.

On Tue, 2005-03-08 at 10:58, Clifford Kite wrote:
> On Mon, 7 Mar 2005, Christopher Fowler wrote:
> 
> |I have two hosts that are configured to dial each other on demand.  
> |
> |One host is setup as 10.0.6.1:10.0.6.2 and the other as
> |192.168.5.6:192.168.5.7.  When the 10.0.6.1 sends the IPCP ConfReq
> |packet to request the remote accept the config of 10.0.6.1:10.0.6.2 it
> |is promptly rejected by the 192.168.5.6 machine.  This is totally
> |understandable since I did not provide the command line options
> |ipcp-allow-remote and ipcp-allow-local.  My problem is that when this
> |happens the ppp proces on 192.168.5.6 never terminates the connection. 
> |I get a stream of the folloing messages in syslog:
> |
> |Mar  7 22:14:23 dialup pppd[130]: rcvd [IPCP ConfReq id=0x52 <addrs
> |10.0.6.1 10.0.6.2>]
> |Mar  7 22:14:23 dialup pppd[130]: sent [IPCP ConfRej id=0x52 <addrs
> |10.0.6.1 10.0.6.2>]
> 
> <snip>
> 
> |Mar  7 22:14:26 dialup pppd[130]: sent [IPCP ConfReq id=0x10]
> |Mar  7 22:14:26 dialup pppd[130]: rcvd [IPCP ConfReq id=0x6d <addrs
> |10.0.6.1 10.0.6.2>]
> |Mar  7 22:14:26 dialup pppd[130]: sent [IPCP ConfRej id=0x6d <addrs
> |10.0.6.1 10.0.6.2>]
> |
> |
> |And it goes on forever and ever.  Should'nt there be a point where no
> |IPCP address could be negotiated and the remote terminate the
> |connection? 
> 
> First I'm not an expert, but this looks like the old-style IP addresses
> negotiation.  That is, pppd fell back to this after failing to complete
> IPCP with the normal IP address option.
> 
> Termination would seem to me to be appropriate after either side
> sends an IPCP request without any IP addresses that the other side
> accepts.
> 
> |Could this be version related?  The version that is on the remote is
> |2.4.1 and the version on local (10.0.6.1) is 2.4.2.
> 
> Neither version is doing what I would consider as the Right Thing.
> But, since 2.4.1 apparently doesn't accept the empty IPCP request
> *finally* sent by 2.4.2 (near the end above), the 2.4.1 version
> appears to be the worst offender.
> 
> ---
> Clifford Kite                                 http://ckite.no-ip.net
> 
> 
> 

