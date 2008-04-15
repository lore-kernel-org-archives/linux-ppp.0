From: "Gerianne McC" <geriannemcc@gmail.com>
Date: Tue, 15 Apr 2008 17:51:00 +0000
Subject: Re: What are the correct NETMASKs for multiple PPPoE interfaces in a StaticIP block?
Message-Id: <b510d0250804151051n6aa8e97ai80c3599064743db3@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <b510d0250804140743o4528107dq834a63e4666f549d@mail.gmail.com>
In-Reply-To: <b510d0250804140743o4528107dq834a63e4666f549d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi James,

>  I'd likely route it
...

Got it!

>  I'm not sure what use I'd have for a bunch of manually configured
>  statics that only one machine can use.  (Perhaps I'm missing part of
>  your planned deployment, though.)

Yes, there's "more to it"

Each of my StaticIPs is configured with unique RDNS domains.

My current approach is to expose each one of those StaticIPs as a
separate (aliased) PPPoE intfc -- hence the ppp0:# -- as the external
interfaces of a firewall.

Then, I'll use the firewall (usual tools -- NAT, forwarding, etc) to
map traffic t & through those interfaces to various servers/services
on my LAN and DMZ segments.

So, as you suspected -- it's not just "one machine"!

Geri :-)
