From: James Cameron <james.cameron@hp.com>
Date: Wed, 13 Feb 2008 22:20:41 +0000
Subject: Re: if-up et al script relocation
Message-Id: <20080213222041.GE3048@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <15468731.post@talk.nabble.com>
In-Reply-To: <15468731.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

You can relocate them by producing a custom build of pppd with a changed
value for the _PATH_IPUP define in pathnames.h.

You can also write a plug-in for your application that uses the
ip_up_hook() to call your own script using ipcp_script().  Plugins are
selected by pppd options.

Debian carries a patch to pppd that iterates through each script in
/etc/ppp/if-up.d ... this can also be found in Ubuntu ... it is made
more useful setting ipparam on the pppd options, and testing the value
within the scripts.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
