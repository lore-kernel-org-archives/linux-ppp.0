From: James Cameron <james.cameron@hp.com>
Date: Tue, 03 Feb 2004 22:11:05 +0000
Subject: Re: ppp-2.4.2 released
Message-Id: <20040203221105.GB8838@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
In-Reply-To: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, Feb 03, 2004 at 01:24:27PM +0200, Pasi K?rkk?inen wrote:
> The reason why www.yle.fi is not reducing the size, is that the size already
> is what the client told (mss+headers). I think so..

No, I disagree.  I'll repeat a critical aspect; the client CANNOT know
the right MTU for the path as a whole.  Sure, it knows the MTU of the
link next to it, and it will start a connection with an MSS that is
compatible with that ... but the client has no knowledge of the network
between the router (the pptp-server) and www.yle.fi.

e.g.

    www.yle.fi = router = router .. router = pptp-server -- client

    = is a link with MTU of 1500
    -- is a link with MTU of 1400
    .. is a link with MTU of  600

(I know this is not the case, I'm using it as an illustration of
principle).

Path MTU discovery overrides MSS in a TCP connection.  It must do, or
else a link somewhere else along the way with a small MTU would never be
handled properly.

Have you proved ICMP fragmentation needed packets have arrived at
www.yle.fi?  A packet trace at that host would be the proof.

> I think so too. but www.yle.fi web server doesn't want to go below
> mss (told by the client) + headers.

Just repeating myself; www.yle.fi MUST go below the client's MSS if
PMTUD results in a lower value.  As Frank said, the MTU might be
assymetric.  As I say, it might be that there's another restricted link.
The evidence you present leads me to suspect ICMP filtering.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
