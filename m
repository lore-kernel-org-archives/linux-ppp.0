From: "Grahame Jordan" <gbj@theforce.com.au>
Date: Tue, 07 Sep 2004 13:21:24 +0000
Subject: Re: ms-dns not working
Message-Id: <44301.203.20.16.2.1094563284.squirrel@webmail.theforce.com.au>
List-Id: <linux-ppp.vger.kernel.org>
References: <37478.203.20.16.2.1094389183.squirrel@webmail.theforce.com.au>
In-Reply-To: <37478.203.20.16.2.1094389183.squirrel@webmail.theforce.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

I added the DEBUG to the bit that does the DNS.  I do not get that DEBUG
in my logs. Hence it looks like it isn't being called.

pppd/ipcp.c

static int
setdnsaddr(argv)
    char **argv;
{
    u_int32_t dns;
    struct hostent *hp;
    warn("DEBUG: ipcp.c setdnsaddr");

    dns = inet_addr(*argv);

I have a Redhat9 box for dialup which is configured similarly which does
provide the ms-dns addresses.
However this Mandrake box with 2.6.x kernel is not setting the ms-dns on
the client.

What should I do to debug further?

Thanks

Grahame Jordan




> Grahame Jordan writes:
>> I am running a ppp server and it seems that ms-dns does not work.
>
> I don't see what in the logs you've provided would lead to that
> conclusion.
>
>> kdebug 7
>
> Don't use 'kdebug' unless you're hacking the kernel modules
> themselves.
>
>> netmask 255.255.255.224
>
> 'netmask' very likely doesn't do what you want here.
>
>> 203.20.16.1:203.20.16.11
>
> That looks like a proxy-ARP to me, but I see no "proxyarp" option.
> Are you sure?
>
>> ms-dns 203.20.16.1
>> ms-dns 203.18.20.3
>
> Those look ok.
>
>> The logs shows something that may be of concern:
>> Couldn't set pass-filter in kernel:
>
> That's not at all related to MS-DNS.  It means that you've set up a
> packet filter, but your kernel PPP modules aren't compiled to support
> packet filters.
>
>> Sep  5 22:07:30 ob1 pppd[10170]: sent [LCP ConfReq id=0x1 <asyncmap 0x0>
>> <auth pap> <magic 0xde2fd7f8> <pcomp> <accomp>]
> [...]
>> Sep  5 22:07:34 ob1 pppd[10170]: local  IP address 203.20.16.1
>> Sep  5 22:07:34 ob1 pppd[10170]: remote IP address 203.20.16.11
>
> This part looks good, but there are no debug logs from IPCP
> negotiation, which is where MS-DNS and address assignment would be
> found.  Were the logs edited manually, or copied incorrectly, or is
> something else broken?
>
> Why are the debug logs incomplete?
>
> --
> James Carlson                                 <carlsonj@workingcode.com>
>

