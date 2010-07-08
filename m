From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 08 Jul 2010 13:39:58 +0000
Subject: Re: routing
Message-Id: <4C35D52E.8030205@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <W3133827767292401233331800@webmail16>
In-Reply-To: <W3133827767292401233331800@webmail16>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

tony.chamberlain@lemko.com wrote:
> I have three machines.

For what it's worth, it sounds a lot like these are basic IP routing
questions, and that the use of PPP is mostly immaterial.  You might want
to try to find a mailing list that's more focussed on routing issues in
Linux.

> Now I have machine C, 192.168.5.139.  I am trying to avoid having to install
> PPP on it but it has to communicate with both B and A.  B is, of course, no
> problem.  It can be reached via 192.168.5.27 and for some reason I cannot
> figure out, 10.0.0.26 also works from C to B.

There's always a reason for things.  ;-}  It would be good to understand
exactly what's going on there, because it may be related to the problems
you see.  Showing some "netstat -rn" output might be a start.

> To get C to be able to communicate with A I did the following:
> 
> in C:  ip route replace 10.0.0.98 via 192.168.5.27    # Route to 98 through 27
> in A:  ip route replace 192.168.5.139 via 10.0.0.26   # reverse

That along with the masquerading seems too complicated to me.

Assuming that static routing is somehow "required," I would have done
this on C:

	route add 10.0.0.0/24 192.168.5.27

because the 10 network is reachable through machine B.  Then on machine
A, I would have:

	route add 192.168.5.0/24 10.0.0.26

and nothing else.  No masquerading or any other tricks should be needed.
Just an IP path between those two systems ought to do the job.  (For
good measure, you could add a blackhole route for 10.0.0.0/24, so that
misaddressed packets don't bounce around, but that's not strictly required.)

But that assumes static routing.  I wouldn't do that on my network.  I'd
just enable RIP-2 or OSPF and let it do its thing.  It'll figure out the
routes.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
