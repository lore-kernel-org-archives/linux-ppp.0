From: carlsonj@workingcode.com
Date: Fri, 15 Oct 2004 17:07:38 +0000
Subject: Re: absolutely baffled as to why PPP link doesn't allow pings
Message-Id: <16752.986.841043.41460@carlson.workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.60.0410151211340.11955@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.60.0410151211340.11955@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Robert P. J. Day writes:
> > Assuming that's right, try "noccp" on the Linux box.  I see that
> > you've negotiated CCP with the Deflate algorithm.  That never would
> > have happened when talking to a Windows system, and it's possible that
> > one side or the other has bugs with data compression.  The symptoms of
> > bugs there would be _exactly_ what you're now seeing.
> 
> ok, i'll give it a shot.  one of the things we did was loaded the
> "options" file on the host with every no-compression option we could
> find, since we initially suspected a problem with compression.  but
> we'll try it with just that additional option, thanks.

There are really only a couple of master options that control
compression:

	noaccomp	Disables HDLC address/control compression.
			When that compression mode is enabled, it
			saves 2 bytes per packet.

	nopcomp		Disables PPP Protocol Field compression.  When
			enabled, it saves 1 byte per data packet.

	novj		Disables VJ TCP/IP header compression.  When
			enabled, it can save around 38 bytes per
			packet.

	noccp		Disables CCP data compression.  These are the
			complex user data compression algorithms.
			Most are around a 50% compression ratio.

The first three are just header compression schemes and (except
perhaps with VJ compression) rarely run into trouble.  The last one is
the complex one, which uses a wide range of compression algorithms on
the user data.  Think of it as being like "gzip" or "compress," but
applied a packet at a time.  Bugs in various implementations are not
exactly unknown.  :-/

So, boiling that all down, "novj noccp" is the standard recipe to use
when one suspects that compression is running awry.

The rest of the options control the details of how compression
operates.  They normally shouldn't be touched, and turning them off
probably doesn't do what you want.

> since we have no /etc/ppp/options file on the embedded system (it's
> all crammed onto the call to pppd), i'll stick that into the options
> file on the host.  i'll let you know.  thanks.

It just needs to be configured on one side.

-- 
James Carlson                                 <carlsonj@workingcode.com>
