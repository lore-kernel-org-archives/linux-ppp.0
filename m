From: Guillaume Nault <gnault@redhat.com>
Date: Wed, 06 May 2020 15:02:10 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <20200506150210.GB21453@pc-3.home>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

On Mon, May 04, 2020 at 08:43:26PM +0200, David Balažic wrote:
> On Mon, 4 May 2020 at 20:12, Guillaume Nault <gnault@redhat.com> wrote:
> >
> > On Mon, May 04, 2020 at 06:36:48PM +0200, David Balažic wrote:
> > > On Mon, 4 May 2020 at 15:01, Guillaume Nault <gnault@redhat.com> wrote:
> > > > You can use "%pM" for printing MAC addresses. Also, it'd be interesting
> > > > to have information about promisc mode:
> > > >   "dev %s, flags: %#x, promiscuity %u",
> > > >   dev->name, dev->flags, dev->promiscuity,
> > >
> > > "ifdown wan" triggers a PADT response from the server, and then this
> > > code prints:
> > >
> > >  dev eth1.3902, flags: 0x1003, promiscuity 0
> > >
> > I'm not sure what "ifdown wan" is supposed to do. Assuming "wan" is the
> > name of your ppp interface (wasn't it "pppoe-wan" in your previous
> > logs?) and that ifdown works like on Debian, then it makes sense that
> > the peer disconnects the PPPoE session by sending a PADT. At least now
> > the device isn't in promisc mode.
> 
> Yes, "wan" is the interface alias. ifdown "closes" it... sends a PADT
> to the server, server replies with PADT...
> 
Thanks.

> > > I'll report later values printed when a stray PADT appears.
> > >
> > Okay, but please keep printing the destination MAC address of the
> > packet. I was providing the flags/promiscuity string just to get extra
> > information, not to replace your original log.
> >
> > Also, what's the driver of your NIC (ethtool -i eth1)?
> 
> # ethtool  -i eth1
> driver: ag71xx
> 
Ok, can you connect this interface directly to a box under your control
and use this box to ping the ag71xx interface using an invalid
destination MAC address?

Assuming your other box runs Linux and the IP address assigned to the
ag71xx NIC is 192.0.2.1, the test would look like this:

$ ping 192.0.2.1    # Basic test. Also makes Linux get the peer dst MAC

$ ip neighbour list # Show the peer dst MAC
192.0.2.1 dev ethX lladdr aa:bb:cc:dd:ee:ff REACHABLE

$ ip neighbour replace 192.0.2.1 dev ethX lladdr aa:bb:cc:dd:ee:f0

$ ping 192.0.2.1   # Try to ping again, this time using a wrong dst MAC

> Regards,
> David
> 
