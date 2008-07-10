From: James Cameron <james.cameron@hp.com>
Date: Thu, 10 Jul 2008 03:18:25 +0000
Subject: Re: about re-negotiate dns server IP
Message-Id: <20080710031824.GD5946@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200807101053023595691@gmail.com>
In-Reply-To: <200807101053023595691@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Jul 10, 2008 at 10:53:07AM +0800, c4linux wrote:
> an established ppp link can re-negotiate some LCP options suchas the
> dns server address???

DNS server addresses are negotiated by IPCP as ms-dns, not by LCP.  I
don't know the answer to your question though, sorry.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
