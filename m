From: James Cameron <james.cameron@hp.com>
Date: Thu, 05 Mar 2009 22:25:47 +0000
Subject: [PATCH] Fix formatting, reported by Peter Lyall Easthope
Message-Id: <20090305222547.GB3368@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Mar 05, 2009 at 11:30:13AM -0500, Charlie Brady wrote:
> Here's your chance - submit a patch.

It would take longer to explain how to do it or submit the original mail
again.  ;-)

Signed-off-by: james.cameron@hp.com

---
 pppd/pppd.8 |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/pppd/pppd.8 b/pppd/pppd.8
index 8ea8200..2ab51e5 100644
--- a/pppd/pppd.8
+++ b/pppd/pppd.8
@@ -1713,6 +1713,7 @@ links, used for matching links to bundles in multilink operation.  May
 be examined by external programs to obtain information about running
 pppd instances, the interfaces and devices they are using, IP address
 assignments, etc.
+.TP
 .B /etc/ppp/pap\-secrets
 Usernames, passwords and IP addresses for PAP authentication.  This
 file should be owned by root and not readable or writable by any other
-- 
1.6.1.3

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
