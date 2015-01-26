From: Lee Essen <lee.essen@nowonline.co.uk>
Date: Mon, 26 Jan 2015 18:32:55 +0000
Subject: Re: multiple pppd instances -- resolv.conf challenges and suggested improvement
Message-Id: <6F6AA388-7F8D-4BE6-9C7E-D4F28E35B182@nowonline.co.uk>
List-Id: <linux-ppp.vger.kernel.org>
References: <68DDEA33-3E3A-456B-BFF4-14209A181864@nowonline.co.uk>
In-Reply-To: <68DDEA33-3E3A-456B-BFF4-14209A181864@nowonline.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

Hi Bill,

Thanks for the reply, I acknowledge that the buildroot approach is suboptimal, however it doesn't seem right that every instance of pppd will write to the same file regardless or what you choose to do with it!

In order to get clever (prioritise for example) with multiple instances I need to use either separate resolv.conf files, or do the work in the ppp-up script. The latter approach is perfectly acceptable, however having all the pppd processes overwriting the same resolv.conf file in a completely non-deterministic way seems wrong to me??

I realise that my particular problem with buildroot is more problematic than non-buildroot people would experience (and I'm quite happy to solve it with my proposed patch) but I thought it worth suggesting.

Lee.


> On 26 Jan 2015, at 20:57, Bill Unruh <unruh@physics.ubc.ca> wrote:
> 
> Your proposal already exists. That was why it was made /etc/ppp/resolv.conf.
> You simply do not make a link from /etc/resolv.conf to /etc/ppp/resolv.conf
> and your system will not use /etc/ppp/resolv.conf. The system itself always
> uses /etc/resolv.conf, so you have to work to make it use
> /etc/ppp/resolv.conf.
> 
> 
>> On Mon, 26 Jan 2015, Lee Essen wrote:
>> 
>> Hi,
>> 
>> I’ve hit a bit of a challenge with the way that pppd creates the resolv.conf file.
>> 
>> Basically if you want to get dns servers from the other side you need ‘usepeerdns’ set.
>> 
>> If you set ‘usepeerdns’ then pppd will create resolve.conf (/etc/ppp/resolv.conf as standard, although changed in many dists)
>> 
>> The challenge is that if you have two pppd’s running, both getting DNS entries, then there is no way to specify a different file (so that you can be clever later) and the given file will be overwritten by the most recent connection. Also, with buiildroot builds the path is set to /etc/resolv.conf which causes even more of a problem since you can’t ‘usepeerdns’ without making your system use the provided resolvers.
>> 
>> It does feel wrong that just about every other aspect of pppd supports isolated multiple connections, but the resolv.conf file is a single path that will get overwritten by the last connection, and then, of course, if that connection drops the file is then incorrect!
>> 
>> Could I suggest a ‘noresolv’ config option that simply suppresses the creation of the resolve.conf file?  It’s a very simple patch, has no compatibility issues with existing configuration and makes it possible to use ppp-up scripts to do the heavy lifting with no conflicting resolv.conf creations. This would also allow buildroot users to avoid the “forced use of peer dns”.
>> 
>> (The other option would be to have a configurable path for resolv.conf)
>> 
>> Cheers,
>> 
>> Lee.
>> 
>> 
>> diff -Naur pppd-orig/pppd/ipcp.c pppd-2.4.7/pppd/ipcp.c
>> --- pppd-orig/pppd/ipcp.c    2014-08-09 13:31:39.000000000 +0100
>> +++ pppd-2.4.7/pppd/ipcp.c    2015-01-26 07:27:04.758264172 +0000
>> @@ -91,6 +91,7 @@
>> static int default_route_set[NUM_PPP];    /* Have set up a default route */
>> static int proxy_arp_set[NUM_PPP];    /* Have created proxy arp entry */
>> static bool usepeerdns;            /* Ask peer for DNS addrs */
>> +static bool noresolv;            /* Don't write resolv.conf */
>> static int ipcp_is_up;            /* have called np_up() */
>> static int ipcp_is_open;        /* haven't called np_finished() */
>> static bool ask_for_local;        /* request our address from peer */
>> @@ -209,6 +210,8 @@
>> 
>>    { "usepeerdns", o_bool, &usepeerdns,
>>      "Ask peer for DNS address(es)", 1 },
>> +    { "noresolv", o_bool, &noresolv,
>> +      "disable creation of the resolv.conf file", 1 },
>> 
>>    { "netmask", o_special, (void *)setnetmask,
>>      "set netmask", OPT_PRIO | OPT_A2STRVAL | OPT_STATIC, netmask_str },
>> @@ -1827,6 +1830,7 @@
>>    script_setenv("DNS2", ip_ntoa(go->dnsaddr[1]), 0);
>>    if (usepeerdns && (go->dnsaddr[0] || go->dnsaddr[1])) {
>>    script_setenv("USEPEERDNS", "1", 0);
>> +    if (!noresolv)
>>    create_resolv(go->dnsaddr[0], go->dnsaddr[1]);
>>    }
>> 
>> 
>> 
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
