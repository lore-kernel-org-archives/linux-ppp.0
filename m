From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 03 Jun 2010 13:59:18 +0000
Subject: Re: PPPoA server setup how to?
Message-Id: <4C07B536.1010404@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTikV_j1ajMThiB8B6DoaZpZ4fhlIRVVk2jK30-h8@mail.gmail.com>
In-Reply-To: <AANLkTikV_j1ajMThiB8B6DoaZpZ4fhlIRVVk2jK30-h8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

arun b wrote:
> Yes, it is a modem  device with DSL-connection. and as I mentioned
> erlier, am exploring the PPPoX configuration in it.  It has
> RJ11connector..

OK.  It's a little unclear how that device works or what sort of access
you have to it, but I'll assume that it looks like an ATM driver to the
rest of your system.

> and the link you provide  is not be useful. its just a pin-connection details.

You had asked about other hardware you could use for testing PPPoA.

It'd be useful if you had a plain ATM NIC, as I referenced in my
previous message.  As the other James pointed out, you need a lot more
gear to make a DSL connection work, as a simple back-to-back connection
won't work with it.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
