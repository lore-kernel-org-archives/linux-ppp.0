From: Clifford Kite <kite_linux-ppp@ev1.net>
Date: Tue, 07 Sep 2004 14:23:11 +0000
Subject: Re: ms-dns not working
Message-Id: <Pine.LNX.4.21.0409070913350.12868-100000@corncob.localhost.tld>
List-Id: <linux-ppp.vger.kernel.org>
References: <37478.203.20.16.2.1094389183.squirrel@webmail.theforce.com.au>
In-Reply-To: <37478.203.20.16.2.1094389183.squirrel@webmail.theforce.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, 7 Sep 2004, Grahame Jordan wrote:

|I added the DEBUG to the bit that does the DNS.  I do not get that DEBUG
|in my logs. Hence it looks like it isn't being called.

|What should I do to debug further?

Recipe for a unified chat/pppd PPP debug log file:

  Add the line

  daemon.*;local2.*                              /var/log/ppp.log

  (may need Tab separators) to the /etc/syslog.conf file, and then do
  " killall -HUP syslogd " to make syslogd reread it.

Then start pppd again and all the messages should be in the file above.

---
Clifford Kite                                 http://ckite.no-ip.net


