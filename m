From: Andy Gay <ajmgay@netscape.net>
Date: Tue, 03 Feb 2004 16:24:42 +0000
Subject: Re: ppp-2.4.2 released
Message-Id: <401FCB4A.9010006@netscape.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
In-Reply-To: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



fcusack@fcusack.com wrote:

>On Tue, Feb 03, 2004 at 06:33:23AM -0800, Frank Cusack wrote:
>
>Even more -- if it's receiving the frag-needed messages and not caching
>them, it sounds broken.  ie, even if it is "ignoring" or mishandling them
>for the current session, it should be caching the result and for the next
>connection within some reasonable time window -- certainly within the amount
>of time a user would hit 'reload' -- use a smaller MSS.
>  
>
Maybe the frag-needed messages aren't geting through, as was suggested 
in an earlier message. I just tried to ping www.yle.fi, got no response, 
but I can connect to port 80 on it. Likely someone is blocking all ICMP 
to it.
A traceroute to its address (194.252.88.100) stops at 194.252.88.68, 
which is probably the router at the site. So it's not getting time 
exceeded messages out. You may be able to get somewhere by contacting 
the site admins (if you can find out who that is) and asking them to 
ensure that (at least) ICMP frag-needed is not blocked there.

/Andy


