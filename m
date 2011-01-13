From: Jan Just Keijser <jan.just.keijser@gmail.com>
Date: Thu, 13 Jan 2011 01:47:06 +0000
Subject: Re: ppp / open vpn
Message-Id: <4D2E599A.5030301@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <W90767349010091294791641@webmail30>
In-Reply-To: <W90767349010091294791641@webmail30>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Carlson wrote:
> On 01/12/11 16:17, Jan Just Keijser wrote:
>   
>> James Carlson wrote:
>>     
>>> The whole point of a point-to-point interface (of any type; PPP, tunnel,
>>> or otherwise) is that it connects two distinct IP nodes.  Distinct.  Not
>>> one IP node to itself!
>>>
>>>   
>>>       
>> This is another trick of OpenVPN to assign "linear addresses" to clients
>> while using a PtP (tun) interface. It is enabled in OpenVPN 2.1 (and
>> openvpnas, which is based  on 2.1) by using the
>>  topology subnet
>> directive.
>>     
>
> That's simply frightening.  Thanks for the update; I had no idea anyone
> was relying on that sort of undocumented OS feature.
>
> Good luck getting a routing protocol to work reliably with that ...
>
>   
actually, this mode is not used in combination with routing protocols. 
'topology subnet' is used primarily when multiple clients are connecting 
to a single server. OpenVPN also support a "point-to-point" mode (for 
lack of a better term), which does follow the regular PtP semantics. 
Running a routing protocol in that mode is just as easy as running one 
over a ppp-based link.

HTH,

JJK


