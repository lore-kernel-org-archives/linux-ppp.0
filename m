From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Sun, 17 Feb 2008 17:50:17 +0000
Subject: Incorrect comment about userspace in if_pppox.h
Message-Id: <alpine.LFD.1.00.0802171246590.8074@localhost.localdomain>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


  from if_pppox.h:

...
#ifdef  __KERNEL__
#include <linux/if_ether.h>
#include <linux/if.h>
#include <linux/netdevice.h>
#include <asm/semaphore.h>
#include <linux/ppp_channel.h>
#endif /* __KERNEL__ */
#include <linux/if_pppol2tp.h>

/* For user-space programs to pick up these definitions
 * which they wouldn't get otherwise without defining __KERNEL__
 */
...

  that comment's placing in that header file is confusing, since it's
not clear *what* definitions userspace would be missing if it didn't
define __KERNEL__.  i'd be tempted to just toss that comment.

rday
--

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
====================================
