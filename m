From: Bill Unruh <unruh@physics.ubc.ca>
Date: Thu, 14 Oct 2004 16:49:54 +0000
Subject: Re: even after PPP connection established, pings don't work
Message-Id: <Pine.LNX.4.58.0410140946340.24959@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.60.0410141106110.21794@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.60.0410141106110.21794@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

 On Thu, 14 Oct 2004, Robert P. J. Day wrote:
> > 3)  Something is wrong with the serial connection that affects
> >     the data being sent.
> 
> sadly, as sherlock holmes would say, "watson, once you've eliminated
> all of the other possibilities, whatever remains, however improbable,
> must be true."  dang.

However, the fact that you get a ppp connection indicates that the
serial connection seems to be OK. setting up the connection works the
serial line pretty well, so connection usually (not always) equals good
line.

However, again more debugging info would be helpful. 

REmember you do not know what is going on. Thus your estimates of what
is important in the logs and what is not is not reliable.  Often some
tiny thing in the logs which someone not familiar with them will
overlook, jumps out to someone who has been sensitized by looking at
many many logs of bad connections.


