From: "David S. Miller" <davem@davemloft.net>
Date: Fri, 10 Sep 2004 21:55:06 +0000
Subject: Re: [IPCOMP] Use per-cpu buffers
Message-Id: <20040910145506.4b3933c4.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040910111047.GA29330@gondor.apana.org.au>
	<Xine.LNX.4.44.0409101140160.6664-100000@thoron.boston.redhat.com>
In-Reply-To: <Xine.LNX.4.44.0409101140160.6664-100000@thoron.boston.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Morris <jmorris@redhat.com>
Cc: herbert@gondor.apana.org.au, kuznet@ms2.inr.ac.ru, netdev@oss.sgi.com, linux-ppp@vger.kernel.org, paulus@samba.org

On Fri, 10 Sep 2004 11:42:00 -0400 (EDT)
James Morris <jmorris@redhat.com> wrote:

> On Fri, 10 Sep 2004, Herbert Xu wrote:
> 
> > James, can you think of a general solution to the 64K buffer in
> > terms of the crypto decompression interface?
> 
> I haven't looked at the code for a while, but I think we might be able to 
> save some memory by specifying compression parameters and making the 
> appropriate changes to zlib.

For now I'm going to put in Herbert's per-cpu patch, and we
can try to come up with something better later.
