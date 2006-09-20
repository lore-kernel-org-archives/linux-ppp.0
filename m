From: Christian <crich-ml@beronet.com>
Date: Wed, 20 Sep 2006 15:25:54 +0000
Subject: Re: syncppp
Message-Id: <45115D82.2010005@beronet.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4510F774.4080104@beronet.com>
In-Reply-To: <4510F774.4080104@beronet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi James,


James Carlson wrote:

>Christian writes:
>  
>
>>i'm trying to understand how ppp transports frames in the "sync" mode. I
>>want to do the following scenario:
>>    
>>
>
>In sync mode, each write from pppd represents a complete PPP frame,
>including the HDLC-like Address and Control fields, but not including
>the trailing FCS or any 0-bit stuffing.
>
>  
>

This is not totally true. I found out that the ppp_synch module makes
copy_to_users of 1502 bytes (default mtu), interestingly pppd reads 1504
bytes (MRU+PPP_HDR), which leads to problems in synch mode because 2
bytes of the next frame are inside of the current frame, i don't know
why this does not create issues in other constelllations, but in mine it
does. So i just changed the maximum read to MRU+PPP_HDR-2 in the tty.c
file and indeed it worked for me immediately.

>Each read returns a complete PPP frame, again including the HDLC-like
>Address and Control fields, but not including the FCS or 0-bit
>stuffing.
>
>  
>
>>I've hacked pppd  to use a simple framing method for stdin/stdout, to
>>guarantee the transport of complete ppp frames.
>>    
>>
>
>I'm confused.  At what point are stdin/stdout connected to a sync
>device that preserves frame boundaries?
>
>  
>
I have hacked the tty.c to prepend each write with a length field, so i
added boundaries, my programm connects to stdin/stdout and reads the
length field and therefore knows what a frame means.

>>But unfortunately i
>>found out, that in the tty.c i get mixed up frames from the
>>master_pty_f, like i read a buffer and in the buffer i get :
>>    
>>
>
>If you're talking about ptys, then you're not talking about sync.
>
>  
>

well the notty option leads to a Master/Slave pty which is connected to
the stdin/stdout pipes in the charshunt() as far as i understood.

It seems to me pppd needs terminal like fds internally, but i don't
really understand why this is so.


But anyway my fix solved my problems now.

Thanks for your time!

Cheers,

Christian

