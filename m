From: wotuzu17 <andiv@gmx.li>
Date: Sat, 29 Dec 2007 00:03:42 +0000
Subject: Re: Using an NTS instead of the local serial device ?
Message-Id: <14533230.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <14532384.post@talk.nabble.com>
In-Reply-To: <14532384.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


After browsing the support sites of Lantronix, I think I found the software I
need:

The  rtelpd  daemon  process  is used to provide access to
serial or parallel ports on a terminal  server.   A  named
pipe  is used as the actual interface to host based appli-
cations.  These applications  can  then  communicate  with
equipment  attached  to  the  server  as if it was locally
attached to the unix host.

I can create a /dev/somepipename device with that tool.


I need this rather unconventional method because we have several remote
sites that are connected to the center via public digital lines (64k).
Multiplexer on each end offer up to 16 transparent serial RS232 ports. Via
the ppp link we get access to the network in the center- it's slow but
sufficient for our application.

The NTS is only needed in the center because it offers 8 ports. I find this
more elegant than upgrading the Ubuntu- Server with additional serial ports.
-- 
View this message in context: http://www.nabble.com/Using-an-NTS-instead-of-the-local-serial-device---tp14532384p14533230.html
Sent from the linux-ppp mailing list archive at Nabble.com.

