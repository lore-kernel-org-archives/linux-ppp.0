From: Paul Mackerras <paulus@samba.org>
Date: Mon, 02 Aug 2004 22:54:22 +0000
Subject: Re: The active-filter option in 2.6.6 and 2.6.7
Message-Id: <16654.50718.46870.585344@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.21.0408021646530.5534-100000@corncob.localhost.tld>
In-Reply-To: <Pine.LNX.4.21.0408021646530.5534-100000@corncob.localhost.tld>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Clifford Kite writes:

> As I've previously said, the code for the active-filter option in 2.6.6
> and 2.6.7 doesn't work correctly.  However I have managed to find a fix:
> Revert to the 2.6.5 ppp_generic.c.  I'm not really a C programmer so I
> don't know what went wrong, but the changes in the code there from 2.6.5
> to 2.6.6 are minimal and all appear related to the active-filter option.

I don't know why that change was made.  I just sent email to Andrew
Morton and kkeil@suse.de asking why that change was made.  Unless
there is a *really* good reason for the change, I'll get it reverted.

Paul.
