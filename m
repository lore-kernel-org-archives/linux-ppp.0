From: Paul Mackerras <paulus@samba.org>
Date: Tue, 16 Nov 2004 11:44:55 +0000
Subject: RE: Linux Kernel PPPoE/PPP Interactions
Message-Id: <16793.59447.609249.629183@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <NIBBLPOFOMEFBJKBJLGFKEFACEAA.murugaiyan@banyannetworks.com>
In-Reply-To: <NIBBLPOFOMEFBJKBJLGFKEFACEAA.murugaiyan@banyannetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Murugaiyan N writes:

> my understanding is for the set of system calls, the the user space program
> should get the ppp control packets.
> But it is not happening, please point out the problem.

LCP packets (and anything else with protocol >= 0xc000) will come in
on `fd', other control packets (e.g. IPCP) will come in on pppDevFd.

Paul.
