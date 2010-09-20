From: Alasdair G Kergon <agk@redhat.com>
Date: Mon, 20 Sep 2010 21:38:25 +0000
Subject: Re: [dm-devel] idr_get_new_exact ?
Message-Id: <20100920213825.GF30622@agk-dp.fab.redhat.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTi=ZLupVyFR0e2v-TLpeNWdw1bVMZUAhgyxLJ7OV@mail.gmail.com> <adaiq20f90h.fsf@cisco.com> <4C97D197.9070703@gmail.com>
In-Reply-To: <4C97D197.9070703@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: device-mapper development <dm-devel@redhat.com>, Roland Dreier <rdreier@cisco.com>, Ohad Ben-Cohen <ohad@wizery.com>, akpm@linux-foundation.org, Steve Wise <swise@chelsio.com>, linux-

On Mon, Sep 20, 2010 at 11:26:47PM +0200, Tejun Heo wrote:
> I agree.  Wouldn't those users better off simply using radix tree?
 
Can't speak for the other users, but dm uses it both ways - normally
happy with any id (minor number), but sometimes user requires a specific
one.

Alasdair

