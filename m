From: Thomas Chen <tchen@on-go.com>
Date: Tue, 04 May 2004 14:37:23 +0000
Subject: ppp MULTILINK issue / problem
Message-Id: <BCBD226C.57C%tchen@on-go.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


i am testing PPP MULTILINK

server side is running LINUX 2.4.18-3
client side is running LINUX 2.4.19

the link between them are 56k analog modems


i can place calls and set up the MUTILINK.... and the
links are bundled together just fine....

now i am testing "UNBUNDLING" of the link.... if i unplug
the one of the modem (not the master link), i do not see
the IP traffic anymore, though i do see data on the serial
link (i put a serial line monitor on the serial port),
but no more IP packets coming out of PPP

i do see a couple linkes of mp_construct sequencing error

appreciate if any pointer on where to look....

thansk

tom


