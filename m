From: James Cameron <james.cameron@hp.com>
Date: Wed, 28 Apr 2004 02:28:36 +0000
Subject: Re: Interface Name
Message-Id: <20040428022836.GM862@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <408E24E6.6090900@guox.net>
In-Reply-To: <408E24E6.6090900@guox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, Apr 28, 2004 at 12:15:38PM +1000, soragan@guox.net wrote:
> never try that option, but what i am trying to do it to change the
> interface name, not the number like ppp0 ppp1 :)

At least with that option, you could ensure that the interface has a
consistent name to begin with, rather than be allocated in order of
creation.

e.g. unit 40 for the adsl, unit 50 for the pppoe.

This may simplify the ifrename.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
