From: Thomas Bergholz <ThomasBergholz@web.de>
Date: Wed, 18 Nov 2015 18:13:26 +0000
Subject: Problems with pppd option: record file
Message-Id: <564CBFC6.4090409@web.de>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hey linux-ppp users,

not sure if this may be a bug or just me making a mistake.

It would be great if you could take a look:

I am having problems getting the "record filename" option to work.
The pppd process does work fine and connects to the internet, but it
does not create the capture file.
I also do not see any "errors" in the pppd.log file, which i configured.
Everything looks good from my point of view.

I am using ubuntu 14.04 and rasbian.
pppd version 2.4.5 (for both)

My peer configuration looks like this:

# CONFIG FILE
kdebug 4
debug
logfile /tmp/pppd.log
record /tmp/pppd_capture.pcap
plugin rp-pppoe.so
eth0
user "someuser"
unit 0
noipdefault
defaultroute
replacedefaultroute
hide-password
noauth
persist
maxfail 10
lcp-echo-interval 20
lcp-echo-failure 3
mtu 1492
default-asyncmap
noaccomp
refuse-pap

I recongnized that the raspi prints "unrecognized option 'record'", even
though the "record file" option is mentioned in the pppd manpage.
Ubuntu does not print this message.

Do you have any ideas where i can look for the cause?

Best Regards,
Thomas
