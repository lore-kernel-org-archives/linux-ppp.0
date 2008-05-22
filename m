From: James Cameron <james.cameron@hp.com>
Date: Thu, 22 May 2008 00:56:10 +0000
Subject: Re: Re: about pppd termination?
Message-Id: <20080522005609.GI6559@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200805211447103125311@foxmail.com>
In-Reply-To: <200805211447103125311@foxmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, May 22, 2008 at 10:38:39AM +1000, Paul Mackerras wrote:
> There does still remain the question of how pppd gets any
> connector/disconnector processes to stop if pppd has to terminate for
> other reasons, such as getting a SIGSEGV, though.

Yes, or SIGKILL.  I remember one user who habitually used -9 and then
complained that the connector (pptp) wasn't terminating forthwith.

Tracking each process created would be effective, and could remove the
need for a process group kill.  I'm just not sure if that level of
change is justified.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
