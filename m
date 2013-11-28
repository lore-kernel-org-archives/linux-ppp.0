From: Michael Richardson <mcr@sandelman.ca>
Date: Thu, 28 Nov 2013 19:41:52 +0000
Subject: Re: patches past 2.4.5
Message-Id: <8060.1385667712@sandelman.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <858.1385656070@sandelman.ca>
In-Reply-To: <858.1385656070@sandelman.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Charlie Brady <charlieb-linux-ppp@budge.apana.org.au> wrote:
    > On Thu, 28 Nov 2013, Michael Richardson wrote:

    >> RADIUS plugin changes:
    > ...
    >> 8) if we find an invalid option in radius config file, it is fatal

    > This one is stupid. I recently sent you a patch to revert it. pppd
    > should not die just because a new option which the radius plugin
    > doesn't care about has been added to the radiusclient. Is the radius
    > plugin reading the config file to validate it for correctness, or to
    > read a few items which it cares about?

Like I said, it might well be that some of the things I saw were not in fact
"features", but regressions.  This one also seemed daft to me, and I haven't
yet found reasons for a bunch of other things.  I.e. does this fix a real
customer problem? 

I think this is an example of this.

-- 
]               Never tell me the odds!                 | ipv6 mesh networks [ 
]   Michael Richardson, Sandelman Software Works        | network architect  [ 
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [ 
	

