From: carlsonj@workingcode.com
Date: Thu, 11 Nov 2004 19:55:32 +0000
Subject: RE: PPP Timeout
Message-Id: <16787.50100.341924.75915@carlson.workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AB78549255EA7A4683F64803C159436D02EE4F47@stpmse02.stp.guidant.com>
In-Reply-To: <AB78549255EA7A4683F64803C159436D02EE4F47@stpmse02.stp.guidant.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Rana, Gaurav (STP) writes:
> You mean the PIPE between the PPPD and the Application will break when the Wire is pulled out?

There is no "pipe" between pppd and the application.

pppd establishes an IP interface.  IP is connectionless.  Networking
applications use transport layer protocols over IP (such as TCP) to
establish connections.

There's just no relationship between these two things.  The
connections known to the applications exist in the transport layer and
IP knows nothing of them.  The interfaces (such as PPP) are known to
IP, but have nothing to do with transports.

When the wire gets pulled out, the PPP link may eventually go down,
either quickly (due to hardware detection of loss of carrier) or
slowly (due to LCP echo timeout).  Whether it does or does not go down
doesn't matter to the application.  The application will get an error
only when the transport layer gives up trying to retransmit data to
the peer.

Again, this isn't a PPP issue.  Consider for instance what happens if
some intermediate router between your application and the remote end
of the connection goes down.  There is simply no way at all for you to
know that this has happened, except that packets start getting
dropped.  There's no mechanism that would allow you to detect this.

Given that there are undetectable cases like that, and you must deal
with them via timeouts, and that IP intentionally tries to route
around failures and the transports are patient in trying to work in
the face of transient errors, what's the point in trying to detect
local failures?

All that said, you can put a script in /etc/ppp/ip-down and use that
to kill off your applications when the link goes down, just like a
misdesigned 'doze box.  I wouldn't recommend it, though.

-- 
James Carlson                                 <carlsonj@workingcode.com>
