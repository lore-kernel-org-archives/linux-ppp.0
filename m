From: Marshall Crocker <marshall@iconux.org>
Date: Mon, 11 Aug 2008 05:03:58 +0000
Subject: Re: How to fix continuous ConfReq's on celluar internet connection
Message-Id: <489FC83E.1080705@iconux.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <489F746B.3040002@123mail.org>
In-Reply-To: <489F746B.3040002@123mail.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


>> The host was multi-homed, and when the 1x RTT link came up the default
>> route was swung onto the link.  Existing connections began to emit
>> packets to the modem link with a source IP corresponding to the previous
>> default route.  It was these packets which caused the reconfiguration.
>>   
> I'm not doing any sort of multihoming so there is no default route 
> until the ppp connection comes up. No invalid packets should be making 
> it to the ISP but I'll do a capture and see what comes up...

What comes up are packets from a host in my local network getting sent 
out over ppp!  Every time a packet with the source from my internal 
network gets sent over ppp, the connection reconfigures. You were 
exactly right!  What I'm seeing is packets being sent out over ppp such as

192.168.0.10 -> google.com

Which means that my iptables NAT script isn't doing its job. I've never 
claimed to be an iptables expert which is why I've always used 
MonMotha's iptables firewall.  I guess its time to learn....

