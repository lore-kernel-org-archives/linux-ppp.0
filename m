From: James Cameron <james.cameron@hp.com>
Date: Thu, 10 Jun 2004 04:43:46 +0000
Subject: Re: 2.4.2 on AMD64 Linux: assumes 4-byte long - FIXED!
Message-Id: <20040610044346.GK17654@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040606021936.14c69b54@localhost>
In-Reply-To: <20040606021936.14c69b54@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Guy,

Yes, Mandrake's kernel source includes MPPE support, and the kernel.org
sources do not.  Other distributions also add MPPE support in this way;
Debian and SUSE included.  Red Hat do not.

I know Debian get their kernel-patch-mppe package from PPP CVS.  I
suspect Mandrake and SUSE did as well.  You should check that the
sources match what is in PPP CVS.  To get PPP CVS onto your system,

	cd /usr/src  # (or some other reasonable directory)
	cvs -d :pserver:cvs@pserver.samba.org:/cvsroot co ppp/linux/mppe

If you've made changes to drivers/net/sha1.{c,h} and Mandrake got these
from Frank Cusack's work that is in PPP CVS (directory linux/mppe), then
you could post them here or to Frank.  

Matt Domsch, Jan Dubiec, and some others have also been working on the
MPPE patch; they have posted to the PPTP mailing lists.

If you logged a bug report with Mandrake, one would hope that they would
elevate this report back to Frank.  ;-)  There is a risk that they will
adjust their patch instead.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
