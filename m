From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 18 Nov 2015 21:19:04 +0000
Subject: Re: Problems with pppd option: record file
Message-Id: <564CEB48.2040605@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <564CBFC6.4090409@web.de>
In-Reply-To: <564CBFC6.4090409@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 11/18/15 16:11, Thomas Bergholz wrote:
> Hey James - thanks for the input,
> 
> Starting over at top :-)
> 
> Trying to find out why the capture file does not show up. I am
> interested in the parts which tshark does not display.
> https://wiki.wireshark.org/CaptureSetup/PPP#Linux

That page isn't entirely accurate in this particular case.

If you use wireshark (or tshark) on a PPP device -- say, interface
"ppp0" on your system -- then you will see only the network layer
traffic.  That's the problem that this web page is documenting.

However, you're running PPP over PPPoE, and that's running on Ethernet.
 If you run wireshark on the underlying Ethernet interface -- "eth0" on
your system -- then you will see ALL of the traffic.  That we page
doesn't apply, because "eth0" is Ethernet, not PPP.

The web page should probably be updated to make things a little clearer.

> I activated "debug" and "kdebug 4" to track down probable causes for the
> missing capture file (well yes, kdebug may not make much sense).

Neither of those make sense here.  "debug" shows (primarily) the PPP
negotiation details.  It won't show you why a command line option isn't
implemented.  "kdebug" sends flags into the /dev/ppp kernel driver to
tell it to print things to the system console.  Generally, that's not
too useful unless you have kernel driver issues to work out.

> I have to admit that I went the lazy way and did not compile pppd myself
> yet.

My guess would be that the person who did compile it took it on himself
to delete some useless options.

Just a guess, though.  You'd have to look upstream for that information.
 It's mostly useless, but "record" works fine for me.  :-/

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
