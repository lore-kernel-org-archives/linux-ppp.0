From: Abdul J <postabdul@yahoo.com>
Date: Wed, 20 Oct 2004 07:24:25 +0000
Subject: RE: mlppp-link termination issue
Message-Id: <20041020072425.94102.qmail@web60102.mail.yahoo.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20041015180546.26617.qmail@web60106.mail.yahoo.com>
In-Reply-To: <20041015180546.26617.qmail@web60106.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

I see. I did not find any patches either. Thanks for
point out the previous post. I am copying this message
to Piet Louw as well. Piet, did you find any success
in dealing with the MLPPP primary link drop problem?

If anyone develops a patch, I would be more than happy
to rigorously test it (at user level) as I have a
dedicated multilink setup with 8 links.

Thanks,
Abdul

--- Steve Drew <steve.drew@empics.com> wrote:

> Hi,
> 
> 	I use a similar setup of multilink PPP, I've not
> found any
> patches related to the improvements to pppd to make
> it RFC1990 compliant
> (re the first channel terminates).
> 	There was a post about 6 weeks ago, where someone
> (Piet Louw
> [ploubser@thepub.co.za]) was going to look into it,
> but there were no
> further posts from him.
> 
> Steve
> -----Original Message-----
> From: linux-ppp-owner@vger.kernel.org
> [mailto:linux-ppp-owner@vger.kernel.org] On Behalf
> Of Abdul J
> Sent: 15 October 2004 19:06
> To: linux-ppp@vger.kernel.org
> Subject: mlppp-link termination issue
> 
> Hi,
> 
> I am using the ppp-2.4.2 version on a Redhat machine
> with Kernel 2.4.20. I use multilink option to
> combine
> (inverse multiplex) a number of satellite links to
> aggregate bandwidth. This is a test setup and I
> control both ends of the PPP connection.
> 
> I observed that when the first link drops
> (terminated/disconnected) the ppp0 interface is
> dropped even though other links of the bundle are
> still connected. This results in having to restart
> all
> the connections when the first (primary) link of the
> bundle disconnects.
> 
> Though this behaviour is not in accordance with RFC
> 1990, the pppd man page (of ppp-2.4.2) acknowledges
> this. 
> "Currently, if the first pppd terminates (for
> example,
> because of a hangup or a received signal) the bundle
> is destroyed"
> 
> My question is: Are there any plans to fix this in
> future releases of the ppp-package or are there any
> other ppp implementations in Linux that do not
> suffer
> from this problem? Is there any way to work around
> this problem.
> 
> Please share your comments
> 
> Thanks
> Abdul
> 
> 
> 		
> _______________________________
> Do you Yahoo!?
> Declare Yourself - Register online to vote today!
> http://vote.yahoo.com
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> 
> 
> 
> 



		
_______________________________
Do you Yahoo!?
Declare Yourself - Register online to vote today!
http://vote.yahoo.com
