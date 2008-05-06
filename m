From: "Sascha Kiefer" <sk@intertivity.com>
Date: Tue, 06 May 2008 07:25:56 +0000
Subject: RE: [Poptop-server] Restrict user access
Message-Id: <002a01c8af4a$6e329ab0$9602a8c0@saschaxp1>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Thanks for the hint.
For what i would like to do i probably will go for radius.
I know thats not the right list, but maybe you (or somebody else) can help
me out:
- installing radius server on the poptop server? Okay/Not okay?
- accessing one radius server from different poptop servers - which means
havin one authentication server for different vpn/physical servers? 
- ensure that only my vpn servers can access the radius server? Probably ip
restrictions?
Any source that i might have to read?

Regards,
Sascha Kiefer


-----Original Message-----
From: james.cameron@hp.com [mailto:james.cameron@hp.com] 
Sent: Dienstag, 6. Mai 2008 10:42
To: Sascha Kiefer
Cc: poptop-server@lists.sourceforge.net
Subject: Re: [Poptop-server] Restrict user access


This would be a pppd configuration issue, not pptpd.  I've heard of various
ways to implement it ... a RADIUS server, or pppd ip-up.d scripting, or pppd
authentication plugins.

You would have to assume that an originating IP address identified a
workstation (which isn't always true).

But yes, certainly *possible*.  Just lacking in implementation
documentation.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/

