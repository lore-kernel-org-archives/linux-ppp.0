From: "Rajkumar S" <rajkumars@gmail.com>
Date: Wed, 24 Oct 2007 20:18:38 +0000
Subject: Re: ppp reconnects after receiving ConfReq id=0x3 <mru 1400>
Message-Id: <64de5c8b0710241306o531c4af2t4911340ebc5c3066@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <64de5c8b0710241117t66196e80u8cc5109f5466133@mail.gmail.com>
In-Reply-To: <64de5c8b0710241117t66196e80u8cc5109f5466133@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 10/25/07, Bill Unruh <unruh@physics.ubc.ca> wrote:
> On Wed, 24 Oct 2007, Rajkumar S wrote:
> > This usually happens if there is a default gateway via ppp0 device.
>
> I do not understand this statement. What is the purpose of the connection?

Sorry for the confusion, It is indeed for my internet access and it is
the default gateway. But to find out why the connection is getting
resetted frequently, I removed the default route temporarly to rule
out the possibility that a low signal strength is causing the issue.
(it's a CDMA Modem)

So the ConfReq is coming only when a packet is flowing from my system
to the peer and not when connection is idle.

raj
