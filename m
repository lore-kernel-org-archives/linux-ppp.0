From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 04 Feb 2009 17:11:33 +0000
Subject: Re: VPN disconnect
Message-Id: <18825.52293.434416.813281@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <W66896262654641233767149@webmail29>
In-Reply-To: <W66896262654641233767149@webmail29>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

tony.chamberlain@lemko.com writes:
> This is another VPN question.
> 
> We have a regular IP address which we use to connect to a PPTP VPN
> which assigns us 10.0.1.29.  If the PPTP connection goes down, we
> will lose that address.
> 
> Our software relies on our IP address being 10.0.1.29.  Is there a way,
> if the VPN temporarily goes down, to maintain the IP address of
> 10.0.1.29 ?

You can tell pppd to request a particular address by adding it to your
options, like this:

	pppd 10.0.1.29: ipcp-accept-local

(The ":" at the end means "request this local address, and don't
insist on any particular peer address.")

pppd doesn't have an automatic means to save the last-used address for
a link and pick it up again.  Perhaps it should have one, but you
could do this in a script by having your own /etc/ppp/ip-up that
stores $IPREMOTE into a file, and then pull in that file's contents
for a later invocation of pppd.

Note that this just tells pppd to request a particular address.
There's no telling whether the peer understands what to do with such a
request, or if it can or will honor it.  Some servers may refuse to
negotiate at all under such conditions, causing the link to fail.
(Bugs are unfortunately common.)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
