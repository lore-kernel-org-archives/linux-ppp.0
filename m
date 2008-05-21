From: James Cameron <james.cameron@hp.com>
Date: Wed, 21 May 2008 06:56:00 +0000
Subject: Re: about pppd termination?
Message-Id: <20080521065600.GK4960@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200805211447103125311@foxmail.com>
In-Reply-To: <200805211447103125311@foxmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Consider the ip_down_hook plugin hook if you want to catch either event.

pppd can also be killed with SIGKILL, unhandled, and so kernel destroys
interface.  No code in pppd executed.  No ip_down_hook executed.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
