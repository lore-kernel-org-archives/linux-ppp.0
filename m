From: Anton Voronin <anton@chelcom.ru>
Date: Mon, 17 Jan 2005 07:13:04 +0000
Subject: Where to get correct kernel patches for MPPE?
Message-Id: <200501171213.04464.anton@chelcom.ru>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Greetings,

I've tried the latest version of that patch for 2.4.x kernel, but neither 
pppd-2.4.2 nor 2.4.3 is able to work with it. Both say that MPPE is not 
supported. Is there any MPPE patch for 2.4.x kernels that new pppd can work 
with?


Anton Voronin wrote:
> Hi everyone,
>
> I've got a problem with pppd-2.4.2 and 2.4.3 using MPPE with 2.4.x kernel.
> The ccp_test() function from sys-linux.c returns -1, however kernel has
> MPPE support (ppp_mppe module gets loaded). With pppd-2.4.1, however, it
> works fine. While ccp_test() seems to be identical between versions 2.4.1
> and 2.4.2/2.4.3 of pppd, I noticed difference in the opt_buf argument
> supplied to ccp_test():
>
> pppd-2.4.1:
> ===================
>         if(p[5] & MPPE_40BIT) {
>             keysize = 8;
>             BCOPY(mppe_master_send_key_40, opt_buf+3, keysize);
>             BCOPY(mppe_master_recv_key_40, opt_buf+11, keysize);
>         } else if(p[5] & MPPE_128BIT) {
>             keysize = 16;
>             BCOPY(mppe_master_send_key_128, opt_buf+3, keysize);
>             BCOPY(mppe_master_recv_key_128, opt_buf+19, keysize);
>         }
>         if(p[5] != 0) {
>             opt_buf[0]=CI_MPPE;
>             opt_buf[1]=CILEN_MPPE;
>             opt_buf[2] = (go->mppe_stateless) ? 1 : 0;
>             res = ccp_test(f->unit, opt_buf, (2*keysize)+3, 0);
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>         } else {
>             res = -1;
>         }
> ===================
>
> pppd-2.4.2/2.4.3:
> ===================
>     if (go->mppe) {
>         opt_buf[0] = CI_MPPE;
>         opt_buf[1] = CILEN_MPPE;
>         MPPE_OPTS_TO_CI(go->mppe, &opt_buf[2]);
>         /* Key material unimportant here. */
>         if (ccp_test(f->unit, opt_buf, CILEN_MPPE + MPPE_MAX_KEY_LEN, 0) <> 0) {
>             error("MPPE required, but kernel has no support.");
>             lcp_close(f->unit, "MPPE required but not available");
>         }
>     }
> ===================
>
> In both cases opt_buf[0] and opt_buf[1] are filled identically.
>
> However, in 2.4.1 only opt_buf[2] if filled, and then two keys are copied,
> while in 2.4.2/2.4.3 MPPE_OPTS_TO_CI() macro fills 4 more bytes of opt_buf
> (6 bytes total), and none of the keys are copied behind them. But, the 3rd
> argument (option length) is set to CILEN_MPPE + MPPE_MAX_KEY_LEN (whilch is
> equal to 6 + 16 = 22). Seems like the rest 16 bytes are left uninitialized
> (even not zeroes, just contain garbage).
>
> Is it a bug or I am using the wrong kernel patches, that behave
> differently? The file of patches I am using was called:
>
> linux-2.4.20-openssl-0.9.6b-mppe.patch
>
> Should this be something else?
>
> Best regards,

-- 
Anton Voronin
Intersvyaz JSC
http://www.chelcom.ru
+7 (3512) 655199
