From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 14 Oct 2004 16:13:03 +0000
Subject: Re: even after PPP connection established, pings don't work
Message-Id: <Pine.LNX.4.60.0410141209460.22171@localhost.localdomain>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.60.0410141106110.21794@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.60.0410141106110.21794@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, 14 Oct 2004, Bill Unruh wrote:

> You need to give us detailed info ...

i realize i wasn't overly detailed, but the question was a fairly
generic one -- even if i don't use the "defaultroute" option when
creating the PPP link, should i (theoretically) still be able to ping
the IP address at the other end of the PPP link (given that the
routing table entry for that link should have the "UH" flags for a
host-specific entry?)

  as long as i'm convinced that what i'm doing *should* work, i'll
carry on with additional troubleshooting.

rday
