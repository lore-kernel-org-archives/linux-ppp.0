From: Serge Koksharov <iceland@rbcmail.ru>
Date: Sat, 12 Feb 2005 17:35:25 +0000
Subject: 2 questions about dialup pppd use
Message-Id: <20050212173525.GA27282@iceland.spb.ru>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

  Dear all,

I'm using pppd v2.4.2 on my Gentoo Linux box with modem connection to my
provider. I have following questions:

Question1:
In /etc/ppp/ip-up.local I have following command to log my dialup sessions:
echo `date` ppp-on: Speed: $3\; Local IP: $4\; Remote IP: $5 >> /etc/ppp/history
The problem with this setup: No matter on which speed I'm connected (33600,
42666, etc) I'm always getting logged speed 115200. That's not I want! I think
script logs serial port speed, but I want connection speed logged instead.

Question2:
If in the same script /etc/ppp/ip-up.local I use following command to 
synchronize time:
ntpdate ntp.someserver.org
And in the /etc/ppp/ip-down.local I use command to log sent/received byte count
and connection time by this command:
echo " TX: $BYTES_SENT RX: $BYTES_RCVD for $((CONNECT_TIME/60)) minutes"\
>> /etc/ppp/history
I often get wrong connection time in /etc/ppp/history, for example:
 TX: 41180 RX: 291021 for 71582784 minutes.

Thank you!
-- 
Sincerely yours, Serge
