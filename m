From: Clifford Kite <kite_linux-ppp@ev1.net>
Date: Mon, 02 Aug 2004 22:09:17 +0000
Subject: The active-filter option in 2.6.6 and 2.6.7
Message-Id: <Pine.LNX.4.21.0408021646530.5534-100000@corncob.localhost.tld>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Duh!  Apparently linux-ppp somehow lost me; the last email from this
list that I can find is dated May 12 2003.  So I didn't get a reply to my
last post here, but visiting vger.kernel.org today I saw there was one.
And I've re-subscribed.

As I've previously said, the code for the active-filter option in 2.6.6
and 2.6.7 doesn't work correctly.  However I have managed to find a fix:
Revert to the 2.6.5 ppp_generic.c.  I'm not really a C programmer so I
don't know what went wrong, but the changes in the code there from 2.6.5
to 2.6.6 are minimal and all appear related to the active-filter option.

I sincerely hope someone fixes it in a suitable way and the fix submitted
for the next kernel version.

---
Clifford Kite                                 http://ckite.no-ip.net

