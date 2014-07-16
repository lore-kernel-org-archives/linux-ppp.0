From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Wed, 16 Jul 2014 21:48:32 +0000
Subject: Re: [PATCH net-next 1/1] net: ppp: access ppp->nextseq only if CONFIG_PPP_MULTILINK is defined
Message-Id: <53C6F330.3050602@cogentembedded.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <53C6F186.30809@kristov.de>
In-Reply-To: <53C6F186.30809@kristov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Schulz <develop@kristov.de>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: linux-ppp@vger.kernel.org, Paul Mackerras <paulus@samba.org>

Hello.

On 07/17/2014 01:41 AM, Christoph Schulz wrote:

> From: Christoph Schulz <develop@kristov.de>

> Commit d762d038497c9df51c19fcbe69b094b3bf8e5568 resets the counter holding the

    Please also specify that commit's summary line in parens.

> next sequence number for multilink PPP fragments to zero whenever the
> SC_MULTILINK flag is set. However, this counter only exists if
> CONFIG_PPP_MULTILINK is defined. Consequently, the new code has to be enclosed
> within #ifdef CONFIG_PPP_MULTILINK ... #endif.

> Signed-off-by: Christoph Schulz <develop@kristov.de>

WBR, Sergei

