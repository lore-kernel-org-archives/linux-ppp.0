From: "Jonathan Goodchild" <jon.goodchild@farsite.co.uk>
Date: Thu, 03 Mar 2005 17:37:04 +0000
Subject: syncppp and rejected magic numbers
Message-Id: <7C078C66B7752B438B88E11E5E20E72E010962F3@general.hq.farsitecommunications.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

There appears to be a bug in SYNCPPP - if it receives a Configure Reject
for the LCP Magic Number option, it doesn't remove the Magic Number
option from the next Configure Request, but sends the same thing again.

Consequently the LCP negotiation fails to converge.

Fortunately (from my point of view), I can change the PPP implementation
which led me to discover this behaviour, so it's not going to cause me a
problem, but it might do someone else...

---
Jonathan Goodchild
