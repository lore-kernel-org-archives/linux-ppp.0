From: Paul Mackerras <paulus@samba.org>
Date: Tue, 09 Nov 2004 23:01:23 +0000
Subject: Re: Multilink and ppp_input_error().
Message-Id: <16785.19523.973723.510551@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <00b701c4c67f$554c8180$67160a0a@ATLANTIC>
In-Reply-To: <00b701c4c67f$554c8180$67160a0a@ATLANTIC>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Matthew N. Dodd writes:

> Has anyone else noticed that drivers/net/ppp_generic.c:ppp_input_error()
> is effectively a NOP?  pppd/main.c:get_input() treats a zero length

No it isn't a NOP, ppp_receive_frame calls ppp_receive_error when it
gets the 0-length skb, which resets the VJ decompression code (which
is what really needs to know about receive errors).

> packet as a hangup indication but if you trace out the call to
> ppp_do_recv() in ppp_input_error() the zero length frame is never sent
> to the file descriptor.  Further, calling an input function for the PPP
> device isn't useful as the intent is to deliver the error to a specific
> PPP channel.
> 
> I'm using the attached patch.
> 
> Comments?

You really want your link to terminate every time you get an FCS error
on a received packet?

Paul.
