From: Charlie Brady <charlieb-linux-ppp@budge.apana.org.au>
Date: Thu, 13 Jan 2011 14:02:27 +0000
Subject: Re: ppp / open vpn
Message-Id: <Pine.LNX.4.64.1101130901490.6986@e-smith.charlieb.ott.istop.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <W90767349010091294791641@webmail30>
In-Reply-To: <W90767349010091294791641@webmail30>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


On Thu, 13 Jan 2011, tony.chamberlain@lemko.com wrote:

> So how do I set up the ptp instead of topology mode?
> Is that ethernet bridging, which was the only option I saw?
> Or do I even want to change from topology?

You'll have to ask an OpenVPN forum.

> 
> -----Original Message-----
> From: Jan Just Keijser [mailto:jan.just.keijser@gmail.com]
> Sent: Wednesday, January 12, 2011 07:47 PM
> To: 'James Carlson'
> Cc: tony.chamberlain@lemko.com, linux-ppp@vger.kernel.org
> Subject: Re: ppp / open vpn
> 
> James Carlson wrote:
> > On 01/12/11 16:17, Jan Just Keijser wrote:
> >   
> >> James Carlson wrote:
> >>     
> >>> The whole point of a point-to-point interface (of any type; PPP, tunnel,
> >>> or otherwise) is that it connects two distinct IP nodes.  Distinct.  Not
> >>> one IP node to itself!
> >>>
> >>>   
> >>>       
> >> This is another trick of OpenVPN to assign "linear addresses" to clients
> >> while using a PtP (tun) interface. It is enabled in OpenVPN 2.1 (and
> >> openvpnas, which is based  on 2.1) by using the
> >>  topology subnet
> >> directive.
> >>     
> >
> > That's simply frightening.  Thanks for the update; I had no idea anyone
> > was relying on that sort of undocumented OS feature.
> >
> > Good luck getting a routing protocol to work reliably with that ...
> >
> >   
> actually, this mode is not used in combination with routing protocols. 
> 'topology subnet' is used primarily when multiple clients are connecting 
> to a single server. OpenVPN also support a "point-to-point" mode (for 
> lack of a better term), which does follow the regular PtP semantics. 
> Running a routing protocol in that mode is just as easy as running one 
> over a ppp-based link.
> 
> HTH,
> 
> JJK
> 
> 
> 
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
