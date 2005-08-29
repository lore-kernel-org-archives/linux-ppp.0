From: Paul Mackerras <paulus@samba.org>
Date: Mon, 29 Aug 2005 03:10:20 +0000
Subject: ppp-2.4.4b1 released
Message-Id: <17170.31900.251643.605643@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I have just put ppp-2.4.4b1.tar.gz on the samba.org ftp server at:

ftp://ftp.samba.org/pub/ppp/ppp-2.4.4b1.tar.gz

This is mostly a bug-fix release, with many bugs fixed to do with
persist mode and demand dialling.  The one new feature is that pppd
now runs an /etc/ppp/ip-pre-up script after creating the ppp interface
and putting the negotiated IP addresses on it but before marking it
up.  Since pppd waits for this script to finish, it must run quickly.

Please test.  If there are no problems with it, I will re-release it
as ppp-2.4.4 final.

Paul.
