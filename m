From: tony.chamberlain@lemko.com
Date: Wed, 10 Dec 2008 17:33:11 +0000
Subject: server config
Message-Id: <W30205118275861228930391@webmail37>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Hi

I am looking for something similar to pptpconfig but for the server.
I can't seem to install network manager because it complains about dbus.
Not sure that is the right program anyway for what I want to do?

Also meanwhile I am trying to do by hand.  When I run pppd or pppd -detach
I see all the junk characters coming to the screen.  I know you can specify
a device for it to run on, but I can't figure out how to get it to go over
eth0 (they will be IPing in, not dialing in).  I tried pppd eth0 and 
pppd device eth0 but nothing seems to work.  I tried to install pppdlogger 
but something about my mysql client has a bunch of unreferenced functions.

Anyone have any ideas?  pptpd does not seem to start up pppd also.


