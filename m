From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 14 Jan 2005 11:37:27 +0000
Subject: pedantic observation about PPP 2.4.3 Makefile
Message-Id: <Pine.LNX.4.61.0501140633210.18956@localhost.localdomain>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


  i find it a bit inconsistent that, in the PPP-2.4.3 pppd/Makefile,
WRT respect to filtering, near the top of that makefile, there is the
variable definition

  FILTER=y

which *suggests* that you can set this to either "y" or "n", but
further down, the test for filtering is simply:

  ifdef FILTER

naturally, this means you can call the makefile with FILTER=n and,
because it's technically defined, it will try to build in filtering.

  this can be a bit confusing.  shouldn't the use of binary variables
be more consistent in their usage?

rday
