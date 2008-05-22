From: James Cameron <james.cameron@hp.com>
Date: Thu, 22 May 2008 00:00:17 +0000
Subject: Re: Re: about pppd termination?
Message-Id: <20080522000017.GE6559@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200805211447103125311@foxmail.com>
In-Reply-To: <200805211447103125311@foxmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, May 21, 2008 at 07:14:13PM -0400, James Carlson wrote:
> I'm not familiar with that GUI.

Good, I'm trying to let it die.  It is written in PHP-GTK.

> Is this a "nodetach" case?

No, updetach is used.

> An alternative might be to avoid sending signals to the process group
> if pppd is not actually the group leader.

This would have the side effect of not terminating the processes that
pppd started.  Wouldn't it be better if pppd made itself the group
leader?

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
