From: Bill Unruh <unruh@physics.ubc.ca>
Date: Wed, 24 Oct 2007 21:15:50 +0000
Subject: Re: ppp reconnects after receiving ConfReq id=0x3 <mru 1400>
Message-Id: <Pine.LNX.4.64.0710241410030.32363@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <64de5c8b0710241117t66196e80u8cc5109f5466133@mail.gmail.com>
In-Reply-To: <64de5c8b0710241117t66196e80u8cc5109f5466133@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, 25 Oct 2007, Rajkumar S wrote:

> On 10/25/07, Bill Unruh <unruh@physics.ubc.ca> wrote:
>> On Wed, 24 Oct 2007, Rajkumar S wrote:
>>> This usually happens if there is a default gateway via ppp0 device.
>>
>> I do not understand this statement. What is the purpose of the connection?
>
> Sorry for the confusion, It is indeed for my internet access and it is
> the default gateway. But to find out why the connection is getting
> resetted frequently, I removed the default route temporarly to rule
> out the possibility that a low signal strength is causing the issue.
> (it's a CDMA Modem)

Ah, so it is a wireless phone connection? In that case all bets are off.
The phones tend to work by doubling the layers-- you sign on to the cell
phone and it then makes the connection to the remote end. And the writers
of ppp for the cell phones tend to be some poor flunkeys who were handed
the job of writing a ppp with no training or prior experience, and they not
unnaturally tend to make a hash of it (ppp is a complex protocol and there
are loads of places to screw up).

So, it is probably the ppp in your phone which is constantly asking for
reauthentication.

It may well be that it has a timeout, which kicks in after x seconds. So
one thing you might be able to try is to either switch on the LCP-ECHO
provisions, or to ping the other side of the connection every 15 sec to
make sure that the connection stays open.


>
> So the ConfReq is coming only when a packet is flowing from my system
> to the peer and not when connection is idle.

If I am right then it is coming where there has been a long lull and you
start sending packets. If that is not the case, then my theory is a load of
fertiliser.


>
> raj
>

