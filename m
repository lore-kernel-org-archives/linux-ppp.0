From: Paul Mundt <lethal@linux-sh.org>
Date: Thu, 23 Sep 2010 11:42:55 +0000
Subject: Re: idr_get_new_exact ?
Message-Id: <20100923114255.GB27960@linux-sh.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTi=ZLupVyFR0e2v-TLpeNWdw1bVMZUAhgyxLJ7OV@mail.gmail.com> <adaiq20f90h.fsf@cisco.com> <4C97D197.9070703@gmail.com>
In-Reply-To: <4C97D197.9070703-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tejun Heo <htejun-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Roland Dreier <rdreier-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Jean Delvare (PC drivers, core)" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "Ben Dooks (embedded platforms)" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Steve Wise <swise-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>, Neil Brown <neilb-l3A5Bk7waGM@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dm-devel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-raid-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-ppp-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org

On Mon, Sep 20, 2010 at 11:26:47PM +0200, Tejun Heo wrote:
> Hello,
> 
> On 09/20/2010 10:35 PM, Roland Dreier wrote:
> > Looks fine to me as an improvement over the status quo, but I wonder how
> > many of these places could use the radix_tree stuff instead?  If you're
> > not using the ability of the idr code to assign an id for you, then it
> > seems the radix_tree API is a better fit.
> 
> I agree.  Wouldn't those users better off simply using radix tree?
> 
It could go either way. I was about to write the same function when
playing with it for IRQ mapping, the idea being to propagate the initial
tree with sparse static vectors and then switch over to dynamic IDs for
virtual IRQ creation. I ended up going with a radix tree for other
reasons, though.
