From: Nicholas Humfrey <njh@aelius.com>
Date: Sun, 14 Feb 2021 13:42:54 +0000
Subject: Re: Configuring pppd to accept link-local IPv6 interface id from remote peer
Message-Id: <0c05578d-6212-3e64-16e3-1aa5b3c67e34@aelius.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
In-Reply-To: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


On 14/02/2021 01:57, Michael Richardson wrote
> Nicholas Humfrey <njh@aelius.com> wrote:
>      > I have two pppd (v2.4.7) instances running, talking to each over over a
>      > serial port link. But I can't work out how to get the 'client' pppd to
>      > accept the link-local IPv6 interface identifier provided by the
>      > 'server' pppd. I am trying to use static addresses so I know the
>      > link-local IP address of the remote peer.
>
> So, basically you want to have ppp running with unnumbered links, and then
> maybe you do routing over that?
>
> I am not surprised that this hasn't been tested, and that there are bugs.
> Mostly, IP6CP assigns random IPv6-LL.

I guess it does surprise me that there are bugs! I had been assuming 
that I was doing something wrong but the more I look at it, the more it 
looks like a bug.


> If your goal is routing over unnumbered links, you don't really need the
> destination IPv6-LL to route to, it's enough to "dev ppp0" or whatever.

Yeah, that is perfectly fair. I did get static global IPv6 addresses and 
routing working, so the actual link-local address I guess isn't that 
important.

Just a bit frustrating not being able to achieve something that seems 
like it should be possible.


Thanks!

nick.

