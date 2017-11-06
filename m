From: Vasily Averin <vvs@virtuozzo.com>
Date: Mon, 06 Nov 2017 13:50:49 +0000
Subject: Re: [PATCH v3 04/21] ppp: exit_net cleanup checks added
Message-Id: <f056b60c-bb9f-76fb-4550-c1d332757b56@virtuozzo.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <5e005fe5-e8b2-eee8-b185-a9e5fc1d7996@virtuozzo.com>
In-Reply-To: <5e005fe5-e8b2-eee8-b185-a9e5fc1d7996@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Dear Walter,
thank you for feedback, I'll do it next time.

Changes was listed in cover letter, that was not not submitted into linux-ppp@ list

"This patch set checks that lists initialized in net_init hooks were
return to initial state at end of net_exit hooks.

I hope such checks allows to detect leaked per-netns objects.
Also I hope that all new pernet_operations will inherit such checks too.

I assume that elements added into per-net lists should not live longer than net namespace,
and should be deleted from the list. I think exit_net hook is good place for such check.

Recently I've found lost list_entry and enabled timer on stop of net namespace.
Then I've reviewed all existing pernet_operations and found that many drivers
have such checks already. So I decided to complete this task and add such checks
into all affected subsystems.

v3:
- use net->ns.inum as net Id
- removed patches for hashlimit and recent,
    they handle tables list in exit_net hook.
- added patches for grace and lockd

v2:
- net pointer removed from output
- fixed compilation for phonet driver
"

On 2017-11-06 16:34, walter harms wrote:
> Hello Vasily Averin,
> just a general hint:
> when you send new versions of a patch please document also
> what you have changed. Here an example from an other ML:
> 
> The problematic code looks like this:
> 
> 	res_seq = res_hdr->xd_hdr.length_sn & TB_XDOMAIN_SN_MASK;
> 	res_seq >>= TB_XDOMAIN_SN_SHIFT;
> 
> TB_XDOMAIN_SN_SHIFT is 27, and right shifting a u8 27 bits is always
> going to result in zero.  The fix is to declare these variables as u32.
> 
> Fixes: d1ff70241a27 ("thunderbolt: Add support for XDomain discovery protocol")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: I accidentally sent this through the wrong list, so I'm resending to
>     netdev.  Also Mika asked me to split it up because the Fixes tags
>     are different for these patches.
> 
> 
> please notice the V2. that tell the reader what has changes against
> the V1.
> 
> re,
>  wh
> 
> Am 06.11.2017 14:23, schrieb Vasily Averin:
>> Be sure that lists initialized in net_init hook were return
>> to initial state.
>>
>> Signed-off-by: Vasily Averin <vvs@virtuozzo.com>
>> ---
>>  drivers/net/ppp/ppp_generic.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
>> index e365866..c0861d1 100644
>> --- a/drivers/net/ppp/ppp_generic.c
>> +++ b/drivers/net/ppp/ppp_generic.c
>> @@ -960,6 +960,12 @@ static __net_exit void ppp_exit_net(struct net *net)
>>  	rtnl_unlock();
>>  
>>  	idr_destroy(&pn->units_idr);
>> +	WARN_ONCE(!list_empty(&pn->all_channels),
>> +		  "net %x %s: all_channels list is not empty\n",
>> +		  net->ns.inum, __func__);
>> +	WARN_ONCE(!list_empty(&pn->new_channels),
>> +		  "net %x %s: new_channels list is not empty\n",
>> +		  net->ns.inum, __func__);
>>  }
>>  
>>  static struct pernet_operations ppp_net_ops = {
> 
