From: Guillaume Nault <g.nault@alphalink.fr>
Date: Thu, 28 Apr 2016 15:55:20 +0000
Subject: [PATCH v4 net-next 0/2] ppp: add rtnetlink support
Message-Id: <20160428155520.GA24342@alphalink.fr>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: linux-ppp@vger.kernel.org, Paul Mackerras <paulus@samba.org>, David Miller <davem@davemloft.net>, Stephen Hemminger <stephen@networkplumber.org>, walter harms <wharms@bfs.de>

PPP devices lack the ability to be customised at creation time. In
particular they can't be created in a given netns or with a particular
name. Moving or renaming the device after creation is possible, but
creates undesirable transient effects on servers where PPP devices are
constantly created and removed, as users connect and disconnect.
Implementing rtnetlink support solves this problem.

The rtnetlink handlers implemented in this series are minimal, and can
only replace the PPPIOCNEWUNIT ioctl. The rest of PPP ioctls remains
necessary for any other operation on channels and units.
It is perfectly possible to mix PPP devices created by rtnl
and by ioctl(PPPIOCNEWUNIT). Devices will behave in the same way.

mutex_trylock() is used to resolve the locking issue wrt. locking
dependency between rtnl_lock() and ppp_mutex (see ppp_nl_newlink() in
patch #2).

A user visible difference brought by this series is that old PPP
interfaces (those created with ioctl(PPPIOCNEWUNIT)), can now be
removed by "ip link del", just like new rtnl based PPP devices.


Changes since v3:
  - Rebase on net-next.
  - Not an RFC anymore.

Changes since v2:
  - Define ->rtnl_link_ops for ioctl based PPP devices, so they can
    handle rtnl messages just like rtnl based ones (suggested by
    Stephen Hemminger).
  - Move back to original lock ordering between ppp_mutex and rtnl_lock
    to simplify patch series. Handle lock inversion issue using
    mutex_trylock() (suggested by Stephen Hemminger).
  - Do file descriptor lookup directly in ppp_nl_newlink(), to simplify
    ppp_dev_configure().

Changes since v1:
  - Rebase on net-next.
  - Invert locking order wrt. ppp_mutex and rtnl_lock and protect
    file->private_data with ppp_mutex.


Guillaume Nault (2):
  ppp: define reusable device creation functions
  ppp: add rtnetlink device creation support

 drivers/net/ppp/ppp_generic.c | 315 ++++++++++++++++++++++++++++++------------
 include/uapi/linux/if_link.h  |   8 ++
 2 files changed, 235 insertions(+), 88 deletions(-)

-- 
2.8.1

