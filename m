From: ben_gal@libero.it
Date: Thu, 24 Feb 2005 17:30:18 +0000
Subject: Re: Client requesting its authentication
Message-Id: <20050224173018.GA2421@ytsejam>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050224162619.GB5787@ytsejam>
In-Reply-To: <20050224162619.GB5787@ytsejam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Feb 24, 2005 at 11:37:29AM -0500, James Carlson wrote:
> > Is there in pppd an option to specify that we want the peer 
> > authenticate us using EAP, and to refuse to continue if it does not 
> > request us ?
> 
> You'd do it with "refuse-pap refuse-chap refuse-mschap
> refuse-mschap-v2".

Sorry, I made the question in a wrong manner.
I don't want to tell the peer what authentication to do if necessary, but
I want to tell it that I want to authenticate myself (and with EAP), else I 
won't connect.
Is there a way?

