From: Bill Unruh <unruh@physics.ubc.ca>
Date: Wed, 29 Sep 2004 16:10:27 +0000
Subject: Re: counters overflow
Message-Id: <Pine.LNX.4.58.0409290909170.3901@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <262655318.20040929092029@rsl.ru>
In-Reply-To: <262655318.20040929092029@rsl.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, 29 Sep 2004, David Ananian-Cooper wrote:

> hi
> 
> i've encountered the same problem working the code while writing a plugin. i 
> managed to get around it by taking a copy of the counters every few minutes 
> and noting when they loop around to zero (i.e. when old_value > new_value). 
> its a bit of a hack, but it seems to work for my purposes.
> 
> >
> >   The problem is that counters for 'bytes in' and 'bytes out' are 32 bit
> > integers, which is enough for counting data while connected via modem, but
> > really small while using pppoe or pptpd-based solutions deployed over
> > 100/1000mbit network.

You have the source code. Make the counters longs instead. Does not seem
a terribly difficult hack. 
