From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 12 Jan 2011 21:26:46 +0000
Subject: Re: ppp / open vpn
Message-Id: <4D2E1C96.9000608@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <W90767349010091294791641@webmail30>
In-Reply-To: <W90767349010091294791641@webmail30>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 01/12/11 16:17, Jan Just Keijser wrote:
> James Carlson wrote:
>> The whole point of a point-to-point interface (of any type; PPP, tunnel,
>> or otherwise) is that it connects two distinct IP nodes.  Distinct.  Not
>> one IP node to itself!
>>
>>   
> This is another trick of OpenVPN to assign "linear addresses" to clients
> while using a PtP (tun) interface. It is enabled in OpenVPN 2.1 (and
> openvpnas, which is based  on 2.1) by using the
>  topology subnet
> directive.

That's simply frightening.  Thanks for the update; I had no idea anyone
was relying on that sort of undocumented OS feature.

Good luck getting a routing protocol to work reliably with that ...

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
