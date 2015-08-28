From: "Murat Sezgin" <msezgin@codeaurora.org>
Date: Fri, 28 Aug 2015 19:01:51 +0000
Subject: kernel panic in pppoe_release
Message-Id: <003701d0e1c3$ff960b00$fec22100$@codeaurora.org>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi all,

We are using 3.4.103 kernel on our openwrt router platform. In the event of
interface down, we get kernel panic in the pppoe_release() function, because
the po->pppoe_dev comes to this function as NULL and dev_put() is called
without doing any NULL check.

I see that openwrt community has done an improvement for this issue with the
following commits in 3.18 and 4.0 kernels.

https://dev.openwrt.org/changeset/45653

I back ported these commits to our kernel and they increased the issue
occurrence frequency, but they didn't fix the issue completely. I ended up
that we need a NULL check in the pppoe_release() function as well. It seems
there is still a race between the pppoe_release() and the pppoe_flush_dev().
So, added the below change, but I would like to see whether this may have
side effects or not.

Can somebody please make comments on this?


@@ -589,7 +606,7 @@ static int pppoe_release(struct socket *sock)
 
        po = pppox_sk(sk);
 
-       if (sk->sk_state & (PPPOX_CONNECTED | PPPOX_BOUND | PPPOX_ZOMBIE)) {
+       if (po->pppoe_dev && sk->sk_state & (PPPOX_CONNECTED | PPPOX_BOUND |
PPPOX_ZOMBIE)) {
                dev_put(po->pppoe_dev);
                po->pppoe_dev = NULL;
        }

Regards,
Murat

