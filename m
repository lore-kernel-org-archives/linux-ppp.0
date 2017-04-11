From: Michael Richardson <mcr@sandelman.ca>
Date: Tue, 11 Apr 2017 13:36:13 +0000
Subject: Re: pppoe encapsulated udp packets which appear on ethernet disappear between pppoe and ppp0 after p
Message-Id: <24667.1491917773@obiwan.sandelman.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <20170410183851.GA4442@glanzmann.de>
In-Reply-To: <20170410183851.GA4442@glanzmann.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Thomas Glanzmann <thomas@glanzmann.de> wrote:
    > The real interesting question is, why do perfectly healthy ip/udp
    > packets from within the pppoe session drop before reaching ppp0? Why
    > does it only happen after one hangup?

It sounds like they aren't part of the correct PPPoE session to me.
As if the other end is not killing it's PPP session when the new one forms.

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        | network architect  [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [

