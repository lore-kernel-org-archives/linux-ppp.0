From: James Cameron <james.cameron@hp.com>
Date: Tue, 03 Feb 2004 22:01:21 +0000
Subject: Re: ppp-2.4.2 released
Message-Id: <20040203220121.GA8838@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
In-Reply-To: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, Feb 03, 2004 at 08:25:55AM -0800, Frank Cusack wrote:
> MS pptp-server is broken for ppp though.  It sends frames that are too
> large (>MTU).  This will break some pppd's.  Maybe I can work up a patch
> in the next few days.  Don't hold your breath, though.

If you need motivation, section 3.3.4 of RFC1812 says that a router (in
this case pppd) SHOULD be willing to receive a packet as large as the
maximum frame size even if that is larger than the MTU.

http://www.faqs.org/rfcs/rfc1812.html

It then goes on to say ...

      If a network is using an MTU smaller than the maximum frame size
      for the Link Layer, a router may receive packets larger than the
      MTU from misconfigured and incompletely initialized hosts.  The
      Robustness Principle indicates that the router should successfully
      receive these packets if possible.

I've no idea what supercedes RFC1812.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
