From: Till Immanuel Patzschke <tip@prs.de>
Date: Thu, 29 Jul 2004 19:54:35 +0000
Subject: PPPoA driver calls ppp_unregister_channel from invalid context
Message-Id: <410955FB.8030606@prs.de>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

in case a VCC is being closed, pppoatm calls pppoatm_unassign_vcc (from 
pppoatm_push), which calls ppp_unregister_channel.  However the context 
pppoatm_push is running in is not "process context" as demanded by 
ppp_unregister_channel, resulting in (valid) warning messages, like the 
one below.
The kernel is 2.6.7, the ATM card is a Fore HE155 (which shouldn't 
matter since pppoatm_push is definitely not "process context".

What would be the right way of unregistering the channel in case the VCC 
is being closed (or imagine a native PPPoEoA driver [yes, not using 
br2684...]) receiving a PADT, so one has to initiate an unregister from 
the driver?

Rganks for the help,

Immanuel


Jul 28 16:09:34 ipat06 kernel: Debug: sleeping function called from 
invalid context at include/linux/rwsem.h:66
Jul 28 16:09:34 ipat06 kernel: in_atomic():1, irqs_disabled():1
Jul 28 16:09:34 ipat06 kernel:  [dump_stack+30/32] dump_stack+0x1e/0x20
Jul 28 16:09:34 ipat06 kernel:  [<c01080de>] dump_stack+0x1e/0x20
Jul 28 16:09:34 ipat06 kernel:  [__might_sleep+199/224] 
__might_sleep+0xc7/0xe0
Jul 28 16:09:34 ipat06 kernel:  [<c011ff57>] __might_sleep+0xc7/0xe0
Jul 28 16:09:34 ipat06 kernel:  [pg0+945292153/1068032000] 
ppp_unregister_channel+0x39/0x3e0 [ppp_generic]
Jul 28 16:09:34 ipat06 kernel:  [<f8af0379>] 
ppp_unregister_channel+0x39/0x3e0 [ppp_generic]
...

-- 
Till Immanuel Patzschke, CTO
Q Inc



