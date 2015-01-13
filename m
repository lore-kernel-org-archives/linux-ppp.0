From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 13 Jan 2015 20:30:12 +0000
Subject: Re: ppp_async: ioctl to set MTU needed
Message-Id: <54B58054.6040602@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <54B556D0.5090204@mirix.org>
In-Reply-To: <54B556D0.5090204@mirix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 01/13/15 12:33, Matthias-Christian Ott wrote:
> Some months ago I filed the following bug report (with some sentences
> corrected) on the Kernel Bug Tracker but have received no reaction
> reaction so far:
> 
> Summary: ppp_async: ioctl to set MTU needed

It would be nice to see complete configuration options and a trace or
debug log of the problem.  I followed what you posted, but being 100%
sure of the scenario and the issues is pretty important when trying to
talk about fixes.

Have you tried just setting the pppd "mtu" option?  That should force
pppd to set an MTU of that value (unless the peer's MRU is even smaller).

I realize that's not a perfect fix.  A perfect fix would have some
mechanism for the underlying transport to signal changes in effective
MTU (e.g., Path MTU data) so that this value could be altered at the
network layer as needed.  Unfortunately, there's currently no such
mechanism, as far as I know.

> As a workaround I patched pppd and sent a Configure-Nak with the correct
> MRU in the options of the packet in the hope that the remote peer would
> adjust its MRU to the MRU suggested in the Configure-Nak and that the
> PPP driver would in turn set the MTU of the channel correctly. However,
> this didn't work because the remote peer simply sent the original
> Configure-Request again and again without adjusting its MRU.
> Unfortunately, I don't know which PPP implementation the remote peer uses.

I would have been surprised if that had worked.  Sending a Configure-Nak
for a smaller MRU is (to me, at least) a nonsense request.  The peer's
offer of a "too large" MRU is just fine and should be accepted.  You're
under no obligation ever to send a packet as large as the maximum your
peer may be willing to accept, so the local MTU can be lower than the
peer's MRU.  It really only makes sense to negotiate the peer's MRU
upwards, not downwards, and then only *if* the advertised value is too
small for the desired purpose of the link and if there's some hope that
it'll either comply or fail in a manner that makes sense to the user.

So, yes, ignoring your request for a smaller MRU sounds like the
behavior of a somewhat reasonable (or not entirely wrong) peer.  Better
still would be to omit the option on subsequent Configure-Request
messages, and thus insist on the default.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
