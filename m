From: Bill Unruh <unruh@physics.ubc.ca>
Date: Tue, 13 Apr 2004 16:04:52 +0000
Subject: Re: PPP connect hangs at "getlogname (AUTO_PPP), read:"
Message-Id: <Pine.LNX.4.50.0404130901570.32341-100000@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, 13 Apr 2004, Robert P. J. Day wrote:

> 
> On Tue, 13 Apr 2004, James Carlson wrote:
> 
> > Robert P. J. Day writes:
> > > 04/13 08:51:28 yS3   tio_set_flow_control( HARD )
> > > 04/13 08:51:28 yS3   print welcome banner (/etc/issue)
> > > 04/13 08:51:28 yS3   getlogname (AUTO_PPP), read:
> > 
> > At this point, mgetty is waiting to hear from the peer.  If it appears
> > to be hung, then this means one or more of the following:
> > 
> > 	- serial cable is bad
> > 
> > 	- peer isn't running PPP
> > 
> > 	- serial configuration is wrong somewhere (incorrect bit rate,
> >           number of bits per character, or parity)
> 
> at the moment, because i'm working with an embedded system, i can't
> immediately add some diagnostic utilities that might nail this down, so i
> have a specific question.  if you compare the above output (the mgetty log
> file from the server) when calling up from the embedded system, to the
> following, which shows the dialogue getting past that point when calling
> from my laptop:

As James said, your system is stuck because it is getting nothing from
the far side. Nothing. 
In the successful case it got the beginning of a ppp LCP  packet.

It may be that y ou forgot to start up ppp on your embedded system. Ie
it is sitting there waiting for something and mgetty is sitting there
waiting for something. You must start up ppp immediately after the
CONNECt is received on your embedded system and have it start sending
out LCP packets. It should not wait for something from the other side
first. That is how AutoPPP works.






> 
> 04/13 09:27:21 yS3   tio_set_flow_control( HARD )
> 04/13 09:27:21 yS3   print welcome banner (/etc/issue)
> 04/13 09:27:21 yS3   getlogname (AUTO_PPP), read:~}[df]}#[c0]!
> 04/13 09:27:22 yS3   input finished with '\r', setting ICRNL ONLCR
> 04/13 09:27:22 yS3   tio_get_rs232_lines: status: RTS CTS DSR DTR DCD
> 04/13 09:27:22 yS3   match: user='/AutoPPP/', key=''
> 04/13 09:27:22 yS3   match: user='/AutoPPP/', key=''
> 04/13 09:27:22 yS3   match: user='/AutoPPP/', key='/AutoPPP/'*** hit!
> 
> 
> notice the apparent response from the client(?) in the successful case:
> 
> 04/13 09:27:21 yS3   getlogname (AUTO_PPP), read:~}[df]}#[c0]!
> 
>   it's still not clear what this response represents.  is the client side
> pppd supposed to be sending that "~}[df]}#[c0]!" line?  and in response
> to what?  i'm just trying to understand at exactly what point in the 
> negotiation things are breaking down.  thanks for any pointers.
> 
> rday
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
