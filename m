From: "Murugaiyan N" <murugaiyan@banyannetworks.com>
Date: Sat, 27 Dec 2003 12:01:13 +0000
Subject: RE: Linux Kernel PPPoE/PPP Interactions
Message-Id: <NIBBLPOFOMEFBJKBJLGFOEFNCEAA.murugaiyan@banyannetworks.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <NIBBLPOFOMEFBJKBJLGFKEFACEAA.murugaiyan@banyannetworks.com>
In-Reply-To: <NIBBLPOFOMEFBJKBJLGFKEFACEAA.murugaiyan@banyannetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

but actually, nothing i am able to receive.  but write on the fd and
devPPPFd sends
the packets out with proper pppoe header, and the client is receiving the
packets.

what things prevent it to read?
If i do a read it is blocking and nothing is read?


- Murugaiyan



---------------------
Broadband Division
www.banyannetworks.com

-----Original Message-----
From: linux-ppp-owner@vger.kernel.org
[mailto:linux-ppp-owner@vger.kernel.org]On Behalf Of Paul Mackerras
Sent: Tuesday, November 16, 2004 5:15 PM
To: Murugaiyan N
Cc: Michal Ostrowski; linux-ppp@vger.kernel.org
Subject: RE: Linux Kernel PPPoE/PPP Interactions


Murugaiyan N writes:

> my understanding is for the set of system calls, the the user space
program
> should get the ppp control packets.
> But it is not happening, please point out the problem.

LCP packets (and anything else with protocol >= 0xc000) will come in
on `fd', other control packets (e.g. IPCP) will come in on pppDevFd.

Paul.
-
To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


