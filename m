From: "Milan P. Stanic" <mps@rns-nis.co.yu>
Date: Fri, 23 Jan 2004 22:23:15 +0000
Subject: Re: pppd 2.4.2, Control-C bug?
Message-Id: <20040123222315.GA24521@rns-nis.co.yu>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.21.0401231150020.2019-100000@corncob.localhost.tld>
In-Reply-To: <Pine.LNX.4.21.0401231150020.2019-100000@corncob.localhost.tld>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Fri, Jan 23, 2004 at 02:53:13PM -0600, Clifford Kite wrote:
> Problem:  After pppd 2.4.2 - with the updetach option - is run by root
> from a terminal window, a control-C from the keyboard before the PPP
> link completes doesn't terminate pppd.
> 
> The line below was derived from my usual connection script and used for
> testing.
> 
> /usr/sbin/pppd connect '/usr/sbin/chat -v "" ATZ\&F OK ATM0W1\&D1%E1s95G \
> OK ATDTxxx-xxxx TIMEOUT 45 V90 \\c TIMEOUT 15 CONNECT \\d\\c' /dev/ttyS1 \
> 115200 crtscts modem updetach lock defaultroute debug
> 
> Control-C at the keyboard before the connection completes results in
> 
> Terminating on signal 2.
> 
> repeated, seemingly without end.  "kill -TERM $(pidof pppd)" doesn't
> terminate pppd or the messages.  "kill -KILL $(pidof pppd)" does both.
> 
> From /var/log/messages:
> Jan 23 11:19:34 corncob pppd[1849]: pppd 2.4.2 started by root, uid 0
> Jan 23 11:19:34 corncob pppd[1849]: Removed stale lock on ttyS1 (pid 1828)
> Jan 23 11:19:35 corncob pppd[1849]: Terminating on signal 2.
> Jan 23 11:19:50 corncob last message repeated 33707 times
> 
> The same thing occurs after a Control-C before completion of the
> usual connection script, which reports pppd's return status after
> "kill -KILL $(pidof pppd)":
> 
> The pppd return status is 137
> 
> Pppd 2.4.2b3 does correctly terminate with a Control-C by root at the
> keyboard.
> 
> Is it me or pppd 2.4.2? :)

I noticed that, but I patched pppd-2.4.2 to have callback with
portslave in "server mode". Because that I thought that the patch
is bad. Your message convinced me that that problem is in the stock
pppd, especially because the same patch applied to 2.4.2b3 didn't
show any problem.

