From: Clifford Kite <kite_linux-ppp@ev1.net>
Date: Tue, 15 Feb 2005 18:43:56 +0000
Subject: Re: 2 questions about dialup pppd use
Message-Id: <Pine.LNX.4.21.0502151234040.30477-100000@corncob.inetport.tld>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050212173525.GA27282@iceland.spb.ru>
In-Reply-To: <20050212173525.GA27282@iceland.spb.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, 15 Feb 2005, Bill Unruh wrote:
|On Tue, 15 Feb 2005, Clifford Kite wrote:
|> On Sat, 12 Feb 2005, Serge Koksharov wrote:
|>
|> |Question2:
|> |If in the same script /etc/ppp/ip-up.local I use following command to
|> |synchronize time:
|> |ntpdate ntp.someserver.org
|> |And in the /etc/ppp/ip-down.local I use command to log sent/received byte count
|> |and connection time by this command:
|> |echo " TX: $BYTES_SENT RX: $BYTES_RCVD for $((CONNECT_TIME/60)) minutes"\
|> |>> /etc/ppp/history                        ^^^^^^^^^^^^^^^^^^^^
|>
|> That should be $(($CONNECT_TIME/60)) .
|
|That is what I thought at first too. But try it
|A0
|echo $((A/10))
|
|At least in bash.

Sorry, you're right.  I thought this was something that failed for
me some time in the past.  I probably mis-remembered something else
(or the upgrade to bash 2.05b needed for the 2.6 kernel made it work).

---
Clifford Kite                                 http://ckite.no-ip.net

