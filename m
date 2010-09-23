From: Tejun Heo <htejun@gmail.com>
Date: Thu, 23 Sep 2010 11:46:29 +0000
Subject: Re: idr_get_new_exact ?
Message-Id: <4C9B3E15.5080002@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTi=ZLupVyFR0e2v-TLpeNWdw1bVMZUAhgyxLJ7OV@mail.gmail.com> <adaiq20f90h.fsf@cisco.com> <4C97D197.9070703@gmail.com> <20100923114255.GB27960@linux-sh.org>
In-Reply-To: <20100923114255.GB27960@linux-sh.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Mundt <lethal@linux-sh.org>
Cc: Roland Dreier <rdreier@cisco.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-kernel@vger.kernel.org, "Jean Delvare (PC drivers, core)" <khali@linux-fr.org>, "Ben Dooks (embedded platforms)" <ben-linux@fluff.org>, Roland Dreier <rolandd@cisco.com>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, Steve Wise <swise@chelsio.com>, Neil Brown <neilb@suse.de>, Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org, linux-rdma@vger.kernel.org, dm-devel@redhat.com, linux-raid@vger.kernel.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Alasdair G Kergon <agk@redhat.com>

Hello,

On 09/23/2010 01:42 PM, Paul Mundt wrote:
> On Mon, Sep 20, 2010 at 11:26:47PM +0200, Tejun Heo wrote:
>> Hello,
>>
>> On 09/20/2010 10:35 PM, Roland Dreier wrote:
>>> Looks fine to me as an improvement over the status quo, but I wonder how
>>> many of these places could use the radix_tree stuff instead?  If you're
>>> not using the ability of the idr code to assign an id for you, then it
>>> seems the radix_tree API is a better fit.
>>
>> I agree.  Wouldn't those users better off simply using radix tree?
>>
> It could go either way. I was about to write the same function when
> playing with it for IRQ mapping, the idea being to propagate the initial
> tree with sparse static vectors and then switch over to dynamic IDs for
> virtual IRQ creation. I ended up going with a radix tree for other
> reasons, though.

I see.  If there are use cases where fixed and dynamic IDs need to be
mixed, no objection from me.

Thanks.

-- 
tejun
