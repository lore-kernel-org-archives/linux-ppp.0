From: tony.chamberlain@lemko.com
Date: Mon, 04 Aug 2008 20:37:55 +0000
Subject: timeout
Message-Id: <W821531458670521217882275@webmail39>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I am using pptp which calls pppd.  I use ip-up.local to add routes.

Problem is, when connecting, after only 10 or 15 seconds the link gets dropped
by the peer due to inactivity (I think it is the peer and not me).

Anyway I can make a stupid script to ping the other side every 5 seconds, which keeps the link up.  But there should be a better way.  I thought lcp-echo-request set to 5 would do it, but that sends only if it hasn't heard from the peer in 5 seconds, and by then it is too late.

Any suggestions?


