From: James Cameron <james.cameron@hp.com>
Date: Mon, 02 Feb 2004 23:11:59 +0000
Subject: Re: ppp-2.4.2 released
Message-Id: <20040202231159.GB5522@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
In-Reply-To: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, Feb 02, 2004 at 12:56:52PM +0200, Pasi K?rkk?inen wrote:
> Check http://nrg.joroinen.fi/yle.log
> It's a tcpdump log from pptp server (running pppd 2.4.2).

The reason why PMTU-D is not working here is that the ICMP "need to
frag" message did not change behaviour of www.yle.fi.  The pptp-server
host is doing the right thing in generating this ICMP response; it's how
PMTU-D is supposed to work.  The www.yle.fi server should reduce the
MSS and retransmit a shorter packet.

Possible reasons why it isn't working;

- the "need to frag" MTU in the ICMP response by pptp-server is wrong,
  (but it says 1396, data segment was 1360, plus 40, so it seems right
  to me),

- the ICMP response is not reaching www.yle.fi, (a common problem after
  that ICMP propogating worm, many admins shut off ICMP blindly),

- www.yle.fi is ignoring ICMP responses.

> why? Because the pptp-server ppp-interface MTU is set to x-4, when
> pptp-client ppp-interface mtu is set to x. 
> x is the value that is defined in the ppp-server config file.

What evidence do you have that the pptp-client ppp-interface MTU is set
to X?  Is your evidence just the MSS in the SYN packet?

> Now, the problem is, that the web-server is already sending packets which
> have *right* size (the size client told), but the pptp-server rejects them
> because of the ppp-interface MTU is too low (in the pptp server). 

The client cannot know the right size for the path, so it only suggests
an MSS of 1360 during the SYN packet.  Where did the client get this
size from?  (presumably the client isn't running pppd 2.4.2?)

So even if the pptp-client host is incorrectly setting the interface
MTU, and hence the MSS in the SYN packet, PMTU-D should work to sustain
the connection.

Note that the www.yle.fi is honouring the MSS in the SYN packet.

(While it isn't what you want, there is a hack in iptables that will
clamp the MSS to the PMTU ... "iptables --append FORWARD --protocol tcp 
--tcp-flags SYN,RST SYN --jump TCPMSS --clamp-mss-to-pmtu" or even
"--set-mss 1346" see http://lartc.org/howto/lartc.cookbook.mtu-mss.html)

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
