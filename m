From: "Michael St. Laurent" <mikes@hartwellcorp.com>
Date: Thu, 12 Apr 2007 22:55:45 +0000
Subject: Not seeing "peer authentication succeeded" messages in syslog
Message-Id: <3BF93070B3D1B047BA7ABF612958950D018FB8D0@hcex.hartwellcorp.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello,

A little bit back I turned on authenticating with winbind as well as the
logwtmp option and ever since then I'm not getting the peer
authentication succeeded messages in syslog.

Since the perl script I am using for reporting is using those lines I
would like to find out if there is a way to make them appear again.
