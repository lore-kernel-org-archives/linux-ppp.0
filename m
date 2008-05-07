From: "Sascha Kiefer" <sk@intertivity.com>
Date: Wed, 07 May 2008 11:46:38 +0000
Subject: RE: [Poptop-server] Restrict user access
Message-Id: <006c01c8b038$040e91e0$9602a8c0@saschaxp1>
List-Id: <linux-ppp.vger.kernel.org>
References: <002a01c8af4a$6e329ab0$9602a8c0@saschaxp1>
In-Reply-To: <002a01c8af4a$6e329ab0$9602a8c0@saschaxp1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Ok.
I setup a radius server with mysql on a different server.
But i think i'm far from having everything playing together.

I found some howto on the web:
http://poptop.sourceforge.net/dox/radius_mysql.html
So: the client will get the ip from the radius server??? Not from the server
that has poptop running?



-----Original Message-----
From: Sascha Kiefer [mailto:sk@intertivity.com] 
Sent: Dienstag, 6. Mai 2008 11:26
To: 'james.cameron@hp.com'
Cc: 'poptop-server@lists.sourceforge.net'; 'linux-ppp@vger.kernel.org'
Subject: RE: [Poptop-server] Restrict user access


Thanks for the hint.
For what i would like to do i probably will go for radius.
I know thats not the right list, but maybe you (or somebody else) can help
me out:
- installing radius server on the poptop server? Okay/Not okay?
- accessing one radius server from different poptop servers - which means
havin one authentication server for different vpn/physical servers? 
- ensure that only my vpn servers can access the radius server? Probably ip
restrictions? Any source that i might have to read?

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

