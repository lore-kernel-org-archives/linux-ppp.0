From: Bill Unruh <unruh@physics.ubc.ca>
Date: Fri, 10 Sep 2004 16:02:28 +0000
Subject: Re: pppd don't create ppp-network-device
Message-Id: <Pine.LNX.4.58.0409100858560.21781@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <OFA2465F60.5C52B06E-ONC1256F0B.0042177C@bln.d-trust.de>
In-Reply-To: <OFA2465F60.5C52B06E-ONC1256F0B.0042177C@bln.d-trust.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Fri, 10 Sep 2004 p.boehm@d-trust.net wrote:

> Hi,
> I'm try to connect to the internet via ppp but it fails because (so I believe)
> ppp_generic-module don't create an network-device alias ppp0.

No Your chat script never let go. ppp was never really started.

This is all from chat.

> Sep 10 09:55:47 nano chat[1511]: abort on (NO DIALTONE)
...
> Sep 10 09:56:02 nano chat[1511]: atdt0172229000^M^M
> Sep 10 09:56:02 nano chat[1511]: CONNECT 9600/RLP^M
> Sep 10 09:56:03 nano chat[1511]: ^M^M
> Sep 10 09:56:03 nano chat[1511]: 491723222009 connected to the D2 Internet Service^M^M
> Sep 10 09:56:06 nano chat[1511]: PPP session starting~^?}#@!}!}!} }8}!}$}%\}"}&^?^?^?^?}%}&})

Chat is still reporting. It should not be. I have no idea what you have
in your chat script, but it should end with 

CONNECT '\d\c'

That is the end, Nothing else after that. NOTHING.


> ^G#N}'}"}(}"+}"~~^?}#@!}!}"
> Sep 10 09:56:09 nano chat[1511]: } }8}!}$}%\}"}&^?^?^?^?}%}&})^G#N}'}"}(}"a^P~~^?}#@!}!}#} }8}!}$}%
> \}"}&^?^?^?^?}%}&})^G#N}'}
> Sep 10 09:56:15 nano chat[1511]: "}(}"(}9~~^?}#@!}!}$} }8}!}$}%\}"}&^?^?^?^?}%}&})^G#N}'}"}(}"d
> <~~^?}#@!}!}%} }8}!}$}%\}
> Sep 10 09:56:21 nano chat[1511]: "}&^?^?^?^?}%}&})^G#N}'}"}(}"-5~~^?}#@!}!}&} }8}!}$}%\}"}&^?^?^?
> ^?}%}&})^G#N}'}"}(}"g'~~^?}#
> Sep 10 09:56:24 nano chat[1511]: @!}!}'} }8}!}$}%\}"}&^?^?^?^?}%}&})^G#N}'}"}(}"..~~^?}#@!}!}(}
> }8}!}$}%\}"}&^?^?^?^?}%}&})
> Sep 10 09:56:30 nano chat[1511]: ^G#N}'}"}(}"ne~~^?}#@!}!})} }8}!}$}%\}"}&^?^?^?^?}%}&})^G#N}'}"}
> (}"'l~~^?}#@!}!}*} }8}!}
> Sep 10 09:56:33 nano chat[1511]: alarm

It is chat which gave up because it did not get the expect string it was
waiting for. Who knows what it is. It is wrong.
ppp was never started.



> Sep 10 09:56:33 nano chat[1511]: Failed
> Sep 10 09:56:33 nano pppd[1510]: Connect script failed
> Sep 10 09:56:34 nano pppd[1510]: Exit.
> 
