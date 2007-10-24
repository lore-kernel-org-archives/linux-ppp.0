From: "Rajkumar S" <rajkumars@gmail.com>
Date: Wed, 24 Oct 2007 18:29:09 +0000
Subject: ppp reconnects after receiving ConfReq id=0x3 <mru 1400>
Message-Id: <64de5c8b0710241117t66196e80u8cc5109f5466133@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

I am trying to connect to net via a USB CDMA device, on a debian etch
system. I can configure ppp with out any problem and also connect to
net, but after I connect ppp disconnects and reconnects frequently
after receiving this message from the peer.

rcvd [LCP ConfReq id=0x3 <mru 1400> <asyncmap 0x0> <auth chap MD5>
<magic 0xfb6a0660>]

my ppp config is:

hide-password
noauth
connect "/usr/sbin/chat -v -f /etc/chatscripts/vsnl"
debug
/dev/ttyACM0
460800
defaultroute
replacedefaultroute
noipdefault
user "internet"
ipparam vsnl
usepeerdns

This usually happens if there is a default gateway via ppp0 device.
The  connection stays online for hours if there is no default gw. I am
posting full logs at http://pastebin.ca/748250

I am sitting behind this for couple of days with out any solution, any
help to resolve this is much appreciated.

raj
