From: Eric Biggers <ebiggers@kernel.org>
Date: Thu, 05 Dec 2019 05:54:19 +0000
Subject: [PATCH] ppp: fix out-of-bounds access in bpf_prog_create()
Message-Id: <20191205055419.13435-1-ebiggers@kernel.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <20191205052220.GC1158@sol.localdomain>
In-Reply-To: <20191205052220.GC1158@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Al Viro <viro@zeniv.linux.org.uk>
Cc: Paul Mackerras <paulus@samba.org>, bpf@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, syzbot <syzbot+eb853b51b10f1befa0b7@syzkaller.appspotmail.com>, syzkaller-bugs@googlegroups.com

From: Eric Biggers <ebiggers@google.com>

sock_fprog_kern::len is in units of struct sock_filter, not bytes.

Fixes: 3e859adf3643 ("compat_ioctl: unify copy-in of ppp filters")
Reported-by: syzbot+eb853b51b10f1befa0b7@syzkaller.appspotmail.com
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 drivers/net/ppp/ppp_generic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 0cb1c2d0a8bc..3bf8a8b42983 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -564,8 +564,9 @@ static struct bpf_prog *get_filter(struct sock_fprog *uprog)
 		return NULL;
 
 	/* uprog->len is unsigned short, so no overflow here */
-	fprog.len = uprog->len * sizeof(struct sock_filter);
-	fprog.filter = memdup_user(uprog->filter, fprog.len);
+	fprog.len = uprog->len;
+	fprog.filter = memdup_user(uprog->filter,
+				   uprog->len * sizeof(struct sock_filter));
 	if (IS_ERR(fprog.filter))
 		return ERR_CAST(fprog.filter);
 
-- 
2.24.0
