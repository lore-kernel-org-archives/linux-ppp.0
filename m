From: Paul Mackerras <paulus@samba.org>
Date: Wed, 16 Jun 2004 13:00:32 +0000
Subject: Re: PPP state machine
Message-Id: <16592.17520.148321.16573@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1087365446.1118.10.camel@Bhaskar>
In-Reply-To: <1087365446.1118.10.camel@Bhaskar>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Carlson writes:

> Since you're talking about sync PPP, I don't understand the reference
> to PPPoE.  PPPoE is a bit of an ugly hack that involves (on Linux)
> multiple trips in and out of the kernel for the data path.

The ugly hack part is correct, but with the in-kernel pppoe module the
data path is at least entirely in the kernel. :)

Paul.
