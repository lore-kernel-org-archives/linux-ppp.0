From: Frank Cusack <fcusack@fcusack.com>
Date: Tue, 03 Feb 2004 16:25:55 +0000
Subject: Re: ppp-2.4.2 released
Message-Id: <20040203082555.A14463@google.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
In-Reply-To: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, Feb 03, 2004 at 05:10:38PM +0200, Pasi K?rkk?inen wrote:
> OK. The problem is that www.yle.fi is not the only site showing
> this problem. There are many others too.

Yeah, lots of sites don't handle PMTU-D correctly. :(

> I wonder what the right(tm) solution is.. (this problem does not happen with
> microsoft pptp-server also running mppe).

MS pptp-server is broken for ppp though.  It sends frames that are too
large (>MTU).  This will break some pppd's.  Maybe I can work up a patch
in the next few days.  Don't hold your breath, though.

/fc
