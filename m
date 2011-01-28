From: Juergen Beisert <juergen127@kreuzholzen.de>
Date: Fri, 28 Jan 2011 15:49:51 +0000
Subject: DSL link sometimes dies: pppd or kernel problem?
Message-Id: <201101281649.51225.juergen127@kreuzholzen.de>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

I'm running a small x86 based box with a 2.6.28.10 (mostly) vanilla kernel and
pppd-2.4.5 to act as my DSL router. Sometimes the DSL link dies and I don't
know where to search for the reason. The external modem is connected via a
USB-to-Network-Dongle (here interface name 'dsl').

Here the log from such an event 20 minutes ago:

[...]
Jan 28 16:04:50 star pppd[249]: Modem hangup
Jan 28 16:04:50 star pppd[249]: Connect time 397.6 minutes.
Jan 28 16:04:50 star pppd[249]: Sent 5558948 bytes, received 40122574 bytes.
Jan 28 16:04:50 star pppd[249]: Connection terminated.
[...]
Jan 28 16:05:21 star pppd[249]: Starting link
Jan 28 16:05:21 star pppd[249]: error sending pppoe packet: Network is down
Jan 28 16:05:21 star pppd[249]: error receiving pppoe packet: Network is down
Jan 28 16:05:26 star pppd[249]: error sending pppoe packet: Network is down
Jan 28 16:05:36 star pppd[249]: error sending pppoe packet: Network is down
Jan 28 16:05:56 star pppd[249]: Timeout waiting for PADO packets
Jan 28 16:05:56 star pppd[249]: Unable to complete PPPoE Discovery
Jan 28 16:06:30 star pppd[249]: Starting link
Jan 28 16:06:30 star pppd[249]: error sending pppoe packet: Network is down
Jan 28 16:06:30 star pppd[249]: error receiving pppoe packet: Network is down
Jan 28 16:06:36 star pppd[249]: error sending pppoe packet: Network is down
Jan 28 16:06:46 star pppd[249]: error sending pppoe packet: Network is down
Jan 28 16:07:06 star pppd[249]: Timeout waiting for PADO packets
Jan 28 16:07:06 star pppd[249]: Unable to complete PPPoE Discovery
[...]
Jan 28 16:07:37 star pppd[249]: Starting link
Jan 28 16:07:37 star pppd[249]: error sending pppoe packet: Network is down
Jan 28 16:07:37 star pppd[249]: error receiving pppoe packet: Network is down
[...]
Jan 28 16:07:42 star pppd[249]: error sending pppoe packet: Network is down
[...]
Jan 28 16:08:12 star pppd[249]: Timeout waiting for PADO packets
Jan 28 16:08:12 star pppd[249]: Unable to complete PPPoE Discovery

Then I stopped the running pppd:

[...]
Jan 28 16:08:30 star pppd[249]: Terminating on signal 15
Jan 28 16:08:30 star pppd[249]: Exit.

And started it again immediately:

[...]
Jan 28 16:08:35 star pppd[420]: Plugin rp-pppoe.so loaded.
Jan 28 16:08:35 star pppd[420]: RP-PPPoE plugin version 3.8p compiled against pppd 2.4.5
Jan 28 16:08:35 star pppd[421]: pppd 2.4.5 started by root, uid 0
Jan 28 16:08:35 star pppd[421]: Using interface ppp0
Jan 28 16:08:35 star pppd[421]: local  IP address 10.64.64.64
Jan 28 16:08:35 star pppd[421]: remote IP address 10.112.112.112
Jan 28 16:08:36 star pppd[421]: Starting link
Jan 28 16:08:37 star pppd[421]: PPP session is 39172
Jan 28 16:08:37 star pppd[421]: Connected to xx:xx:xx:xx:xx:xx via interface dsl
Jan 28 16:08:37 star pppd[421]: Connect: ppp0 <--> dsl
[...]
Jan 28 16:08:37 star pppd[421]: PAP authentication succeeded
Jan 28 16:08:37 star pppd[421]: peer from calling number xx:xx:xx:xx:xx:xx authorized
Jan 28 16:08:37 star pppd[421]: Local IP address changed to xxx.xxx.xxx.xxx
Jan 28 16:08:37 star pppd[421]: Remote IP address changed to xxx.xxx.xxx.xxx

Since the restart, it works again. No reboot of the machine, I only restared
the pppd.

What can be broken? pppd or the kernel?

Regards,
jbe
