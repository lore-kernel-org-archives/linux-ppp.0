From: Clifford Kite <kite_linux-ppp@ev1.net>
Date: Mon, 26 Jul 2004 23:26:37 +0000
Subject: 2.6.6 kernel, active-filter completely stops idle reset (repost)
Message-Id: <Pine.LNX.4.21.0407261807110.25153-100000@corncob.localhost.tld>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.21.0406271108100.489-100000@corncob.localhost.tld>
In-Reply-To: <Pine.LNX.4.21.0406271108100.489-100000@corncob.localhost.tld>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Below is a copy of an email sent to this mailing list on June 27, 2004,
to which there has been no reply.  So here it is again.  If anyone
knows why the pppd active-filter option broke under the 2.6.6 kernel
then *please* respond.  If anyone even knows of a part of the kernel,
aside from PPP support, that might cause the problem then please respond.

Apparently the list is not entirely dead since I received an inquiry
today, from someone that read the post, as to whether I had found out
what was wrong.  He said it's still broken in the 2.6.7 kernel (the
latest at the time of this writing).

TIA
---
Clifford Kite                                 http://ckite.no-ip.net

---------- Forwarded message ----------
Date: Sun, 27 Jun 2004 16:46:48 -0500 (CDT)
From: Clifford Kite <kite_linux-ppp@ev1.net>
To: linux-ppp@vger.kernel.org
Subject: 2.6.6 kernel, active-filter completely stops idle reset

Background
----------
2.6.6 kernel compiled from a standard kernel.org source package with
"make oldconfig" and the .config of a 2.6.4 kernel (also compiled here
from a kernel.org source package).

Pppd 2.4.2 compiled from a standard samba.org source package.  It has been
patched to correct a bug, and to correctly reset the terminal line settings
in most instances.

Regular PPP landline connection.
----------

The active-filter configuration is

active-filter '(outbound and not (icmp[0] = 0))'

and is used with the "idle 300" option.  This should prevent any inbound
traffic or outbound ping replies from resetting the idle timer, while
allowing outbound traffic, other than a ping reply, to reset it.  Which
it does with the 2.6.4 kernel, and with 2.4.x kernels as well.

With the 2.4.6 kernel the PPP link comes down after 300 seconds regardless
of the activity on the link.  E.g., "ping -i 280 192.168.5.33" doesn't keep
the link up, but it also seems to be true for any other type of activity,
incoming or outgoing.  The idle timer is apparently not reset.  A link that
is brought up without the active-filter option behaves normally, both with
and without the idle option.

I looked briefly through the Changes at kernel.org but didn't see anything
directly related to PPP that sounded like it might cause this.  Even so, it
seems to me rather unlikely that it is the result of something I did wrong,
or have not done but need to do.

Any feedback?  Or is this list dead?  It's been a long time since I've
received any email from it.

---
Clifford Kite                                 http://ckite.no-ip.net



