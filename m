From: Bill Unruh <unruh@physics.ubc.ca>
Date: Fri, 09 Apr 2004 15:30:09 +0000
Subject: Re: PPP is not establishing
Message-Id: <Pine.LNX.4.50.0404090826220.28997-100000@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <1081499169.3142.12.camel@Bhaskar>
In-Reply-To: <1081499169.3142.12.camel@Bhaskar>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Fri, 9 Apr 2004, Bhaskar wrote:

> Hi all,
> I am trying to connect to an ISP using my linux machine.  I am using
> RedHat Linux 8.0 .  And the ppp version is 2.4.1.  I am not able to
> understand why ISP is terminating the connection.  I have traced the PPP
> packets and sequence is :

Your isp seems to be completely incomptetent. He first asks for pap, and
then after you send your username/password, he asks for chap. That makes
very little sense. Find a new ISP.


> Serial connection established.
> using channel 9
> Using interface ppp0
> Connect: ppp0 <--> /dev/ttyS0
> sent [LCP ConfReq id=0x1 <mru 1500> <asyncmap 0x0> <magic 0x6f879d4a>
> <pcomp> <accomp>]
> sent [LCP ConfReq id=0x1 <mru 1500> <asyncmap 0x0> <magic 0x6f879d4a>
> <pcomp> <accomp>]
> sent [LCP ConfReq id=0x1 <mru 1500> <asyncmap 0x0> <magic 0x6f879d4a>
> <pcomp> <accomp>]
> rcvd [LCP ConfReq id=0x1 <mru 1514> <asyncmap 0x0> <auth pap> <magic
> 0x67f90746> <pcomp> <accomp>]
> sent [LCP ConfAck id=0x1 <mru 1514> <asyncmap 0x0> <auth pap> <magic
> 0x67f90746> <pcomp> <accomp>]
> rcvd [LCP ConfAck id=0x1 <mru 1500> <asyncmap 0x0> <magic 0x6f879d4a>
> <pcomp> <accomp>]
> sent [PAP AuthReq id=0x1 user="ELAN123" password=<Hidden>]
> rcvd [LCP ConfAck id=0x1 <mru 1500> <asyncmap 0x0> <magic 0x6f879d4a>
> <pcomp> <accomp>]
> rcvd [LCP ConfAck id=0x1 <mru 1500> <asyncmap 0x0> <magic 0x6f879d4a>
> <pcomp> <accomp>]
> rcvd [LCP ConfReq id=0x1 <mru 1500> <auth chap MD5> <magic 0xa2057c03>]
> sent [LCP ConfReq id=0x2 <mru 1500> <asyncmap 0x0> <magic 0x5bd54857>
> <pcomp> <accomp>]
> sent [LCP ConfAck id=0x1 <mru 1500> <auth chap MD5> <magic 0xa2057c03>]
> rcvd [LCP ConfRej id=0x2 <asyncmap 0x0> <pcomp> <accomp>]
> sent [LCP ConfReq id=0x3 <mru 1500> <magic 0x5bd54857>]
> rcvd [LCP ConfAck id=0x3 <mru 1500> <magic 0x5bd54857>]
> rcvd [LCP EchoReq id=0x0 magic=0xa2057c03]
> sent [LCP EchoRep id=0x0 magic=0x5bd54857]
> rcvd [LCP TermReq id=0x2]
> LCP terminated by peer
> sent [LCP TermAck id=0x2]
> 
> 
> ISP is expecting both PAP and CHAP authentication.  If PAP is
> successful, then only CHAP authentication is requested.
> What could be the reason for the termination.
> Please give your comments.

While probably not illegal (ie against the rules) it is very weird. You
might try removing pap authentication, or chap (ie make pap-secrets or
chap-secrets unreadable to see if your agreeing to both is what is
sending the isp crazy) I am not terribly hopeful. Get a new isp.


> 
> 
> With best regards,
> bhaskar
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
