From: Michael Richardson <mcr@sandelman.ca>
Date: Thu, 28 Nov 2013 16:27:50 +0000
Subject: patches past 2.4.5
Message-Id: <858.1385656070@sandelman.ca>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


I have become the maintainer of a PPPoE LNS/BMC "server" product in use
at some 500 ISPs.  (I am adding IPv6/RFC6204 support to it)
This product has a history in well known PPPoE implementations, and there are
a number of patches in our pppd repository which are not in the pppd repo.  
  https://github.com/mcr/pppd/commits/master

The patches were kept in a huge CVS, and some of the differences I discovered
were actually regressions against bugs fixes in 2.4.5, which I've elimited.

There are still build issues when building with options different from
those that the product builds with that I'm resolving. Mostly the product
removes code that it does not need.   I am considering setting up a travis-CI
build that enumerates all the options.

This is a summary of the summary of the changes.  I'm posting this rather
than actual patches because I don't think the patches are fully cooked (some
do not compile on their own yet, depending upon patches further on, and I
have to re-order them some more), and some may have no wider interest. 
I want to prioritize the things of most interest to the wider community.

I would appreciate knowing
  a) things you think are stupid and I should keep to myself.
  b) things you want as-is
  c) things that need some discussion.


1) added Makefile options to point at kernel usr/include when building

2) added pap reauthentication
   I haven't figured out the why of this yet :-)

3) added pap-interval option

Kills off pap LCP process after some amount of time.  This violates 
the PPP specifications, but is necessary for the LNS/BMC to protect itself
against password cracking attackers.

4) make many error messages say more about which fd and unit had the failure
   Just better logging.

RADIUS plugin changes:

5) added support for framed-IP netmask
6) added Roaring Penguin custom radius options relating to bandwidth
   limits.
7) free-up vendor dictionaries when done
8) if we find an invalid option in radius config file, it is fatal
9) be more tolerant about corrupted or missing sequence number files


BUILD OPTIONS

10) make l2tp and winbind optional.
11) added extended pppd stats
12) keep beetter track of plugins, and do not load them multiple times even if
   mentioned multiple times  (**)
13) be able to restart LCP option negotiation by longjmp back to beginning
14) make on-demand dialing an optional build option (USE_DEMAND)
15) make ESP an optional build option (USE_EAP)
16) track the number of nakci for MRU things, and fail if it keeps
    going on.
17) change size of MRU from 1500 to 9000, and let it be negotiated 
    down. Requires resizing many buffers to use JUMBO_PPP_MRU.
18) added FULL_LCP build option, not yet clear what problem it fixes.
19) a fix which deals with some bug in an OSX/Mac PPP stack issue
20) added USE_FULL_IPCP build option, not yet clear what problem it fixes.
21) make compression an optional build (COMP)
22) use BCOPY rather than slprintf for username and password
    -- seems to be related to having non-US-ASCII usernames available
    in logs
23) added USE_ECP build option
24) added ALL_OPTIONS define --- removes a bunch of options.
25) made async tty an optional build option (USE_SERIAL)
26) added USE_FULL_AUTH build option --- turns on many authentication
    mechanisms
27) added LONGCOUNTER defines to Makefile -- use long long for bytes in/out.
28) added bandwidth limits --- options and down into kernel
29) whitespace changes -- a lot of files have trailing whitespace
    I made one patch which removed them all with no other changes.
    Removing trailing whitespace is my editor default now, so if
    we want to keep them all, I'll want to put some emacs style/mode
    values into files I edit.
30) some patches to deal with a dozen or so 
    declared with attribute warn_unused_result [-Wunused-result]
    warnings.
    (I always try to build with -Werror)

-- 
]               Never tell me the odds!                 | ipv6 mesh networks [ 
]   Michael Richardson, Sandelman Software Works        | network architect  [ 
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [ 
	




