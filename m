From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 15 Apr 2008 18:46:59 +0000
Subject: Re: What are the correct NETMASKs for multiple PPPoE interfaces in a StaticIP block?
Message-Id: <18436.63523.943696.44714@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <b510d0250804140743o4528107dq834a63e4666f549d@mail.gmail.com>
In-Reply-To: <b510d0250804140743o4528107dq834a63e4666f549d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Gerianne McC writes:
> Each of my StaticIPs is configured with unique RDNS domains.
> 
> My current approach is to expose each one of those StaticIPs as a
> separate (aliased) PPPoE intfc -- hence the ppp0:# -- as the external
> interfaces of a firewall.
> 
> Then, I'll use the firewall (usual tools -- NAT, forwarding, etc) to
> map traffic t & through those interfaces to various servers/services
> on my LAN and DMZ segments.

OK; that makes more sense.  I would have expected separate firewalls
for each of those domains ... but this approach (though maybe unusual)
ought to work.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
