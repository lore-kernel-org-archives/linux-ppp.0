From: James Cameron <james.cameron@hp.com>
Date: Mon, 17 May 2004 05:33:08 +0000
Subject: Re: has anyone gotten PPP and MPPE working with kernel 2.6.x yet??
Message-Id: <20040517053308.GM27992@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1084670191.4575.151.camel@bast.picotech.net>
In-Reply-To: <1084670191.4575.151.camel@bast.picotech.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Sun, May 16, 2004 at 11:19:45PM -0600, Jeffrey D. Means wrote:
> > > MPPE required, but keys are not available. Possible plugin problem?
> nope just upgraded kernel and pppd same config files used for pppd and
> radius

It might be a radius plugin incompatibility with 2.6.  It needs further
investigation by someone who uses the plugin.  Try the PPTP mailing
lists, I know some radius and pptpd users lurk there.  Perhaps someone
else on the PPP list will respond.

But I can answer the question in your subject; I've been using MPPE with
2.6.5 for quite a few weeks, without problems.  

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
