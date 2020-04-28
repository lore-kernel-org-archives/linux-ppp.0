From: Guillaume Nault <gnault@redhat.com>
Date: Tue, 28 Apr 2020 11:00:33 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <20200428110033.GA25921@pc-3.home>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

On Tue, Apr 28, 2020 at 12:18:38PM +0200, David Balažic wrote:
> On Tue, 28 Apr 2020 at 01:34, David Balažic <xerces9@gmail.com> wrote:
> >
> > On Fri, 24 Apr 2020 at 17:55, Guillaume Nault <gnault@redhat.com> wrote:
> > > You can monitor the evolution of you network devices with rtmon:
> > > $ rtmon file ./some/file.log link
> > >
> > > Then read it with ip monitor:
> > > $ ip monitor file ./some/file.log
> > >
> > > That should tell if eth1.3902 is ever passed down or even deleted.
> >
> > rtmon does not seem to be available on openwrt. It is part of iproute2, right?
> >
> > Are there any alternatives?
> > (until I find or compile it myself...)
> 
Sorry for late reply.
Yes, rtmon is part of iproute2.

> OK, I found 'ip', but not 'rtmon'.
> 
> Is running 'ip monitor link' equivalent?
> I'll start that...
> 
Yes. Both listen to the kernel netlink messages that are sent when
network interfaces are modified.

> Regards,
> David
> 
