From: Christopher Fowler <cfowler@outpostsentinel.com>
Date: Tue, 07 Aug 2007 00:32:29 +0000
Subject: Re: sending raw packets via PPP
Message-Id: <1186446749.29150.40.camel@shuttle.linxdev.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <35B9865F-38B4-4603-A2B7-F4ABACE5520F@sbcglobal.net>
	 <18103.44797.529894.786033@gargle.gargle.HOWL>
	 <E210D1E9-9265-48EE-91BB-E6027547F01E@sbcglobal.net>
In-Reply-To: <E210D1E9-9265-48EE-91BB-E6027547F01E@sbcglobal.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin K <k_krieser@sbcglobal.net>
Cc: James Carlson <carlsonj@workingcode.com>, linux-ppp@vger.kernel.org, Linux-kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, 2007-08-06 at 19:24 -0500, Kevin K wrote:
> The DHCP source code therefore wants  
> to send raw packets (SOCKET_PACKET) (down to the ethernet addressing  
> info).  

I can imagine that would be the case.  The box requesting the DHCP
address has no IP address.  Therefore TCP/IP can not be used at that
point to communicate between the two.  I've not had to look at the DHCP
code to see how this works.



