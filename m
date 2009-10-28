From: tony.chamberlain@lemko.com
Date: Wed, 28 Oct 2009 19:08:02 +0000
Subject: pty
Message-Id: <W5658327625161531256756882@webmail25>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

This is somewhat different from my other question and is on a different
system and of course the person who developed it left.

There is a mobile phone which connects to a CDMA BTS and then from there
to a Linux machine.  A process called pdsn is running on the linux machine
and detects when the mobile phone calls.  It then spawns a process with
a bunch of parameters (port, ip, etc) like this

   pppd pty 'ppp_relay -p port -a address ...'

So pppd uses ppp_relay (which is also something he wrote) to handle the
ppp stuff.

Now this worked on Red Hat 9 but there seems to be a problem on CentOS 4.5.
From what I can tell, ppp_relay receives a TCP port number (I guess from 
pdsn?) and tries to communicate to the pppd process through this port.
It sends a message but never gets a response.

I am curious how the pppd pty process (in this case ppp_relay) communicates
to pppd?  We did a netstat and found pppd but no TCP nor UDP ports were
associated with it.  It was just a UNIX-type process.

Is ppp_relay attempting to talk through a port when it should be using
some kind of Linux message?


