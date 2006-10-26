From: Christian <crich-ml@beronet.com>
Date: Thu, 26 Oct 2006 14:17:03 +0000
Subject: Way how frames are read in pppd
Message-Id: <4540C35F.9010104@beronet.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi List (James:-)

I have still some issues with my litle project. Let me explain for short
what i'm doing:


Application (synchdlc) <---> Stdin/Stdout <----> pppd (synchdlc)


to ensure boundaries i have hacked pppd to add framing for stdin/stdout,
so that packets in pppd transmitted to stdout contain headers and
packets received contain headers as well.


My problem is the following:

I don't understand where exactly the  PPP(IP) frames are read in pppd
and transmitted to the master_pty. It is certainly not (only) in
read_packet. I have found out that the kernel writes correct packets
with copy_to_user to the userspace. pppd reads them and somehow
transmits them to the master_fd. At this point the boundaries got lost.

I have tried to read the pppd code for a while, but i think i can't see
the forest anymore because of all the trees.

I would apreciate any help.

cheers,

Christian

