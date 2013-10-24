From: Benjamin LaHaise <bcrl@kvack.org>
Date: Thu, 24 Oct 2013 15:53:54 +0000
Subject: Re: [RFC PATCH net-next] ppp: Allow ppp device connected to an l2tp session to change of namespace
Message-Id: <20131024155354.GQ2704@kvack.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <5268F6CD.9070600@alphalink.fr> <5268FCB1.7020903@katalix.com> <526923A7.8090108@alphalink.fr> <5269402E.2070203@katalix.com>
In-Reply-To: <5269402E.2070203@katalix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Chapman <jchapman@katalix.com>
Cc: =?iso-8859-1?Q?Fran=E7ois?= Cachereul <f.cachereul@alphalink.fr>, Paul Mackerras <paulus@samba.org>, netdev@vger.kernel.org, linux-ppp@vger.kernel.org

On Thu, Oct 24, 2013 at 04:43:42PM +0100, James Chapman wrote:
> I'm thinking about the implications of a skb in the net namespace of the
> ppp interface passing through a tunnel socket which is in another
> namespace. I think net namespaces are completely isolated.
> 
> To keep your ppp interfaces isolated from each other, have you
> considered using netfilter to prevent data being passed between ppp
> interfaces?

Using network namespaces for this is far more efficient.  We've already 
added support for doing this to other tunneling interfaces.  This approach 
also makes creating VPNs where there is re-use of the private address space 
between different customers far easier to implement.

		-ben
-- 
"Thought is the essence of where you are now."
