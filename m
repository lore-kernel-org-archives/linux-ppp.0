From: Jean Lee <jean.lee@free.fr>
Date: Tue, 11 Jan 2005 07:49:19 +0000
Subject: Re: PPP features ?
Message-Id: <41E384FF.30707@free.fr>
List-Id: <linux-ppp.vger.kernel.org>
References: <41E262D3.8020303@free.fr>
In-Reply-To: <41E262D3.8020303@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello James,

Thank you very much for your answer.
For the patents in France, I think it is like what you said so I will 
forgot LZS
For the NCP protocol, I am not sure but I think that it is IPCP + IP 
header compression + software compression (LZS) + CCP because it is 
wrotten like this :

/Network Control Protocol (NCP), for the PPP protocol integration 
control in the IPv4 layer :/
    /- protocol IPC management (Internet Protocol Control)/ I think that 
there is a mistake and that he want to speek about IPCP because I don't 
know IPC.
    /- IP header compression support/
    /- software compression support (LZS) optional./
   / - Compression Control Protocol (CCP)/

Does it have a meaning ?
Is there another software compression protocol than LZS which is available ?
Where did you find all this information ?

Regards,

Jean Lee

James Carlson wrote:

>Jean Lee writes:
>  
>
>>In order to write my own application, I would like to know where I can 
>>find information on the ppp stack features for linux 2.4.27. Does 
>>anybody know it ?
>>
>>In particular, does the linux ppp stack implements the following 
>>protocols ? :
>>PAP, IPCP
>>    
>>
>
>Yes to both.
>
>  
>
>>IP header compression
>>    
>>
>
>It has VJ (RFC 1144) header compression, but nobody has worked on the
>newer patent-laden ROHC things.
>
>  
>
>>, CCP
>>    
>>
>
>Yes.
>
>  
>
>>, LZS
>>    
>>
>
>No, not by default.  It's patent-encumbered.  There are patches
>floating around the 'net that reportedly add this.  Use at your own
>risk.
>
>(Patents aren't like copyrights, at least in much of the world.  You
>can get sued successfully even if you write the darned thing from
>scratch.  You can even get sued if you happened to invent it on your
>own purely by accident.  Not sure about the situation in France ...)
>
>  
>
>>and NCP
>>    
>>
>
>That's not really a protocol.  The "NCPs" in PPP are the network
>control protocols.  One of these is IPCP, the Internet Protocol
>Control Protocol, which is used to negotiate IP parameters.
>
>Or are you asking about IPX support?  (One of the IPX-related
>protocols is also called "NCP.")
>
>  
>


