From: Clifford Kite <kite_linux-ppp@ev1.net>
Date: Sun, 25 Jan 2004 02:05:23 +0000
Subject: Re: pppd 2.4.2, Control-C bug?
Message-Id: <Pine.LNX.4.21.0401241959060.5506-100000@corncob.localhost.tld>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.21.0401231150020.2019-100000@corncob.localhost.tld>
In-Reply-To: <Pine.LNX.4.21.0401231150020.2019-100000@corncob.localhost.tld>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Sun, 25 Jan 2004, Paul Mackerras wrote:

|Clifford Kite writes:
|
|> Control-C at the keyboard before the connection completes results in
|> 
|> Terminating on signal 2.
|> 
|> repeated, seemingly without end.  "kill -TERM $(pidof pppd)" doesn't
|> terminate pppd or the messages.  "kill -KILL $(pidof pppd)" does both.
|
|Yes.  We got a "bug" report from a user (who didn't understand what
|the code was actually doing) and one of the ppp team checked in his
|proposed fix.

Well, I don't pretend to understand the explanation much - I'm not a C
programmer.  But I did understood enough to correct main.c and it works
a treat.  Thanks!

---
Clifford Kite                                 http://ckite.no-ip.net

