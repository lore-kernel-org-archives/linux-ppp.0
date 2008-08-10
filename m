From: James Cameron <james.cameron@hp.com>
Date: Sun, 10 Aug 2008 23:11:40 +0000
Subject: Re: How to fix continuous ConfReq's on celluar internet connection
Message-Id: <20080810231140.GC6024@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <489F746B.3040002@123mail.org>
In-Reply-To: <489F746B.3040002@123mail.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Have you tried the demand option?  This keeps the network interface
present over a reconfiguration.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
