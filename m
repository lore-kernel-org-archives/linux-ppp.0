From: Paul Mackerras <paulus@samba.org>
Date: Wed, 22 Mar 2006 02:50:00 +0000
Subject: Re: Maximum simultaneous interfaces ppp
Message-Id: <17440.47960.786363.946326@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <441E83BB.1030302@knet.es>
In-Reply-To: <441E83BB.1030302@knet.es>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Julio Rodanes - KNET writes:

> How many interfaces ppp is possible create with ppp-2.4.2 and kernel
> 2.4.22 ? Is 100 interfaces ppp the max limit??

There is no hard limit, you can create as many as you like within the
constraints of the amount of memory your machine has.

Paul.
