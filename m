From: Clifford Kite <kite_linux-ppp@ev1.net>
Date: Tue, 15 Feb 2005 16:32:25 +0000
Subject: Re: 2 questions about dialup pppd use
Message-Id: <Pine.LNX.4.21.0502151025560.29464-100000@corncob.inetport.tld>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050212173525.GA27282@iceland.spb.ru>
In-Reply-To: <20050212173525.GA27282@iceland.spb.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Sat, 12 Feb 2005, Serge Koksharov wrote:

|Question2:
|If in the same script /etc/ppp/ip-up.local I use following command to 
|synchronize time:
|ntpdate ntp.someserver.org
|And in the /etc/ppp/ip-down.local I use command to log sent/received byte count
|and connection time by this command:
|echo " TX: $BYTES_SENT RX: $BYTES_RCVD for $((CONNECT_TIME/60)) minutes"\
|>> /etc/ppp/history                        ^^^^^^^^^^^^^^^^^^^^

That should be $(($CONNECT_TIME/60)) .

I often get wrong connection time in /etc/ppp/history, for example:
 TX: 41180 RX: 291021 for 71582784 minutes.

I don't see how you ever got the _right_ time.

---
Clifford Kite                                 http://ckite.no-ip.net


