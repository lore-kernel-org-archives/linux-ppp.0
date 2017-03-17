From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 17 Mar 2017 12:05:12 +0000
Subject: Re: Setup pppd over rs-485 point-to-point
Message-Id: <666e2e91-d0c9-ccc8-c79a-2f09211a6bd7@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <2d19b2f1-bb0f-9a09-6d40-f05388c66af5@gmail.com>
In-Reply-To: <2d19b2f1-bb0f-9a09-6d40-f05388c66af5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 03/16/17 23:18, Woody Wu wrote:
> Hi,
> 
> I want to setup pppd to connect a Linux laptop to an embedded Linux
> device. The Linux box connected to a rs-232 to rs485 converter, then the
> convert connected via a two-wire rs-485 cable to the embedded Linux
> device's rs-485 port.
[...]
> On the otherhand, I can make success with similar commands when two
> devices connected with rs-232.  So I guess, this failure was because the
> rs-485 is half-duplex.  But I searched google, people seemed say pppd
> should work over a point-to-point rs-485 connection.  So I want to get
> help from your experts.

I see evidence of other problems in your trace as well.  The PC is
receiving its own transmissions, which is very bad, and is the proximate
cause of the failure.  It means that the converter device you're using
has local echo enabled.  If there's some way to turn off local echo, you
may get a little further.  Check the manufacturer's documentation for
that converter.  This shouldn't happen:

sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]

But even though that caused this failure, I don't think it's the root
problem.  As another poster said, it's not going to work like this.

Two-wire TIA-485 is indeed half-duplex.  There are protocols designed
for use on it (MODBUS is one example), but right in the introduction to
RFC 1661 (PPP), it says that you need full-duplex by design.

I think it would be possible to make it work on a half-duplex link, but
it wouldn't be simple or terribly efficient.  The two schemes I can
imagine are:

  - Use a master-slave type of relationship.  This means having one end
    (perhaps the PC in this case) sending some sort of signal (I suggest
    using back-to-back flags; two 0x7E in a row) to let the slave side
    know it should send something if it has it, or to send an empty
    packet.  The master then just periodically polls for data or sends
    what it has.

  - Use something like ALOHA or CSMA.  Both of these require some means
    of knowing that your transmitted message has been garbled by a
    collision so that you can back off and retry.  That might require
    some electrical work on your part.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
