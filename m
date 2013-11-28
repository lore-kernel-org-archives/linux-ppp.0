From: Charlie Brady <charlieb-linux-ppp@budge.apana.org.au>
Date: Thu, 28 Nov 2013 16:40:56 +0000
Subject: Re: patches past 2.4.5
Message-Id: <Pine.LNX.4.64.1311281136500.6902@e-smith.charliebrady.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <858.1385656070@sandelman.ca>
In-Reply-To: <858.1385656070@sandelman.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


On Thu, 28 Nov 2013, Michael Richardson wrote:

> RADIUS plugin changes:
...
> 8) if we find an invalid option in radius config file, it is fatal

This one is stupid. I recently sent you a patch to revert it. pppd should 
not die just because a new option which the radius plugin doesn't care 
about has been added to the radiusclient. Is the radius plugin reading the 
config file to validate it for correctness, or to read a few items which 
it cares about?
