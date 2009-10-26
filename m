From: James Cameron <quozl@laptop.org>
Date: Mon, 26 Oct 2009 02:31:27 +0000
Subject: Re: pptp client server
Message-Id: <20091026023127.GI6568@us.netrek.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <W394922552633941256240088@webmail17>
In-Reply-To: <W394922552633941256240088@webmail17>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Oct 22, 2009 at 07:34:48PM +0000, tony.chamberlain@lemko.com wrote:
> Am I correct in assuming (and I am asking for Linux, CentOS 4.5 to be
> exact) that when a pptp client makes a connection to a pptp servcer
> (does the call), the server actually assigns (or more like "picks")
> the next available ip address from the ip pool you provide, even
> before it examines the login and password from the client?

Yes, usually.

pptpd does not examine the login and password from the client, but pppd
does.

pptpd can function with address pool management by pptpd or pppd.

pptpd is not packaged by CentOS 4.5, so a build from source will take
the default action of using pptpd pool management.

In pptpd 1.3.1 and later, the "delegate" option in pptpd.conf causes
pool management to be delegated to pppd.  In pptpd 1.3.0 and earlier,
the source has to be configured --with-pppd-ip-alloc to achieve the same
result.

Once address pool management is assigned to pppd, it is up to pppd to
allocate an appropriate IP address.  This can be achieved in various
ways, using pppd options files.  See the pppd options in the pppd
documentation.

In the default mode of address pool management by pptpd, the address is
passed to pppd on the command line.  This is why you see that.

-- 
James Cameron
http://quozl.linux.org.au/
