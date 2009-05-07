From: Paul Mackerras <paulus@samba.org>
Date: Thu, 07 May 2009 12:37:18 +0000
Subject: Re: [PATCH] Accept ms-wins settings provided by server
Message-Id: <18946.54782.121473.378162@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1241641599-32361-1-git-send-email-marcus@better.se>
In-Reply-To: <1241641599-32361-1-git-send-email-marcus@better.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Jiri Kosina writes:

> Well, that's the observation. As soon as pppd is patched to accept the 
> WINS settings, the DNS settings always arrive.
> If we don't accept WINS settings, sometimes (reproducibly) no DNS settings 
> are received.

Do you have logs of the negotiations with and without the patch?  I'd
be interested to see them.

> I am able to reproduce the problem with 2.4.4. Are the changes 
> you are talking about merged post-2.4.4? If so, I will try to reproduce 
> with current git. 

Yes, they have gone in since 2.4.4.

> Unfortunately, this problem seems to be location-specific to me, in some 
> locations this reproduces easily, in other locations it takes time. I am 
> currently mostly in the locations where things usually work, but I will 
> try (maybe Marcus will be faster verifying this, as I guess he is able to 
> reproduce it in his "primary" location).
> 
> I guess it's dependent on the speed of registration with network, or 
> something like that.

Most likely.

Paul.
