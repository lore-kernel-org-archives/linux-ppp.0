From: Paul Mackerras <paulus@samba.org>
Date: Mon, 22 Mar 2004 05:34:08 +0000
Subject: Re: pppd 2.4.2b3 IPCP converge failure
Message-Id: <16478.31440.968776.931681@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1079855955.1133.48.camel@dell.tranquilitynj.net>
In-Reply-To: <1079855955.1133.48.camel@dell.tranquilitynj.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Andy writes:

> I'm wondering about the ConfReq packets, what is the second address
> field doing there (as in addrs 68.244.143.67 0.0.0.0) - that looks wrong
> to me. And there certainly seems to be a protocol error here in pppd
> handling the ConfRej's - this is from rfc1661, section 5.4:
> 
>       Reception of a valid Configure-Reject indicates that when a new
>       Configure-Request is sent, it MUST NOT include any of the
>       Configuration Options listed in the Configure-Reject.

It looks like the bug is here (line 723 of ipcp.c, in ipcp_cilen):

    if ((wo->neg_addr || wo->old_addrs) && !go->neg_addr && !go->old_addrs) {
        /* use the old style of address negotiation */
        go->old_addrs = 1;
    }

Receiving the conf-reject for the old CI_ADDRS option sets
go->old_addrs to 0.  Then when we send the next conf-request, this
code sets it to 1 again.

I'll have to think about the proper fix here.

Paul.
