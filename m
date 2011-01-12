From: Jan Just Keijser <jan.just.keijser@gmail.com>
Date: Wed, 12 Jan 2011 21:17:26 +0000
Subject: Re: ppp / open vpn
Message-Id: <4D2E1A66.5050900@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <W90767349010091294791641@webmail30>
In-Reply-To: <W90767349010091294791641@webmail30>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi all,

I'm responding to this thread as I am more of an OpenVPN person than a 
PPP person. Hopefully I can shed some light on the things Tony is seeing.

James Carlson wrote:
>> So a question is, what has precedence, 0.0.0.0 with netmask 0.0.0.0 or
>> 0.0.0.0 and 128.0.0.0 with a netmask of 128.0.0.0?  They bothe appear to
>> cover every address (not specifically specified in a previous route which I did not show).
>>     
>
> In IP forwarding, longer netmask = higher precedence.
>
> So, yes, you could have a default 0.0.0.0/0 route pointing to the old
> destination, and then cover it with two new routes to 0.0.0.0/1 and
> 128.0.0.0/1.  Those new routes would take precedence over the 0.0.0.0/0
> route, because each has a longer netmask (1 > 0).
>
> (For what it's worth, I find CIDR notation a little easier to grok than
> explicit netmasks ... but express it whatever way makes sense to you.)
>
>   
The 0.0.0.0/1+128.0.0.0/1 route is an OpenVPN trick to redirect the 
default gateway while keeping the original route intact. When OpenVPN 
shuts down or crashes the default route is still available and you still 
have a working system. If the 0.0.0.0/0 route is replaced then you'd end 
up with a broken box.

>>           inet addr:10.1.0.6  P-t-P:10.1.0.6  Mask:255.0.0.0
>>     
>
> That doesn't look happy.  Why would both the local and remote address be
> equal?  (I wouldn't expect a functioning system to allow a configuration
> like that.)
>
> The whole point of a point-to-point interface (of any type; PPP, tunnel,
> or otherwise) is that it connects two distinct IP nodes.  Distinct.  Not
> one IP node to itself!
>
>   
This is another trick of OpenVPN to assign "linear addresses" to clients 
while using a PtP (tun) interface. It is enabled in OpenVPN 2.1 (and 
openvpnas, which is based  on 2.1) by using the
  topology subnet
directive.
This trick *does* work on several platforms (Linux, BSD, MacOS, Windows, 
all with their respective special flags), but you need to be careful NOT 
to use the remote PtP address. Linux does not care whether the remote 
PtP address is the same as the local part. Linux does not even care if 
the 'tun' device as an IP address at all: it will still let you route 
data over it as long as you specify the right routing device. Data 
intended for the 'tun0' (or 'ppp0' interface in Tony's case) is simply 
sent to the 'tun' device. The OpenVPN process then picks it up, ships it 
to the other end of the tunnel and the reverse is done.


You can achieve the local routing of the 10.4.55.X subnet by adding a 
statement to the client-side OpenVPN config file
   route 10.4.55.0 255.255.255.0 net_gateway

But this is getting off-topic for this list ....

HTH,

JJK

