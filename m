From: "chas williams (contractor)" <chas@cmf.nrl.navy.mil>
Date: Fri, 30 Jul 2004 14:29:34 +0000
Subject: Re: [Linux-ATM-General] PPPoA driver calls ppp_unregister_channel from invalid context
Message-Id: <200407301429.i6UETXKr029024@ginger.cmf.nrl.navy.mil>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

actually, pppoatm_push() is sometimes called from process context.
in particular, vcc_release() will push a NULL skb to signal to the
next layer that a close is in progress and cleanup needs to be done.
vcc_release() only happens in process context.

can i see the full traceback?  i suspect the problem might be that
lock_sock() is going to spin_lock_bh() -- this is done in vcc_release()
around vcc_destroy_socket().

In message <410955FB.8030606@prs.de>,Till Immanuel Patzschke writes:
>Hi,
>
>in case a VCC is being closed, pppoatm calls pppoatm_unassign_vcc (from 
>pppoatm_push), which calls ppp_unregister_channel.  However the context 
>pppoatm_push is running in is not "process context" as demanded by 
>ppp_unregister_channel, resulting in (valid) warning messages, like the 
>one below.
>The kernel is 2.6.7, the ATM card is a Fore HE155 (which shouldn't 
>matter since pppoatm_push is definitely not "process context".
>
>What would be the right way of unregistering the channel in case the VCC 
>is being closed (or imagine a native PPPoEoA driver [yes, not using 
>br2684...]) receiving a PADT, so one has to initiate an unregister from 
>the driver?
>
>Rganks for the help,
>
>Immanuel
>
>
>Jul 28 16:09:34 ipat06 kernel: Debug: sleeping function called from 
>invalid context at include/linux/rwsem.h:66
>Jul 28 16:09:34 ipat06 kernel: in_atomic():1, irqs_disabled():1
>Jul 28 16:09:34 ipat06 kernel:  [dump_stack+30/32] dump_stack+0x1e/0x20
>Jul 28 16:09:34 ipat06 kernel:  [<c01080de>] dump_stack+0x1e/0x20
>Jul 28 16:09:34 ipat06 kernel:  [__might_sleep+199/224] 
>__might_sleep+0xc7/0xe0
>Jul 28 16:09:34 ipat06 kernel:  [<c011ff57>] __might_sleep+0xc7/0xe0
>Jul 28 16:09:34 ipat06 kernel:  [pg0+945292153/1068032000] 
>ppp_unregister_channel+0x39/0x3e0 [ppp_generic]
>Jul 28 16:09:34 ipat06 kernel:  [<f8af0379>] 
>ppp_unregister_channel+0x39/0x3e0 [ppp_generic]
>...
