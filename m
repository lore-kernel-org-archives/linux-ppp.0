From: jfj <jfj@freemail.gr>
Date: Fri, 29 Dec 2006 10:55:19 +0000
Subject: rp-pppoe requires PF_PACKET (Re: Help with PPPoE)
Message-Id: <4594F417.9060000@freemail.gr>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Thanks for the confirmation (it is helpful!).

I found the problem and that is that rp-pppoe requires
PF_PACKET sockets, which are disabled on my kenrel.

I'd really like to avoid this. It seems rp-pppoe uses
packet sockets to get the inteface number. Anybody knows
if this can be avoided with a bit of hacking?

Otherwise, we should mention that Kernel PPPoE depends
on PF_PACKET :(
And improve the error mesages of rp-pppoe.

jf.

Gilles Espinasse wrote:

>>Now when I type
>>
>>pppd eth0
>>
>>I get
>>
>>unrecognized option 'eth0'
>>
>>But wasn't the plugin supposed to enable this device?
>>
>>If I use this script in /etc/ppp/peers/mydsl
>>
>>#
>># PPP over Ethernet options (using roaring pinguin external program)
>>#
>>plugin rp-pppoe.so
>>    
>>
>It work for me with this exact line
>plugin rp-pppoe.so eth0
>...
>Then you should be able to do
>pppd call mydsl
>
>Gilles
>
>  
>

