From: James Carlson <carlson@workingcode.com>
Date: Sat, 10 Apr 2004 19:53:50 +0000
Subject: Re: dhcpd ?
Message-Id: <16504.20686.26465.579370@c-24-147-210-59.ne.client2.attbi.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4079A4F9.2000302@netscape.net>
In-Reply-To: <4079A4F9.2000302@netscape.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

nick writes:
> I just realized that my DHCPd may not work. This tool is suppose to deal 
> with the dynamic routing, right ?

No.

dhpcd is an address and configuration service mechanism, and is
typically used on Ethernets.  (It technically *can* be used on PPP,
but rarely is.)

> because the DNS nameservers I am 
> assigned are different from one log on to another, so are the IP 
> addresses...
> 
> I am going to try to reinstall the whole linux, or maybe just the DHCPd.

This isn't Windows.  Reinstalling shouldn't help.

-- 
James Carlson                                  <carlson@workingcode.com>
