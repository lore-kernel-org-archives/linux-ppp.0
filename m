From: Steven Geerts <Steven.geerts@thomson.net>
Date: Tue, 13 Dec 2005 13:30:00 +0000
Subject: pppoe server
Message-Id: <1134480600.3357.4.camel@cplx154.eu.thmulti.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

All

can anybody telll me where to find some more information on how to setup
a pppoe-server?

Currently I'm using suse linux 9.3 as my server to dial in via a windows
xp client (yeah I know).  It hasn't been successfull for almost 2 weeks
now.

When I check with ethereal is see that the session gets confirmed, but
it hangs at "PPP LC Configuration request", it seems that the server is
not responding to this request.  How can I solve this.

My server has 2 networks cards:
	- eth0: 10.0.0.1
	- eth1: 50.0.0.1

I start the pppoe-server with following command:
	$pppoe -C myacname -S myservice -I eth1 -L 50.0.0.1 -R 50.0.0.100

pppoe-server-options are set to:
debug
dump
require-pap
login
lcp-echo-interval 10
lcp-echo-failure 2


I can not figure it out what could be wrong. :-(

regards
steven




