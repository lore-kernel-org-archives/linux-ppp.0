From: Ross Vandegrift <ross@willow.seitz.com>
Date: Mon, 02 Feb 2004 20:14:42 +0000
Subject: Re: pppd not setting netmask
Message-Id: <20040202201442.GA5211@willow.seitz.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040130190514.GB16326@willow.seitz.com>
In-Reply-To: <20040130190514.GB16326@willow.seitz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

> Ross Vandegrift writes:
> 
> > 	This is bad because the connected route that gets installed is
> > for the opposite end of the tunnel (ie, 10.100.100.1/32) and not the
> > route for the 10.100.100.0/30.  This confuses OSPF quite a bit (see my
> > quagga-users thread with all the gorey OSPF details and routes:
> > http://lists.quagga.net/pipermail/quagga-users/2004-January/001382.html)
> 
> The netmask has no meaning on a point-to-point interface.  If other
> software isn't looking at the IFF_POINTOPOINT bit in the interface
> flags, then I suggest you fix that other software.

Is this a technical issue, or a policy decision?  According to a recent
HOWTO (http://sweb.cz/Frantisek.Rysanek/sync/dscc4+HDLC-Mini-HOWTO.html),
the generic HDLC layer allows a netmask to be set on pointopoint
interfaces (see the very first instance of 'ifconfig').  I don't have
any HDLC hardware to actually test this with, though.

If it's a technical issue, are there things I can do to help?  My
employer probably wouldn't mind me spending some time on this to have
our tunnels work the way we assumed they would.

If it's a policy decision, am I opening an ugly can of worms by trying
to setup a network topology like this?

-- 
Ross Vandegrift
ross@willow.seitz.com

A Pope has a Water Cannon.                               It is a Water Cannon.
He fires Holy-Water from it.                        It is a Holy-Water Cannon.
He Blesses it.                                 It is a Holy Holy-Water Cannon.
He Blesses the Hell out of it.          It is a Wholly Holy Holy-Water Cannon.
He has it pierced.                It is a Holey Wholly Holy Holy-Water Cannon.
He makes it official.       It is a Canon Holey Wholly Holy Holy-Water Cannon.
Batman and Robin arrive.                                       He shoots them.
