From: Paul Mackerras <paulus@samba.org>
Date: Tue, 03 Feb 2004 04:32:18 +0000
Subject: Re: pppd not setting netmask
Message-Id: <16415.9298.20280.578433@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040130190514.GB16326@willow.seitz.com>
In-Reply-To: <20040130190514.GB16326@willow.seitz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Ross Vandegrift writes:

> Is this a technical issue, or a policy decision?  According to a recent
> HOWTO (http://sweb.cz/Frantisek.Rysanek/sync/dscc4+HDLC-Mini-HOWTO.html),
> the generic HDLC layer allows a netmask to be set on pointopoint
> interfaces (see the very first instance of 'ifconfig').  I don't have
> any HDLC hardware to actually test this with, though.

It's a technical issue.  The decisions about which interface to use to
send a given IP packet are made based on the routing table rather than
the interface local address (except that if the packet is addressed to
the local address of any interface, it's effectively sent via
loopback).  When an interface is brought up, an entry is put into the
routing table.  The netmask is used at that time for non
point-to-point interfaces, and becomes the netmask for the route.  For
a point-to-point interface, the route that gets added is a host route,
and so the netmask is irrelevant (you can set whatever netmask you
like, it doesn't change anything).

> If it's a technical issue, are there things I can do to help?  My
> employer probably wouldn't mind me spending some time on this to have
> our tunnels work the way we assumed they would.

It's probably as simple as a couple of 'ip route' commands in your
ip-up script.  What are you trying to achieve?

Paul.
