From: Guillaume Nault <g.nault@alphalink.fr>
Date: Mon, 22 Aug 2016 14:48:39 +0000
Subject: Re: [PATCH v4 net-next] ppp: Fix one deadlock issue of PPP when reentrant
Message-Id: <20160822144838.jurspfap3z5527j4@alphalink.fr>
List-Id: <linux-ppp.vger.kernel.org>
References: <1471828814-19187-1-git-send-email-fgao@ikuai8.com>
 <20160822123525.ycymv43cdaoykuqt@alphalink.fr>
 <CA+6hz4pb69Kn0KSmrA+Lq0ubgaed8zA9iKfAjr5bN2++ESzuMg@mail.gmail.com>
In-Reply-To: <CA+6hz4pb69Kn0KSmrA+Lq0ubgaed8zA9iKfAjr5bN2++ESzuMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Feng Gao <gfree.wind@gmail.com>
Cc: Gao Feng <fgao@ikuai8.com>, paulus@samba.org, Philp Prindeville <philipp@redfish-solutions.com>, linux-ppp@vger.kernel.org, Linux Kernel Network Developers <netdev@vger.kernel.org>

On Mon, Aug 22, 2016 at 09:16:16PM +0800, Feng Gao wrote:
> It seems a better solution, simple and apparent.
> I accept any best solution which could make kernel works well :))
> 
Thanks. I need to rework it a bit and do wider testing.
If everything goes fine, I should have something to submit formally
before the end of the week.
