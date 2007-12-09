From: Charlie Brady <charlieb@budge.apana.org.au>
Date: Sun, 09 Dec 2007 17:04:48 +0000
Subject: Re: [PATCH] PPP synchronous tty: convert dead_sem to completion
Message-Id: <Pine.LNX.4.64.0712091203490.976@e-smith.charlieb.ott.istop.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20071208150954.GA8467@traven>
In-Reply-To: <20071208150954.GA8467@traven>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Kaehlcke <matthias.kaehlcke@gmail.com>
Cc: linux-ppp@vger.kernel.org, linux-kernel@vger.kernel.org


On Sat, 8 Dec 2007, Matthias Kaehlcke wrote:

> PPP synchronous tty channel driver: convert the semaphore dead_sem to
> a completion
>
> Signed-off-by: Matthias Kaehlcke <matthias.kaehlcke@gmail.com>

Excuse my ignorance please, but why is this a good idea? Should we not 
record the reason for changes?
