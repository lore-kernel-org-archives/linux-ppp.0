From: Clive Nicolson <clive@baby.bedroom.gen.nz>
Date: Sun, 01 Feb 2004 00:01:09 +0000
Subject: Re: PPPoATM compression
Message-Id: <Pine.LNX.4.44.0402011250320.27089-100000@pentiumii.bedroom.gen.nz>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

With the way pppoatm is usually implemented with pppd (ie pppd 2.4.2) and 
a pppoatm plugin, it is up to the ppp code at each end to ask for and 
accept compression. Try it and see.

See my atm over adsl (with a specific adsl card) web page for most aal5 
protocols:

http://gateway.bedroom.gen.nz/~clive/adsl/thefiles/CnxADSL.html

If any of the linux source prevents compression, I'm sure you can fix it!

Clive


