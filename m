From: Clifford Kite <kite_linux-ppp@ev1.net>
Date: Thu, 28 Jul 2005 23:28:07 +0000
Subject: ppp-2.4.3 active-filter problem
Message-Id: <Pine.LNX.4.21.0507241332120.24644-100000@corncob.inetport.tld>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Background
----------
o - 2.6.8.1 kernel, self-compiled with PPP filtering support.

o - /usr/lib/libpcap.a, version 0.9.2 from the Slackware tcpdump-0.9.3
package as shown in the "strings /usr/lib/libpcap.a" output.  Also shown
in the output was DLT_PPP_PPPD.  (FYI, the version in the libpcap-0.9.3
source package at http://www.tcpdump.org wasn't updated.)

o- 2.4.3 pppd, self-compiled without any warning or error messages
(after replacing include/linux/crc-ccitt.h in the 2.6.8.1 source
with the same-named file from a 2.6.10 source :/).  The cc line in
the compiler output creating pppd contains -lpcap and the output of
"strings pppd/pppd" shows DLT_PPP_PPPD.  That output does not show
DLT_PPP_WITH_DIRECTION but it seems to me that shouldn't make any
difference.

Problem description
-------------------
This pppd fails with return status 2 when the option " active-filter
'(outbound and not (icmp[0] = 0))' " is used.  It's also failed with
the same return status using several other active-filter options that
I've tried and don't include outbound (or inbound).  It succeeds with
no active-filter option.

The active-filter option shown above works using pppd 2.4.2, which was
compiled with libpcap-0.7.2.  Has anyone successfully used pppd 2.4.3
with an active-filter option?

---
Clifford Kite

