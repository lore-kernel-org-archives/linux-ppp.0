From: Andy <fs@globalnetit.com>
Date: Sat, 24 Apr 2004 05:56:02 +0000
Subject: Re: pppd 2.4.2 bug?
Message-Id: <1082786162.5706.5.camel@dell.tranquilitynj.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.21.0404221627080.17764-100000@corncob.localhost.tld>
In-Reply-To: <Pine.LNX.4.21.0404221627080.17764-100000@corncob.localhost.tld>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I reported a similar problem a few weeks ago, there were a few messages
about it on this list.
Last message was from Paul on March 22, he'd found a bug in ipcp.c:

<quote>
It looks like the bug is here (line 723 of ipcp.c, in ipcp_cilen):

    if ((wo->neg_addr || wo->old_addrs) && !go->neg_addr &&
!go->old_addrs) {
        /* use the old style of address negotiation */
        go->old_addrs = 1;
    }

Receiving the conf-reject for the old CI_ADDRS option sets
go->old_addrs to 0.  Then when we send the next conf-request, this
code sets it to 1 again.

I'll have to think about the proper fix here.

Paul.
</quote>

/Andy

On Thu, 2004-04-22 at 17:43, Clifford Kite wrote:
> This is an extract from a response by the OP to a reply by me on
> comp.protocols.ppp:
> 
>   Clifford Kite wrote:
>   >>rcvd [IPCP ConfRej id=0x3 <addrs 192.168.1.99 0.0.0.0>]
>   >>sent [IPCP ConfReq id=0x4 <addrs 192.168.1.99 0.0.0.0>]
>   >>rcvd [IPCP ConfRej id=0x4 <addrs 192.168.1.99 0.0.0.0>]
>   >>sent [IPCP ConfReq id=0x5 <addrs 192.168.1.99 0.0.0.0>]
>   >>rcvd [IPCP ConfRej id=0x5 <addrs 192.168.1.99 0.0.0.0>]
>   >>sent [IPCP ConfReq id=0x6 <addrs 192.168.1.99 0.0.0.0>]
>   >>rcvd [IPCP ConfRej id=0x6 <addrs 192.168.1.99 0.0.0.0>]
>   >>.....
>   >>repeats forever until I kill it
>   >
>   >
>   > Forever is relative.  It should stop all negotiation after 10 such
>   > requests.  Or there may be a bug in the code that negotiates the
>   > (old) IP addresses option.
> 
>   Well, I started pppd and it dropped into the 'loop', so I went to make
>   coffee, ran some errands, and when I came back it was still doing it. So
>   that classifies as 'forever' for me ;)
> 
> I wrote back, saying that in my eyes it also qualified as forever. :)
> So it does seem to be a bug.
> 
> ---
> Clifford Kite                                 http://ckite.no-ip.net
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

