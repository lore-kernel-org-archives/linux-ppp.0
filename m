From: David Fernandez <david.fernandez.work@googlemail.com>
Date: Tue, 24 Oct 2017 15:13:32 +0000
Subject: Re: kernel-mode PPPoE does not seem able to work with MPPE.
Message-Id: <0dc6e608-f91d-1c08-9dc1-69d114efa728@googlemail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <158d6529-c9ae-a991-ca47-76e558a1209c@googlemail.com>
In-Reply-To: <158d6529-c9ae-a991-ca47-76e558a1209c@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

On 24/10/17 15:17, Christoph Schulz wrote:
> Hello!
>
> David Fernandez <david.fernandez.work@googlemail.com> schrieb am Di 24 
> Okt 2017 10:52:46 CEST:
>
>> Hi there,
>>
>> I've tried to run MPPE in a PPPoE connection to my LEDE linux server. 
>> The log is below.
>> [...]
>> Although it should not be needed, if I use the option require-mppe, 
>> pppd complains of unrecognized option.
>
> As the sources only define (and understand) the "require-mppe" option 
> iff the preprocessor symbol MPPE has been defined during compilation, 
> I suspect that your (i.e. LEDE's) pppd has been compiled without MPPE 
> support. You should check this first.
>
Hi Christoph,

The MPPE is defined, as I see code conditionally compiled with #ifdef 
MPPE putting things in the log, like:
Feb  2 12:05:22 LEDE pppd[1580]: MPPE 128-bit stateful compression enabled

AFAICS the downloaded 2.4.7 sources in pppd/ccp.c define and understand 
the option mppe or +mppe with special arguments 
no40,no56,no128,stateless,required comma separated, as per int 
setmppe(char **argv) function... unless I am getting something wrong, 
obviously.

These are the options defined in ccp.c:
#ifdef MPPE
     { "mppc", o_bool, &ccp_wantoptions[0].mppc,
       "request MPPC compression", 1, &ccp_allowoptions[0].mppc },
     { "+mppc", o_bool, &ccp_wantoptions[0].mppc,
       "request MPPC compression", 1, &ccp_allowoptions[0].mppc, 
OPT_ALIAS },
     { "nomppc", o_bool, &ccp_wantoptions[0].mppc,
       "don't allow MPPC compression", OPT_PRIOSUB | OPT_A2CLR,
       &ccp_allowoptions[0].mppc },
     { "-mppc", o_bool, &ccp_wantoptions[0].mppc,
       "don't allow MPPC compression", OPT_ALIAS | OPT_PRIOSUB | OPT_A2CLR,
       &ccp_allowoptions[0].mppc },
     { "mppe", o_special, (void *)setmppe,
       "request MPPE encryption" },
     { "+mppe", o_special, (void *)setmppe,
       "request MPPE encryption" },
     { "nomppe", o_special_noarg, (void *)setnomppe,
       "don't allow MPPE encryption" },
     { "-mppe", o_special_noarg, (void *)setnomppe,
       "don't allow MPPE encryption" },
#endif /* MPPE */

These are the download definitions:
PKG_NAME:=ppp
PKG_VERSION:=2.4.7
PKG_RELEASE:

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://download.samba.org/pub/ppp/
PKG_HASH:e0a3dd3e4799e33103f70ec7df75348c8540966ee7c948e4ed8a42bbccfb30


>
> Regards,
>
> Christoph Schulz
>
Regards

David

