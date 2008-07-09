From: Bill Unruh <unruh@physics.ubc.ca>
Date: Wed, 09 Jul 2008 15:14:35 +0000
Subject: Re: net_mask 255.255.255.255
Message-Id: <Pine.LNX.4.64.0807090811590.22595@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <8140AAF341CC904BA92C3D6A5A190978440A4D@ditech-1.ditechllc.com>
In-Reply-To: <8140AAF341CC904BA92C3D6A5A190978440A4D@ditech-1.ditechllc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, 9 Jul 2008, Nicholas Hickman wrote:

> What is the reason for the lines 2362 & 2363 in sys-linux.c?  Why not
> just accept the netmask option from the peer config?
>
>
> /*
> *  Set the netmask.
> *  For recent kernels, force the netmask to 255.255.255.255.
> */
>    if (kernel_version >= KVERSION(2,1,16))
> 	net_mask = ~0L;

Because ppp is a point to point protocol-- it connects two specific
machines together. It does not do network routing. You can of course then
do routing over that connection, but the ppp connection itself is purely
point to point.

