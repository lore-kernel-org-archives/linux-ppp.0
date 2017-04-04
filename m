From: "Reshetova, Elena" <elena.reshetova@intel.com>
Date: Tue, 04 Apr 2017 10:07:55 +0000
Subject: RE: [PATCH 16/16] drivers, net, intersil: convert request_context.refcount from atomic_t to refcount
Message-Id: <2236FBA76BA1254E88B949DDB74E612B41C8741B@IRSMSX102.ger.corp.intel.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1490691403-4016-1-git-send-email-elena.reshetova@intel.com>
 <1490691403-4016-17-git-send-email-elena.reshetova@intel.com>
 <87zifxn2gb.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87zifxn2gb.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "peterz@infradead.org" <peterz@infradead.org>, "matanb@mellanox.com" <matanb@mellanox.com>, "paulus@samba.org" <paulus@samba.org>, "nbd@openwrt.org" <nbd@openwrt.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "saeedm@mellanox.com" <saeedm@mellanox.com>, "ganeshgr@chelsio.com" <ganeshgr@chelsio.com>, Hans Liljestrand <ishkamiel@gmail.com>, David Windsor <dwindsor@gmail.com>, "keescook@chromium.org" <keescook@chromium.org>, "j@w1.fi" <j@w1.fi>, "ajk@comnets.uni-bremen.de" <ajk@comnets.uni-bremen.de>, "leonro@mellanox.com" <leonro@mellanox.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "blogic@openwrt.org" <blogic@openwrt.org>, netdev@vger.kernel.org


> Elena Reshetova <elena.reshetova@intel.com> writes:
> 
> > refcount_t type and corresponding API should be
> > used instead of atomic_t when the variable is used as
> > a reference counter. This allows to avoid accidental
> > refcounter overflows that might lead to use-after-free
> > situations.
> >
> > Signed-off-by: Elena Reshetova <elena.reshetova@intel.com>
> > Signed-off-by: Hans Liljestrand <ishkamiel@gmail.com>
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > Signed-off-by: David Windsor <dwindsor@gmail.com>
> > ---
> >  drivers/net/wireless/intersil/orinoco/orinoco_usb.c | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> The prefix should be "orinoco_usb:", I'll fix that.

Thanks for both! Will you take the patches in?

Best Regards,
Elena.

> 
> --
> Kalle Valo
