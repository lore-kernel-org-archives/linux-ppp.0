From: Lo Yuk Fai <loyukfai@gmail.com>
Date: Tue, 10 Jan 2012 22:54:03 +0000
Subject: Poptop MPPE Issue...?
Message-Id: <CAJRGjhotd3-S4OdeU=yyCPZMGbmeXBw8-Svo42DdwDLKTR1myQ@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

Hello,

Long story short, I’ve setup pptpd/poptop on a Debian Squeeze running
2.6.32 kernel. For some reasons there are a lot of these errors when I
browse the Internet through the server…

Jan 10 16:07:06 debian kernel: [ 2407.827927] mppe_compress[0]: osize
too small! (have: 1404 need: 1408)
Jan 10 16:07:06 debian kernel: [ 2407.827930] ppp: compressor dropped pkt

Tried fiddling around the mtu and mru setting to no avail. Googled for
hours and most of the results talk about patches that are years old
and should be implemented already...?

The pptpd-options and pptpd.conf are as defaults, except for the IP ranges.

Any idea…?

Thanks in advance.

Lo Yuk Fai

P.S. Upgraded the kernel to 2.6.39 via debian-backport, but problem persists.
