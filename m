From: Thomas Glanzmann <thomas@glanzmann.de>
Date: Tue, 11 Apr 2017 16:01:19 +0000
Subject: Re: pppoe encapsulated udp packets which appear on ethernet disappear between pppoe and ppp0 after p
Message-Id: <20170411160119.GA9461@glanzmann.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <20170410183851.GA4442@glanzmann.de>
In-Reply-To: <20170410183851.GA4442@glanzmann.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello Michael,
another small follow-up in pppd 2.4.7 is [1]. When I manually hangup
with this patch, all pending pppoe sessions are terminated as well.

[1] https://github.com/paulusmack/ppp/commit/cd2c14f998c57bbe6a01dc5854f2763c0d7f31fb

Cheers,
        Thomas
