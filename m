From: Matt Domsch <Matt_Domsch@dell.com>
Date: Mon, 30 Aug 2004 22:48:25 +0000
Subject: Re: [pptp-devel] Re: [2/2]: ppp_mppe inclusion
Message-Id: <20040830224825.GB31278@lists.us.dell.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040720204723.GC27576@lists.us.dell.com>
In-Reply-To: <20040720204723.GC27576@lists.us.dell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, Aug 30, 2004 at 05:42:05PM -0500, Matt Domsch wrote:
> On Fri, Jul 30, 2004 at 11:33:09PM +0400, Oleg Makarenko wrote:
> > 2.  For some reason you can not use non GFP_KERNEL memory and scatter 
> > lists or at least mix them in crypto_digest().  That is why sha_pad is 
> > now in struct state {}.

Can you describe what happens when you do?


-- 
Matt Domsch
Sr. Software Engineer, Lead Engineer
Dell Linux Solutions linux.dell.com & www.dell.com/linux
Linux on Dell mailing lists @ http://lists.us.dell.com
