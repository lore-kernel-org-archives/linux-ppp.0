From: James Cameron <james.cameron@hp.com>
Date: Mon, 19 May 2008 05:15:41 +0000
Subject: Re: my god , I have tried to solve this problem for 2 days!
Message-Id: <20080519051541.GL6063@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200805161942479069943@foxmail.com>
In-Reply-To: <200805161942479069943@foxmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I know nothing that would prevent IPC from working between a pppd plugin
and another program.  IPC shmget technique needs to have the same keys,
and the same process UID and GID.  Check that.  Use ipcs to view the IPC
shared memory segments created.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
