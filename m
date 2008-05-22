From: James Cameron <james.cameron@hp.com>
Date: Thu, 22 May 2008 00:52:29 +0000
Subject: Re: Re: about pppd termination?
Message-Id: <20080522005229.GH6559@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200805211447103125311@foxmail.com>
In-Reply-To: <200805211447103125311@foxmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, May 21, 2008 at 08:38:22PM -0400, James Carlson wrote:
> Is it possible that the signal was sent before the setsid() was done
> (i.e., before IPCP went Opened)?  If so, then we might need to tweak
> how the process group is managed in the special case of (at least)
> updetach.

Yes, that's the situation.  I remember now.  Until we added the handler
for SIGINT in the GUI, what would happen is that the GUI would die with
a SIGINT as a result of the user hitting the "Cancel" button before the
tunnel was established.  That button sent a SIGINT to the pppd which had
not yet detached.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
