From: ben_gal@libero.it
Date: Thu, 24 Feb 2005 22:53:39 +0000
Subject: Re: Client requesting its authentication
Message-Id: <20050224225339.GC2445@ytsejam>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050224162619.GB5787@ytsejam>
In-Reply-To: <20050224162619.GB5787@ytsejam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Feb 24, 2005 at 02:38:09PM -0800, Bill Unruh wrote:
> >But I cannot do reverse authentication and it can't too.
> 
> Why not? Just put require-eap into your ppp/options. and you will ask him
> for eap. 

I can't require an authentication that I will not be able to do.
In the other email Carlson explain well why.

> 
> >
> >>>
> >>>Yes. This isn't a problem.
> >>>The problem is when I trust him, but we haven't shown driver licenses 
> >>>each
> >>>other.
> >>
> >>If you walk away because he does not show his license to you then you DO
> >>NOT trust him.
> >
> >Eh ? :)
> 
> It may be a problem with English. I interpreted your sentence to be 
> "the problem is, if I trust him, but we haven't shown...." You might be
> saying " the problem is at what time do I trust him-- certainly not if we
> have not shown driver ....."

I mean:

if I trust him, but we have not authenticated each other,
then it's a problem

> What prevents you from putting
> require-eap
> into your options file which will result in your eap asking him to
> authenticate himself to you and you to him with eap?

I have explained that. 
The peer must act as a server.
I can't.


