From: Bret Hughes <bhughes@elevating.com>
Date: Thu, 11 Nov 2004 16:36:47 +0000
Subject: problem with ssh based tunnel when primary name server down
Message-Id: <1100191007.2753.133.camel@bretsony>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I worked for several hours yesterday trying to track down what was
causing  LCP timeouts on initiating a ssh based ppp connection.  Turns
out the problem was due to the initiating machine's primary name server
provided by bell canada being down.  

Initial connection is made and the ssh connection completed ok using the
secondary server as defined in /etc/resolv.conf.  pppd is started on the
remote box but then the connection never gets established due to LCP
time out errors.  Is there something during this process that does not
properly fall back to the secondary name server?

This is using pppd as distributed in Fedora Core 1 on both boxes.

# pppd --version
pppd version 2.4.1

the command line that runs via a script on the client is:

/usr/sbin/pppd updetach lock connect-delay 15000 lcp-echo-interval 30
lcp-echo-failure 4 	noipdefault noauth debug  	ipparam zpn1 linkname
zpn1 	pty "/usr/bin/ssh -q -t -t -e none -o 'StrictHostKeyChecking no'
-o 'Batchmode yes' -i /root/.ssh/vpnkey -l vpnuser remotename.dyndns.org
"


both initiating pppd and remote pppd exit with rc= 10

Is this a bug?

Bret


