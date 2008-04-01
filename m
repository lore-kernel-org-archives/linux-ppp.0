From: James Cameron <james.cameron@hp.com>
Date: Tue, 01 Apr 2008 21:53:55 +0000
Subject: Re: LCP Renegotiates After IP Connection
Message-Id: <20080401215355.GB3275@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1207083431.8474.15.camel@pago>
In-Reply-To: <1207083431.8474.15.camel@pago>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

G'day Tyler,

I've had that situation on a Maxon MM-5100 USB CDMA modem.  An LCP
ConfReq packet appears out of the blue.  My prior postings on that in
early 2005 here ... determined that pppd is reacting properly, and that
you have to find a way to prevent the packet from appearing.

(In my case the triggering condition was to send a packet out the
interface that had a source IP address different to that negotiated.
Once I added iptables rules to block such packets, the trigger was
removed.)

So for a wild guess, use tcpdump to ensure that nothing unexpected is
being sent out your new network interface.

Now, looking at your log in more detail ... I'm surprised that you get
an LCP ConfReq and ConfAck sequence up front consisting of 10 pairs of
packets, each with the same id and magic number.  It is as if the
embedded device is echoing the packets back to your host.  But I thought
pppd had code to detect that, and there's no sign of that detection
triggering.

I suggest you use the record option and use pppdump or wireshark on the
result, so as to find out what is happening.

Other than that ... sounds like the embedded device wants something
different.  If it works in a stable fashion with something else, a dump
of that data stream may be handy for comparison.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
