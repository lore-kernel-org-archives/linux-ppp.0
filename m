From: Christopher Fowler <cfowler@outpostsentinel.com>
Date: Tue, 08 Mar 2005 17:27:03 +0000
Subject: Re: IPCP ConfRej's forever
Message-Id: <1110302823.18073.144.camel@linux.linxdev.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1110253772.18073.91.camel@linux.linxdev.com>
In-Reply-To: <1110253772.18073.91.camel@linux.linxdev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Te remote is a locked down device.  It is an embedded device running
Linux.  each ppp profile is tied to a port.  The profile determines what
command line options pppd is executed with.

In one case our FC2 server will dial in with ipaddresses that the remote
needs to accept.  In the other case a Windows laptop will dial-in
requesting remote ip addresses.

When testnig command line arguments I found this problem of when a
server dials in and tries wants to use addresses that are not configured
for that profile then this forever loop occurs.  since all this happens
over dial-up a misconfiguration on the users part in the profile will
cause a very high phone bill since the remote nor the server terminate
since they can not agree on the correct addresses to use.

 

On Tue, 2005-03-08 at 11:22, Clifford Kite wrote:
> On Mon, 7 Mar 2005, Bill Unruh wrote:
> 
> |On Mon, 7 Mar 2005, Christopher Fowler wrote:
> |
> |> I have two hosts that are configured to dial each other on demand.
> |>
> |> One host is setup as 10.0.6.1:10.0.6.2 and the other as
> |> 192.168.5.6:192.168.5.7.  When the 10.0.6.1 sends the IPCP ConfReq
> |
> |Why would you have both set both local and remote IP AND have them be
> |incompatible? This makes no sense. Why not put both on the same address
> |range?
> |
> |Either have just one or have each set their own local but not remote IP.
> 
> He might want the dialed-to peer to be able to access a LAN through the
> dial-out peer?
> 
> ---
> Clifford Kite                                 http://ckite.no-ip.net
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

