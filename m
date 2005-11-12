From: Jay Nitikman <jay@permeable.com>
Date: Sat, 12 Nov 2005 18:03:23 +0000
Subject: ioctl(ppp_dev_fd, PPPIOCSCOMPRESS, (caddr_t) &data) fails
Message-Id: <43762E6B.5020108@permeable.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

My working vpn connection stopped working "suddenly". I did some testing 
and discovered that the call:

ioctl(ppp_dev_fd, PPPIOCSCOMPRESS, (caddr_t) &data)

in ccp_test() in sys-linux.c in pppd always returns EINVAL.

My kernel, 2.6.10-gentoo-r6, has MPPE compiled in, not as a module.
The ppp_dev_fd has a value of "22" which seems reasonable.  So it 
appears that PPPIOCSCOMPRESS is invalid.  Huh?

I am using Gentoo ppp-2.4.3-r9.

This has been working fine for months.  I have tried rebooting, both 
cold and warm.  I've tried rebuilding ppp-2.4.3-r9.  I've tried 
ppp-2.4.2-r15.  My vpn provider says that nothing has changed on their side.

Any ideas why that ioctl should fail and how to fix it?

-- 
-----------------
Jay Nitikman
jay@permeable.com
-----------------
