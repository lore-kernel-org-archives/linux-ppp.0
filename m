From: Bill Unruh <unruh@physics.ubc.ca>
Date: Thu, 29 Apr 2004 02:47:25 +0000
Subject: Re: Interface Name
Message-Id: <Pine.LNX.4.50.0404281942060.30722-100000@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <408E24E6.6090900@guox.net>
In-Reply-To: <408E24E6.6090900@guox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, 29 Apr 2004, Soragan Guo wrote:

> >>It doesn't.  It just sets a vanity name for the pid file, so that
> >>writing a kill script is easier.
> >That may be all he wants.
> no it is not what i want actually, hehe
> what i want is to change the interface name in ifconfig

I suppose I should have said "maybe that is all that he needs".  Since I
have no idea what problem it is that you wanted to solve, I also have no
idea what would consitute a solution. 
The short answer is that the interface names, like ppp0, are assigned by
the kernel, and if you want to change them, you have to change the
kernel, as has been stated by others. You are of course free to do that,
but I suspect that you do not want to do that. Then the question is
whether there are other things which are easier to do which would
accomplish the same goals. I suggested two of them. Eg using the unit
option to pppd. That would mean that you (or a script you used) would
have to translate ppp50 to pptp in your mind, and that may be good
enough. On the other hand it might not be for some reason. 

