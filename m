From: Paul Mackerras <paulus@samba.org>
Date: Tue, 04 May 2004 22:45:36 +0000
Subject: Re: ppp MULTILINK issue / problem
Message-Id: <16536.7440.192670.169713@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <BCBD226C.57C%tchen@on-go.com>
In-Reply-To: <BCBD226C.57C%tchen@on-go.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Thomas Chen writes:

> now i am testing "UNBUNDLING" of the link.... if i unplug
> the one of the modem (not the master link), i do not see
> the IP traffic anymore, though i do see data on the serial
> link (i put a serial line monitor on the serial port),
> but no more IP packets coming out of PPP

Does the pppd process that is controlling the link that you unplug see
the disconnection?  Use the debug flag to pppd and look for a message
in the logs like "Modem hangup".  If pppd doesn't see that the link
has gone it won't take it out of the bundle.

Paul.
