From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 15 Apr 2008 13:33:56 +0000
Subject: Re: What are the correct NETMASKs for multiple PPPoE interfaces in a StaticIP block?
Message-Id: <18436.44740.954131.304124@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <b510d0250804140743o4528107dq834a63e4666f549d@mail.gmail.com>
In-Reply-To: <b510d0250804140743o4528107dq834a63e4666f549d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Gerianne McC writes:
> I'm making my primary ppp connection at interface
> 
>        ppp0, IP address = x.x.x.238
> 
> and setting up interface aliases of,
> 
>        ppp0:1, IP address = x.x.x.233
>        ppp0:2, IP address = x.x.x.234
>        ppp0:3, IP address = x.x.x.235
>        ppp0:4, IP address = x.x.x.236
>        ppp0:5, IP address = x.x.x.237

That should work, though it's perhaps not how I'd handle it.

> What should be the NETMASK for the primary 'ppp0'? /29 or /32?
> And for each of the aliases?

They're all /32 -- individual IP addresses.

PPP creates point-to-point interfaces.  It's not a broadcast-type
medium, like Ethernet.  There's no "subnet" as far as the interface is
concerned, but rather just two arbitrary IP nodes connected together.

That's why the link has a "local" address and a "remote" address, and
no "broadcast" address.  It's not a subnet.

> If the right answer if ppp0 -> /29, & ppp0:# -> /32, should I ALSO
> create an alias ppp0:6, IP address = x.x.x.238 (same as ppp0 !?) but
> with a /32?

Setting a /29 on a PPP interface should have no effect.  The system
should be smart enough to know that the right answer is /32.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
