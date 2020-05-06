From: Guillaume Nault <gnault@redhat.com>
Date: Wed, 06 May 2020 14:26:19 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <20200506142619.GA21453@pc-3.home>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

On Wed, May 06, 2020 at 11:52:48AM +0200, David Balažic wrote:
> On Mon, 4 May 2020 at 20:12, Guillaume Nault <gnault@redhat.com> wrote:
> >
> > On Mon, May 04, 2020 at 06:36:48PM +0200, David Balažic wrote:
> > > On Mon, 4 May 2020 at 15:01, Guillaume Nault <gnault@redhat.com> wrote:
> > > > You can use "%pM" for printing MAC addresses. Also, it'd be interesting
> > > > to have information about promisc mode:
> > > >   "dev %s, flags: %#x, promiscuity %u",
> > > >   dev->name, dev->flags, dev->promiscuity,
> > >
> >
> > > I'll report later values printed when a stray PADT appears.
> > >
> > Okay, but please keep printing the destination MAC address of the
> > packet. I was providing the flags/promiscuity string just to get extra
> > information, not to replace your original log.
> 
> This was logged now:
> 
> (all at May  6 05:34:50 2020 UTC)
> pppoe_disc_rcv PADT received, sid=1, SRC: a4:7b:2c:9e:c7:44, DST:
> 44:4e:6d:fd:c7:39
> pppoe_disc_rcv PADT received, own hw addr: c4:XX:XX:XX:XX:ed
>       dev eth1.3902, flags: 0x1003, promiscuity 0
> pppoe_disc_rcv PADT received, not four our address, ignoring
> 
> (the last line is from my fix, the connection is now not dropped when
> the PADT is not for us; works fine, my connection stays up and
> working)
> 
Looks like a more fundamental issue. This frame shouldn't have been
accepted in the first place. Can you also print the packet class
("... pkt_type %u", ..., skb->pkt_type)?

Testing the destination MAC here is likely to just paper over the
problem.

> I'll clean up and post the patch later.
> 
> Regards,
> David
> 
