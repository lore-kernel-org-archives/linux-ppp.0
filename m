From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 24 Oct 2007 18:40:52 +0000
Subject: Re: ppp reconnects after receiving ConfReq id=0x3 <mru 1400>
Message-Id: <18207.37300.531276.912490@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <64de5c8b0710241117t66196e80u8cc5109f5466133@mail.gmail.com>
In-Reply-To: <64de5c8b0710241117t66196e80u8cc5109f5466133@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Rajkumar S writes:
> I am trying to connect to net via a USB CDMA device, on a debian etch
> system. I can configure ppp with out any problem and also connect to
> net, but after I connect ppp disconnects and reconnects frequently
> after receiving this message from the peer.
> 
> rcvd [LCP ConfReq id=0x3 <mru 1400> <asyncmap 0x0> <auth chap MD5>
> <magic 0xfb6a0660>]

That's what it's supposed to do, as described in the state machine in
RFC 1661.  A new Configure-Request message in Opened state pushes us
back to Req-Sent or Ack-Sent state, depending on the contents of the
message.  It tears down the link and starts over.

> I am sitting behind this for couple of days with out any solution, any
> help to resolve this is much appreciated.

I've looked over your logs, and I'm afraid you'll need to ask the
owner of that peer system why he's sending you an unexpected LCP
Configure-Request message.

If he doesn't know or can't fix it, then you'll probably need to find
a different peer to talk with.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
