From: James Carlson <carlson@workingcode.com>
Date: Thu, 04 Mar 2004 11:42:44 +0000
Subject: Re: Strange problem seeing certain websites over dial-up connection
Message-Id: <16455.5684.783825.839961@c-24-147-210-59.ne.client2.attbi.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <404705F7.40308@lysator.liu.se>
In-Reply-To: <404705F7.40308@lysator.liu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Johan Gill writes:
> location should not be the problem. The problem is that an HTTP request 
> is sent, but no answer is recorded. Both webservers were IIS 5.0 when I 
> checked the other day. I could rip the packets apart in a few weeks to 
> see what I find, but I thought I should post this now.

There are many possible problems, but without some details, it would
be hard to guess.  Please include pppd configuration files, debug
output from pppd negotiation, "netstat -ni", and, since this sounds
like a name service or routing problem rather than a PPP problem,
"route -n" and packet traces.

Just to be sure: this is a regular modem and not PPPoE with an ADSL
"modem," right?

What MRU do you have configured?  At just a wild guess, if it's
anything other than the default of 1500, you're likely forcing the
access server to do PMTU discovery, and if there's a broken firewall
in front of those web servers, you may have trouble reaching them.

-- 
James Carlson                                  <carlson@workingcode.com>
