From: James Cameron <james.cameron@hp.com>
Date: Sun, 14 Dec 2008 23:20:00 +0000
Subject: Re: pptpd
Message-Id: <20081214232000.GD3107@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <W9548217129274771229195924@webmail26>
In-Reply-To: <W9548217129274771229195924@webmail26>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

If you give the choice of IP address to pppd as James has suggested,
tell pptpd not to provide the IP address on the pppd command line.
pptpd.conf delegate option controls that, see man pptpd.conf

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
