From: Tejun Heo <htejun@gmail.com>
Date: Mon, 20 Sep 2010 21:26:47 +0000
Subject: Re: idr_get_new_exact ?
Message-Id: <4C97D197.9070703@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTi=ZLupVyFR0e2v-TLpeNWdw1bVMZUAhgyxLJ7OV@mail.gmail.com> <adaiq20f90h.fsf@cisco.com>
In-Reply-To: <adaiq20f90h.fsf@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <rdreier@cisco.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-kernel@vger.kernel.org, "Jean Delvare (PC drivers, core)" <khali@linux-fr.org>, "Ben Dooks (embedded platforms)" <ben-linux@fluff.org>, Roland Dreier <rolandd@cisco.com>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, Steve Wise <swise@chelsio.com>, Neil Brown <neilb@suse.de>, Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org, linux-rdma@vger.kernel.org, dm-devel@redhat.com, linux-raid@vger.kernel.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, akpm@linux-foundation.org

Hello,

On 09/20/2010 10:35 PM, Roland Dreier wrote:
> Looks fine to me as an improvement over the status quo, but I wonder how
> many of these places could use the radix_tree stuff instead?  If you're
> not using the ability of the idr code to assign an id for you, then it
> seems the radix_tree API is a better fit.

I agree.  Wouldn't those users better off simply using radix tree?

Thanks.

-- 
tejun
