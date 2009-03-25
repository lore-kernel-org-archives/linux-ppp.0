From: Alexey Mahotkin <squadette@gmail.com>
Date: Wed, 25 Mar 2009 14:33:58 +0000
Subject: [PATCH] three patches from Fedora to current pppd
Message-Id: <bb5b640b0903250733s7d8f5b4ewf37b22620bbfcce2@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

hi,

We're working on some updates to Radius plugin, and I think it could
be useful to incorporate three outstanding patches from Fedora:

commit 4cb4db1ea790357444fd63b68f28e66eed6f8a86
Author: David Woodhouse <dwmw2@redhat.com>
Date:   Wed Mar 25 17:11:28 2009 +0300

    Implement ipv6cp-accept-remote, and document ipv6cp-accept-*

    (Taken from Fedora ppp-2.4.3-ipv6-accept-remote.patch)

commit 0a1b2cf863ac90559e1656c947ffae736fd9f61e
Author: Thomas Woerner <twoerner@redhat.com>
Date:   Wed Mar 25 17:05:07 2009 +0300

    Fix compilation warnings and unused headers

    (taken from ppp-2.4.3-fix.patch in Fedora RPM)

commit ca8da3bf33f5bce8e1719aca77e69779eb19c97e
Author: Alexey Mahotkin <squadette@gmail.com>
Date:   Wed Mar 25 16:57:07 2009 +0300

    Remove unused code

    Fedora even patches this code in ppp-2.4.1-varargs.patch, even
though it is not used

The tree is available here:
http://github.com/squadette/pppd/commits/for-upstream/ (for-upstream
branch in git://github.com/squadette/pppd.git).

Thank you,

-- 
Alexey Mahotkin
http://squadette.ru/
