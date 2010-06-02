From: James Chapman <jchapman@katalix.com>
Date: Wed, 02 Jun 2010 09:26:25 +0000
Subject: Re: PPPoA server setup how to?
Message-Id: <4C0623C1.3070800@katalix.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTikV_j1ajMThiB8B6DoaZpZ4fhlIRVVk2jK30-h8@mail.gmail.com>
In-Reply-To: <AANLkTikV_j1ajMThiB8B6DoaZpZ4fhlIRVVk2jK30-h8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

arun b wrote:
> On Tue, Jun 1, 2010 at 8:40 PM, James Carlson <carlsonj@workingcode.com> wrote:
>> arun b wrote:
>>> All,
>>> How to we test PPPoA using pppd deemon...
>>> I mean to understand the remote-server setup ?
>>> what devie has the pppoa server and  how is the iintial hannd shake ?
>>>  does this go with sequence of PADI, PADO,PADS .....etc... sequec?
>> Are you looking for PPPoA or PPPoE?  What hardware do you have?
>>
>> PPP over ATM just uses ATM-related drivers and runs regular PPP.
>>
>> PPPoE is quite different.  It runs over Ethernet and uses a separate
>> protocol to set up the point-to-point virtual link.  The messages you're
>> referring to (PADI, and so on) are parts of the PPPoE protocol.
>>
>> --
> 
> Hi James,
> Thanks for the info ..
> Well I am looking for PPPoA explicitly, which basically uses
> pppoatm.ko-driver module and pppoatm.so-lib along with pppd-deamon.
> As explained above is being my client setup which I execute on, Now my
> trouble/doubts is How/where to run PPPoA-server and on what device, Is
> there a standard device/software available (Such as DSLAM, ISAM..etc).
> Which can respond to the PPPoA-client (linux-box) packet and establish
> the ppp-interface.

As James said previously, for PPPoA there is no additional setup
protocol, so there is no PPPoA server. You just start pppd with
arguments that tell it which ATM interface/VPI/VCI to use. e.g.

pppd plugin pppoatm.so 0.80 192.168.1.1:192.168.1.2 passive

starts a pppd instance on ATM VPI 0, VCI 80 and assigns IP 192.168.1.1
to the local interface and 192.168.1.2 to the peer when the PPPoA peer
connects on VPI 0, VCI 80. If you are building a DSLAM-like box which
accepts connections from many PPPoA clients, you will need to start a
pppd instance for every possible ATM VPI/VCI that clients might use...

There are other pppd pppoatm plugin options for ATM LLC encapsulation
and for setting ATM QOS options. See pppd/plugins/pppoatm directory in
ppp sources for detail.

> Pls do let me know any possible info related to this. Secondly also
> any means of server configuration details.
> 
> Well I coated this (PADI, PADO,...) because, wanted to know does PPPoA
> also follows these message sequence or it has new set of sequence ?

No, they are for PPPoE.

> 
> Thanks again,
> Arun
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
James Chapman
Katalix Systems Ltd
http://www.katalix.com
Catalysts for your Embedded Linux software development

