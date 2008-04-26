From: "C.J" <c.james.cj@gmail.com>
Date: Sat, 26 Apr 2008 12:10:50 +0000
Subject: Re: Re: Re: how to use compress modul in ppp process
Message-Id: <200804262010412562299@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200804250001085508333@gmail.com>
In-Reply-To: <200804250001085508333@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

>Why did you think that?
Since I got a strange package with protocol field 0xFD(not 0x00FD). 
I've read ppp_generic.txt and got that the upper layer should pass packages to ppp_generic driver with two octets protocol field. 
So this should be finished on l2tp layer(channel preferably) or other kinds of channel.
 
>l2tp is just an encapsulation layer which has nothing to do with MPPC.
You are right.

>Do you have a good reason for apparently ignoring my statement that MPPC 
>is usually not supported by the ppp modules in the kernel? Are you quite 
>sure that your kernel (or kernel modules) has been specifically patched to 
>support MPPC? If not, you cannot use MPPC, not matter how you configure 
>your client.
Really? But in my machine(which kernel is 2.6, Debian system) has ppp_mppe module but no any patch. Also has other compress module such as bsd_comp, deflate.
Does this mean that kernel support it and I can use it? 

Thanks so much for your kindly reply.
Regards.

--
c.j

