From: Charlie Brady <charlieb-linux-ppp@budge.apana.org.au>
Date: Fri, 13 Nov 2009 16:42:15 +0000
Subject: Re: getting the device of the ppp connection
Message-Id: <Pine.LNX.4.64.0911131139440.30389@e-smith.charlieb.ott.istop.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <dac45060911130554u31df1580x13d2c901372567af@mail.gmail.com>
In-Reply-To: <dac45060911130554u31df1580x13d2c901372567af@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


On Fri, 13 Nov 2009, James Carlson wrote:

> This is information that's really known only to the dialer involved, and
> not to pppd, which 'sees' only a channel for PPP frames.  You can hack
> around the issue by setting an environment variable to communicate the
> information needed, but there's no native support in the current design
> for recording this medium-dependent information.
>
> There probably should be something added,

I don't agree. The caller of pppd can provide the information in the 
environment. Adding stuff to pppd would just be bloat, and more code 
generally means more bugs.

KISS.

> and I'm sure something could be hacked together for a few special cases, 
> but it's likely a complicated problem to solve _well_.

Indeed.
