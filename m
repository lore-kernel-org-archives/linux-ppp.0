From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Thu, 26 Sep 2019 07:21:01 +0000
Subject: [PATCH 4/9] pppd: include time.h before using time_t
Message-Id: <1569482466-9551-5-git-send-email-dev.kurt@vandijck-laurijssen.be>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 include/net/ppp_defs.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/net/ppp_defs.h b/include/net/ppp_defs.h
index b06eda5..ed04486 100644
--- a/include/net/ppp_defs.h
+++ b/include/net/ppp_defs.h
@@ -35,6 +35,8 @@
  * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  */
 
+#include <time.h>
+
 #ifndef _PPP_DEFS_H_
 #define _PPP_DEFS_H_
 
-- 
1.8.5.rc3
