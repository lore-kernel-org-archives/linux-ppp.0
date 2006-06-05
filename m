From: Michal Ostrowski <mostrows@earthlink.net>
Date: Mon, 05 Jun 2006 14:34:11 +0000
Subject: Re: 4 adsl lines in one nic
Message-Id: <1149518051.6507.200.camel@brick>
List-Id: <linux-ppp.vger.kernel.org>
References: <20060602131035.sdpe7qwh59c084ow@webmail.fcq.unc.edu.ar>
In-Reply-To: <20060602131035.sdpe7qwh59c084ow@webmail.fcq.unc.edu.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, 2006-06-05 at 11:29 -0300, Marcos Dione wrote:
> Quoting Michal Ostrowski <mostrows@earthlink.net>:
> > Ah... do you know if you are even using the kernel-assisted pppoe?  I
> > assume that is not the case.
> 
>   I really don't know. I don't see any loaded module except these:
> 
> $ lsmod
> Module                  Size  Used by
> ppp_deflate             5664  0
> zlib_deflate           20536  1 ppp_deflate
> bsd_comp                5376  0
> ppp_async               9952  4
> crc_ccitt               1952  1 ppp_async
> ppp_generic            25844  19 ppp_deflate,bsd_comp,ppp_async
> slhc                    6240  1 ppp_generic
> 

The answer is... no.

The only PPPoE code in the picture is the plugin.


-- 
Michal Ostrowski <mostrows@earthlink.net>

