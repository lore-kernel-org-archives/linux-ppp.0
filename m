From: James Cameron <james.cameron@hp.com>
Date: Fri, 30 May 2008 03:36:17 +0000
Subject: Re: howto setup a route by netlink socket
Message-Id: <20080530033617.GD5572@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200805300937396564081@gmail.com>
In-Reply-To: <200805300937396564081@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

You could look at the ip(8) command source to find out how it is done,
/sbin/ip or /bin/ip is part of the iproute package on Red Hat and Debian
based Linux distributions.

Latest version of pptp has a hack that uses system(3) to execute ip(8).
If you can figure a way to do this without using system(3) then I'm
quite interested.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
