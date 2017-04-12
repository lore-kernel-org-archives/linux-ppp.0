From: Thomas Glanzmann <thomas@glanzmann.de>
Date: Wed, 12 Apr 2017 02:25:41 +0000
Subject: Re: pppoe encapsulated udp packets which appear on ethernet disappear between pppoe and ppp0 after p
Message-Id: <20170412022541.GA11566@glanzmann.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <20170410183851.GA4442@glanzmann.de>
In-Reply-To: <20170410183851.GA4442@glanzmann.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello everyone,

* Thomas Glanzmann <thomas@glanzmann.de> [2017-04-11 18:01]:
> another small follow-up in pppd 2.4.7 is [1]. When I manually hangup
> with this patch, all pending pppoe sessions are terminated as well.

> [1] https://github.com/paulusmack/ppp/commit/cd2c14f998c57bbe6a01dc5854f2763c0d7f31fb

another small follow up. This does not work always. Tonight at 03:00 I
hangup and the VPN did not come backup up. But this works reliable;

ifconfig eth1 down; sleep 10; ifconfig eth1 up; pon dsl-provider

Cheers,
        Thomas
