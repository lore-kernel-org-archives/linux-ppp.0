From: Bill Unruh <unruh@physics.ubc.ca>
Date: Mon, 02 Feb 2004 21:55:37 +0000
Subject: Re: pppd not setting netmask
Message-Id: <Pine.LNX.4.50.0402021351260.8258-100000@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040130190514.GB16326@willow.seitz.com>
In-Reply-To: <20040130190514.GB16326@willow.seitz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, 2 Feb 2004, Ross Vandegrift wrote:

> > Ross Vandegrift writes:
> > 
> > > 	This is bad because the connected route that gets installed is
> > > for the opposite end of the tunnel (ie, 10.100.100.1/32) and not the
> > > route for the 10.100.100.0/30.  This confuses OSPF quite a bit (see my
> > > quagga-users thread with all the gorey OSPF details and routes:
> > > http://lists.quagga.net/pipermail/quagga-users/2004-January/001382.html)
> > 
> > The netmask has no meaning on a point-to-point interface.  If other
> > software isn't looking at the IFF_POINTOPOINT bit in the interface
> > flags, then I suggest you fix that other software.
> 
> Is this a technical issue, or a policy decision?  According to a recent
> HOWTO (http://sweb.cz/Frantisek.Rysanek/sync/dscc4+HDLC-Mini-HOWTO.html),
> the generic HDLC layer allows a netmask to be set on pointopoint
> interfaces (see the very first instance of 'ifconfig').  I don't have
> any HDLC hardware to actually test this with, though.

netmask makes no sense on a point to point device. It is point to
point-- one machine to one machine. This does not mean that you cannot
route other connections via that point to point link. You can route
anything you want, using the standard routing procedures in your OS.
Ie, even if the netmask were set it would not make any sense-- there is
only one machine at the other end of the link and everything has to go
through it. 

Why in the world would you want to insert routing code into ppp-- liable
to be buggy, inconsistant, etc-- when your ordinary routing code in the
system is perfectly capable of handling it. 


> 
> If it's a technical issue, are there things I can do to help?  My
> employer probably wouldn't mind me spending some time on this to have
> our tunnels work the way we assumed they would.

Just set up explicit routing of the other stuff you want to go through
the link.

> 
> If it's a policy decision, am I opening an ugly can of worms by trying
> to setup a network topology like this?
> 
