From: K-sPecial <spam@blazemail.com>
Date: Tue, 16 Nov 2004 04:56:21 +0000
Subject: Socket doesn't get EOF
Message-Id: <41998875.2020305@blazemail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hey, i've got an irc bot of over 3000 lines of perl. I test for EOF on 
occasion and do a reconnect if eof is detected. This works greatly for 
instances as when the socket times out or is disconnected in most 
manors. It doesn't although register an eof when pppd dies. I realy 
don't know if this might be specific to perl or if even in C this is an 
issue.

--K-sPecial

[ http://xzziroz.freeshell.org
   irc://xzziroz.dtdns.net       ]


