From: Abdul J <postabdul@yahoo.com>
Date: Tue, 01 Feb 2005 23:06:26 +0000
Subject: Multilink in ppp-2.4.3
Message-Id: <20050201230627.51274.qmail@web30502.mail.mud.yahoo.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

I have a question regarding the new Multilink
implementation in the PPP-2.4.3. I am running this on
Fedora Core 2, kernel-2.6.10.

Starting 2.4.3 a call drop on primary link does not
destroy the bundle, instead the first pppd keeps
running until there is atleast one active link in the
bundle. Nice!

For example, if I have two dial-up connection
multilinked together. Even if the first link is
dropped, since the second link is active the interface
ppp0 is active and the connection still exists. But
the problem is I am unable to redial the dropped link
because the pppd process is still running on that link
and the serial port is locked. If I try to redial the
first link, I get an error:
Feb 1 17:48:33 dhcp034 pppd[3417]: tcgetattr: No such
device or address (line 907)

The only way I can redial is terminate (kill -9) the
first pppd process (and hence terminate all the links
of the bundle) and redial all of them. 

My question is: Is there anyway in which I can redial
the dropped primary (first) link once a call
drop/hangup occurs without destroying the whole
bundle.

Note: This is a test setup and I control both ends of
the ppp connection.

Please give your comments/suggestions

Thanks,
Abdul

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
