From: Jiri Kosina <jkosina@suse.cz>
Date: Thu, 07 May 2009 11:02:38 +0000
Subject: Re: [PATCH] Accept ms-wins settings provided by server
Message-Id: <alpine.LNX.2.00.0905071249270.22532@wotan.suse.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <1241641599-32361-1-git-send-email-marcus@better.se>
In-Reply-To: <1241641599-32361-1-git-send-email-marcus@better.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, 7 May 2009, Paul Mackerras wrote:

> Are you sure that not accepting WINS settings is the only reason for 
> getting those DNS server addresses?  

Well, that's the observation. As soon as pppd is patched to accept the 
WINS settings, the DNS settings always arrive.
If we don't accept WINS settings, sometimes (reproducibly) no DNS settings 
are received.

> Also, have you tried the latest git version of pppd?  Since 2.4.4 I have 
> added code to add the MS-DNS option to our IPCP conf-reqs if the modem 
> insists.  At least at one stage that seemed to be the critical thing, 
> not the MS-WINS options.  So if you can replicate the problem with the 
> current git version of pppd, and this patch makes it go away, let me 
> know (or better still put it in the patch description) and I'll put the 
> patch in.

I am able to reproduce the problem with 2.4.4. Are the changes 
you are talking about merged post-2.4.4? If so, I will try to reproduce 
with current git. 

Unfortunately, this problem seems to be location-specific to me, in some 
locations this reproduces easily, in other locations it takes time. I am 
currently mostly in the locations where things usually work, but I will 
try (maybe Marcus will be faster verifying this, as I guess he is able to 
reproduce it in his "primary" location).

I guess it's dependent on the speed of registration with network, or 
something like that.

Thanks,

-- 
Jiri Kosina
SUSE Labs
