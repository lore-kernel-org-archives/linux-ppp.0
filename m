From: Bill Unruh <unruh@physics.ubc.ca>
Date: Tue, 27 Apr 2004 22:58:38 +0000
Subject: Re: Interface Name
Message-Id: <Pine.LNX.4.50.0404271548220.29437-100000@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <408E24E6.6090900@guox.net>
In-Reply-To: <408E24E6.6090900@guox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, 27 Apr 2004, James Cameron wrote:

> On Tue, Apr 27, 2004 at 07:16:22PM +1000, Soragan Guo wrote:
> > how to modify the interface name become pptp0 or adsl0 or any other
> > name according to type of connection?
> 
> The name is set by the PPP kernel module.  With suitable expertise you
> could modify the kernel module.

Actually pppd 2.4.x includes an options called "unit" with which you can
request pppd give you that numbr for the interface. If it is not
available, it will use the next available one anyway.

