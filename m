From: Derek Simkowiak <dereks@realloc.net>
Date: Wed, 02 Jun 2004 01:12:07 +0000
Subject: Multilink PPTP for link aggregation?
Message-Id: <40BD2967.4070105@realloc.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


     Hello,
	Briefly: I want to know if "Multilink PPTP" is supported.  I don't understand the relationship between PPP and PPTP, so I might actually mean "Multilink PPP over PPTP".  I'm hoping someone here will educate me.

	Less briefly: 

Assume I have two Internet connections to my branch office: one DSL, one CableModem.  These connections are from two different ISPs, with two different public I.P. addresses on two entirely different subnets.

Assume I also have a collocated Linux server, called "poptop_server", at a fancy datacenter that has a latency of only 2ms from both my DSL's ISP, and my CableModem's ISP.

	My goal is to treat the DSL and CableModem as one, single very-fast Internet connection, that is completely transparent to endusers.  This is called "binding" or "link aggregation", and is usually done at Layer 2 (for example, with a Cisco 2600).  I wish to do this with two PPTP tunnels, instead of with two Layer 2 links.  (I am not concerned with encryption at this time.)

	The idea is to set up two PPTP VPN tunnels from my branch office to "poptop_server" -- the first tunnel across the DSL connection, the second connection across the CableModem connection.  Then, I want to let the "Multilink PPP" code, or MLPPP, handle the task of load balancing packets across the two VPNs.

	Note that MLPPP is supported under both Microsoft Windows and Linux.  

	Furthermore, it looks like MLPPP can be used with PPTP.  When I create a new PPTP VPN connection under Microsoft Windows, I can go to Properties -> [Tab] Networking -> [Button] Settings  and see the same options I see for a PPP connection, including the option "Negotiate multi-link for single link connections", which is Microsoft's way of saying "Enable MLPPP".

	From what I understand, MLPPP is usually used for two-channel ISDN or with groups of 56K modems.  But I wish to use it for two tunnels, in order to get link aggregation across two different ISPs, without any special hardware or special support from either ISP.

Question 1: Can this be done?

Question 2: Has this been done?

Question 3: Can it be done on asymmetric links?  I.e., with a 3.0Mbit CableModem connection, and a 768K DSL connection?  When I read the URL http://linux-mp.terz.de/ it says "It implements a round-robin algorithm that distributes the packets to be sent over all available lines."  That web page is old, and I can't find any information about weightings or other asymmetric scheduling.

Question 4: Could this provide "High Availability", in the sense that if one ISP croaks completely, the other ISP would keep things running smoothly (albeit slower)?  As I read the Linux 'pppd' man page at the section MULTILINK, it says: "Currently, if the first pppd terminates (for example, because of a hangup or a received signal) the bundle is destroyed."  This would seem to indicate that this would be fault-prone (like RAID0) instead of fault-tolerant (like RAID5).

	I think this would be cool if it worked.  Two bonded 1.5M Covad DSL connections would cost less than 1/2 of two bonded T1s in my neighborhood, and four bonded 768K Verizon DSL connections would cost less than 1/6th of two bonded T1s.

	Any help or advice is greatly appreciated.


Thank You,
Derek Simkowiak



