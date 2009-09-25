From: Charlie Brady <charlieb-linux-ppp@budge.apana.org.au>
Date: Fri, 25 Sep 2009 18:51:55 +0000
Subject: Re: ppp link time limit
Message-Id: <Pine.LNX.4.64.0909251450430.6872@e-smith.charlieb.ott.istop.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <004001ca3e15$69a6b9d0$0413010a@scu.escambray.com.cu>
In-Reply-To: <004001ca3e15$69a6b9d0$0413010a@scu.escambray.com.cu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


On Fri, 25 Sep 2009, Bill Unruh wrote:

> pppd call isp & sleep 1800; killall pppd

The above will kill any pppd process, not just the backgrounded one from 
this shell script.
