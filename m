From: Paul Mackerras <paulus@samba.org>
Date: Sun, 10 Aug 2014 05:49:34 +0000
Subject: ppp-2.4.7 released
Message-Id: <20140810054934.GB17043@iris.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I have just released version 2.4.7 of the ppp package.  It's at the
usual place, ftp://ftp.samba.org/pub/ppp/.

The main reason for the release is to fix a potential security
vulnerability that has been discovered.  The vulnerability may enable
an unprivileged attacker to access privileged options, though I am not
aware of any complete working exploit.  This vulnerability has a CVE
id, CVE-2014-3158.

Paul.
