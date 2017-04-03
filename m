From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 03 Apr 2017 11:38:49 +0000
Subject: Re: [PATCH 15/16] drivers, net, intersil: convert hostap_cmd_queue.usecnt from atomic_t to refcount_
Message-Id: <874ly5oh4m.fsf@kamboji.qca.qualcomm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1490691403-4016-1-git-send-email-elena.reshetova@intel.com>
        <1490691403-4016-16-git-send-email-elena.reshetova@intel.com>
In-Reply-To: <1490691403-4016-16-git-send-email-elena.reshetova-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
        (Elena Reshetova's message of "Tue, 28 Mar 2017 11:56:42 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Elena Reshetova <elena.reshetova-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hams-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-ppp-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ganeshgr-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org, nbd-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, yishaih-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, saeedm-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, matanb-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, leonro-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, ajk-iz34hMvxm2Hmj42eshorlhS11BummzK+@public.gmane.org, paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org, j@w1.fi, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Hans Liljestrand <ishkamiel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Windsor <dwindsor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Elena Reshetova <elena.reshetova@intel.com> writes:

> refcount_t type and corresponding API should be
> used instead of atomic_t when the variable is used as
> a reference counter. This allows to avoid accidental
> refcounter overflows that might lead to use-after-free
> situations.
>
> Signed-off-by: Elena Reshetova <elena.reshetova@intel.com>
> Signed-off-by: Hans Liljestrand <ishkamiel@gmail.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: David Windsor <dwindsor@gmail.com>
> ---
>  drivers/net/wireless/intersil/hostap/hostap_hw.c   | 12 ++++++------
>  drivers/net/wireless/intersil/hostap/hostap_wlan.h |  3 ++-
>  2 files changed, 8 insertions(+), 7 deletions(-)

The prefix should be "hostap:", I'll fix that.

-- 
Kalle Valo
