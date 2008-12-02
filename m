From: James Cameron <james.cameron@hp.com>
Date: Tue, 02 Dec 2008 22:56:30 +0000
Subject: Re: pptp failure
Message-Id: <20081202225630.GE3788@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <W68317226172691227707264@webmail41>
In-Reply-To: <W68317226172691227707264@webmail41>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Since you had no arrival of GRE packets, the response by pppd and pptp
is normal.

Try to find out why GRE packets are not arriving.  It is usually caused
by some external device.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
