From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 27 Jan 2005 13:52:33 +0000
Subject: suggestion for enhancement to current PPP makefile
Message-Id: <Pine.LNX.4.61.0501270850330.4788@localhost.localdomain>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


  not sure if this is the right place for this, but would it be
possible to enhance the overall makefile for PPP to include a
${DESTDIR} optional variable for all installation commands as a prefix
to the absolute directory names?

  that way, it would be a snap to "install" PPP in a root filesystem
structure that would be the basis for an embedded system.

  just my $0.02.

rday
