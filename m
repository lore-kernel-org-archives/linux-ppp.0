From: Michael Richardson <mcr@sandelman.ca>
Date: Tue, 05 May 2015 14:04:54 +0000
Subject: Re: PPP over PCIe
Message-Id: <26171.1430834694@sandelman.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <33cf3cfabb7f5bdd6ea2c37df77eac1d@sarv.net>
In-Reply-To: <33cf3cfabb7f5bdd6ea2c37df77eac1d@sarv.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


<salix@opencores.org> wrote:
    > I want to send ppp packets generated in linux ppp module over PCIe
    > instead of serial port. and then through FPGA send packets out.

The kernel PPP system supports sending it out over Ethernet or ATM.
Note that there is a difference between async ppp (HDLC stuffing), and
sync ppp (no stuffing).

    > I using RIFFA architecture for send and receive data to/from FPGA via
    > PCIe,
    > RIFFA has library in user space to communicate with it's driver.
    > RIFFA site: https://sites.google.com/a/eng.ucsd.edu/matt-jacobsen/riffa

If you want to do this at some speed, you don't want to take a trip through
userspace.  I don't know what RIFFA is, but I suggest you want to use an
in-kernel interface.

    > is it enough to change ppp_generic.c and ppp_channel.h and tty.c?

No, as the packets don't really go through userspace even for serial.

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        | network architect  [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [

