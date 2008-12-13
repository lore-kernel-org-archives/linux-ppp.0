From: tony.chamberlain@lemko.com
Date: Sat, 13 Dec 2008 19:18:44 +0000
Subject: pptpd
Message-Id: <W9548217129274771229195924@webmail26>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


I set up a pptpd server and connected to it.  When I connected to it
(after figuring some routing) I was able to ping machines I wouldn't
otherwise be able to.

There is a range of IPs for the VPN in pptpd.conf:

   localip 192.168.0.1
   remoteip 192.168.0.234-238,192.168.0.245

and then in CHAP secrets I put logins and passwords.
Thing is, people need their own IP address (need to count
on it each time they connect).  For instance, if I have
something in chap secrets like



   lincoln * abraham *

I want to add something like 192.168.0.234 so that whenever someone
signs in as lincoln he alwasy gets IP address 192.168.0.234 (and similarly
if they log in as say, jefferson, they alwasy get 192.168.0.235 -- or
always the SAME IP different than 192.168.0.234)

Can I do this somehow?  Doesn't have to be in chap-secrets as long as
I can do it.  Is there something like an options.lincoln file?



