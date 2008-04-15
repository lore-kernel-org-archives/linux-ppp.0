From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 15 Apr 2008 13:59:40 +0000
Subject: Re: What are the correct NETMASKs for multiple PPPoE interfaces in a StaticIP block?
Message-Id: <18436.46284.383645.688340@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <b510d0250804140743o4528107dq834a63e4666f549d@mail.gmail.com>
In-Reply-To: <b510d0250804140743o4528107dq834a63e4666f549d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Gerianne McC writes:
> Hi James,
> 
> >  >        ppp0:5, IP address = x.x.x.237
> >
> >  That should work, though it's perhaps not how I'd handle it.
> 
> I'm definitely in 'learning mode' -- how *would* you handle it?

I'd likely route it -- I'd set up the PPP link on that one system,
then configure a /29 on an available Ethernet interface for that
address range, and route between the two.  To conserve addresses, I'd
assign the same IP address as the local address on the Ethernet link.
(Yes, that's legal.)

Since there are only two interfaces, "routing" becomes quite trivial
-- all you need is a single default route pointing to the remote
address on the PPP link, and that's something that pppd can provide
with the "defaultroute" option.

I'm not sure what use I'd have for a bunch of manually configured
statics that only one machine can use.  (Perhaps I'm missing part of
your planned deployment, though.)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
