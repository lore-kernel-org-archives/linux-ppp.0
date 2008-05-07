From: James Cameron <james.cameron@hp.com>
Date: Wed, 07 May 2008 23:03:54 +0000
Subject: Re: [Poptop-server] Restrict user access
Message-Id: <20080507230354.GA4917@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <002a01c8af4a$6e329ab0$9602a8c0@saschaxp1>
In-Reply-To: <002a01c8af4a$6e329ab0$9602a8c0@saschaxp1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, May 07, 2008 at 03:46:38PM +0400, Sascha Kiefer wrote:
> I found some howto on the web:
> http://poptop.sourceforge.net/dox/radius_mysql.html

Edits welcome.  It is getting old.

> So: the client will get the ip from the radius server??? Not from the server
> that has poptop running?

The IP address is allocated by the RADIUS server, passed in a message to
the pppd RADIUS plugin which was selected by pptpd, and pppd then passes
it to the client within IPCP.  The client perceives it has got it from
the server running pptpd.  But you know that it has come from the RADIUS
server.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
