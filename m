From: James Morris <jmorris@redhat.com>
Date: Fri, 10 Sep 2004 15:42:00 +0000
Subject: Re: [IPCOMP] Use per-cpu buffers
Message-Id: <Xine.LNX.4.44.0409101140160.6664-100000@thoron.boston.redhat.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040910111047.GA29330@gondor.apana.org.au>
In-Reply-To: <20040910111047.GA29330@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, kuznet@ms2.inr.ac.ru, netdev@oss.sgi.com, linux-ppp@vger.kernel.org, paulus@samba.org

On Fri, 10 Sep 2004, Herbert Xu wrote:

> James, can you think of a general solution to the 64K buffer in
> terms of the crypto decompression interface?

I haven't looked at the code for a while, but I think we might be able to 
save some memory by specifying compression parameters and making the 
appropriate changes to zlib.


- James
-- 
James Morris
<jmorris@redhat.com>


