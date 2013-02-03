From: Paul Mackerras <paulus@samba.org>
Date: Sun, 03 Feb 2013 02:28:53 +0000
Subject: Re: [PATCH] ppp: ignore unrecognised radiusclient configuration directives
Message-Id: <20130203022853.GC24318@iris.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.64.1208301919580.27411@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.64.1208301919580.27411@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Aug 30, 2012 at 07:24:00PM -0400, Charlie Brady wrote:
> 
> New versions of freeradius occasionally add configuration keywords. 
> There's no reason that the pppd plugin should fail when that occurs.
> 
> Signed-off-by:  Charlie Brady <charlieb@budge.apana.org.au>

Thanks, applied.

(By the way, your mailer changed the tabs to spaces.)

Paul.
