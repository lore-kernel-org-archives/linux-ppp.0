From: James Cameron <james.cameron@hp.com>
Date: Thu, 11 Dec 2008 23:42:31 +0000
Subject: Re: PPP Recovery
Message-Id: <20081211234231.GC3742@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20958060.post@talk.nabble.com>
In-Reply-To: <20958060.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

In my experience with GPRS style modems, LCP echo continues to occur,
because it is just the modem firmware responding.  The LCP echo latency
is very small, consistent with this.  So LCP echo loss may not occur,
and the PPP connection may remain up.

-- 
James Cameron
http://ftp.hp.com.au/sigs/jc/
