From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 13 Apr 2004 15:05:41 +0000
Subject: Re: PPP connect hangs at "getlogname (AUTO_PPP), read:"
Message-Id: <Pine.LNX.4.58.0404131100440.9811@localhost.localdomain>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


On Tue, 13 Apr 2004, James Carlson wrote:

> Robert P. J. Day writes:
> > 04/13 08:51:28 yS3   tio_set_flow_control( HARD )
> > 04/13 08:51:28 yS3   print welcome banner (/etc/issue)
> > 04/13 08:51:28 yS3   getlogname (AUTO_PPP), read:
> 
> At this point, mgetty is waiting to hear from the peer.  If it appears
> to be hung, then this means one or more of the following:
> 
> 	- serial cable is bad
> 
> 	- peer isn't running PPP
> 
> 	- serial configuration is wrong somewhere (incorrect bit rate,
>           number of bits per character, or parity)

at the moment, because i'm working with an embedded system, i can't
immediately add some diagnostic utilities that might nail this down, so i
have a specific question.  if you compare the above output (the mgetty log
file from the server) when calling up from the embedded system, to the
following, which shows the dialogue getting past that point when calling
from my laptop:

04/13 09:27:21 yS3   tio_set_flow_control( HARD )
04/13 09:27:21 yS3   print welcome banner (/etc/issue)
04/13 09:27:21 yS3   getlogname (AUTO_PPP), read:~}[df]}#[c0]!
04/13 09:27:22 yS3   input finished with '\r', setting ICRNL ONLCR
04/13 09:27:22 yS3   tio_get_rs232_lines: status: RTS CTS DSR DTR DCD
04/13 09:27:22 yS3   match: user='/AutoPPP/', key=''
04/13 09:27:22 yS3   match: user='/AutoPPP/', key=''
04/13 09:27:22 yS3   match: user='/AutoPPP/', key='/AutoPPP/'*** hit!


notice the apparent response from the client(?) in the successful case:

04/13 09:27:21 yS3   getlogname (AUTO_PPP), read:~}[df]}#[c0]!

  it's still not clear what this response represents.  is the client side
pppd supposed to be sending that "~}[df]}#[c0]!" line?  and in response
to what?  i'm just trying to understand at exactly what point in the 
negotiation things are breaking down.  thanks for any pointers.

rday

