From: Michal Ostrowski <mostrows@earthlink.net>
Date: Fri, 02 Jun 2006 18:35:43 +0000
Subject: Re: 4 adsl lines in one nic
Message-Id: <1149273344.6507.163.camel@brick>
List-Id: <linux-ppp.vger.kernel.org>
References: <20060602131035.sdpe7qwh59c084ow@webmail.fcq.unc.edu.ar>
In-Reply-To: <20060602131035.sdpe7qwh59c084ow@webmail.fcq.unc.edu.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Ah... do you know if you are even using the kernel-assisted pppoe?  I
assume that is not the case. 


On Fri, 2006-06-02 at 14:04 -0300, Marcos Dione wrote:
> Quoting Michal Ostrowski <mostrows@earthlink.net>:
> > The Linux kernel component identifies PPPoE sessions using (SID,MAC
> > ADDR) pairs.  Thus, it should handle this case correctly.
> > (See /proc/net/pppoe for a current listing of active sessions.)
> 
>   I have no such file here, not even in the whole /proc tree. kernel version
> is 2.6.15-1-686 from debian etch.
> 
-- 
Michal Ostrowski <mostrows@earthlink.net>

