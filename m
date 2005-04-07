From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 07 Apr 2005 16:29:20 +0000
Subject: Re: Help
Message-Id: <16981.24544.943856.326880@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Kumar writes:
> I have to run linux pppd as a server and need to support many ppp
> clients. I'm currently using linux pppd-2.4.2.
> 
> Would you please tell me if the linux ppp has support for multi
> channels? If so, by default how many links it supports?

Each pppd process supports one link, but you may have as many pppd
processes and links as your system may accomodate.

-- 
James Carlson                                 <carlsonj@workingcode.com>
