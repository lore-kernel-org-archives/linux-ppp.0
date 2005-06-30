From: Ray Van Dolson <rayvd@digitalpath.net>
Date: Thu, 30 Jun 2005 05:14:24 +0000
Subject: PPP Encapsulated in GRE with IP Precedence headers
Message-Id: <20050630051424.GA13477@digitalpath.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Background:
We are using Poptop + PPP/MPPE and are running some VoIP applications
over this and want to "prioritize" the voice traffic.  This is easily
done in a non-tunnelled environment because the voice protocol we are
using (RTP) sets the "Expedite Immediately" flag in the DSCP headers of
the IP packet.  Cisco routers and iptables/tc can be made to flag on
this and do the "right" thing (ie: prioritize).

However, when Poptop encapsulates the PPP frames into GRE, it does not
put any sort of DSCP flags in the corresponding GRE IP packets.  We are
hoping to have Poptop/pptpclient modified to unpack the PPP frame it
receives, examine the IP packet within and copy any DSCP flags into the
GRE IP packet.  Thus if the IP packet in question was RTP, the
resulting GRE packet would have the High Precedence DSCP flag set.

The question is, does PPP go haywire if packets start arriving out of
order as a result of this?  Would we end up being worse-off than if we
didn't do this at all?  I can see how a GRE-only tunnel would handle
this just fine, but the added layer of PPP makes me think any sort of
re-ordering of the GRE packets would break the PPP connection.

Thoughts?  Flames?

-- 
Ray Van Dolson
Linux/Unix Systems Administrator
Digital Path, Inc.
