From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 18 Sep 2006 16:10:05 +0000
Subject: Re: pppd security
Message-Id: <17678.50397.206464.812992@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <450EBBCE.5030204@freemail.gr>
In-Reply-To: <450EBBCE.5030204@freemail.gr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

jfj writes:
> My question now is, if it is possible to attack this by
> sending data directly to the PPP layer. Can one open
> /dev/ppp, construct a UDP packet, encapsulate this into
> a PPP packet, write it to some /dev/ppp device and reach
> some internet host?

No more or less so than it's possible to do the same via an Ethernet
adapter.

/dev/ppp provides a datalink layer interface to the system.  The
security on such interfaces (in general) ought to be the same.

(Note that you wouldn't want to "encapsulate" it as PPP.  That's what
the PPP driver itself does.  If you were to open /dev/ppp for such a
hack, you'd transmit raw IP packets, much in the same way you would if
you opened an Ethernet driver.)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
