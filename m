From: Thomas Glanzmann <thomas@glanzmann.de>
Date: Tue, 11 Apr 2017 13:50:41 +0000
Subject: Re: pppoe encapsulated udp packets which appear on ethernet disappear between pppoe and ppp0 after p
Message-Id: <20170411135041.GA30428@glanzmann.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <20170410183851.GA4442@glanzmann.de>
In-Reply-To: <20170410183851.GA4442@glanzmann.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

Hello Michael,

> It sounds like they aren't part of the correct PPPoE session to me.
> As if the other end is not killing it's PPP session when the new one forms.

wow. You nailed it. Thank you for identifying the root cause. I'll open a call
with German Telekom to fix there ppp endpoint.

(x1) [~/pcaps] tshark -nr eth1.pcap -T fields -e 'pppoe.session_id' | sort -u

0x0000b53b
0x0000b5e0
0x0000b7b3

These are exactly the packages I was missing:

(x1) [~/pcaps] tshark -nr eth1.pcap -Y 'pppoe.session_id = 0x0000b5e0'
 2938  12.176318 88.198.215.20 → 217.92.232.50 UDP 118 5000 → 5000 Lenh
 5247  21.951571 88.198.215.20 → 217.92.232.50 UDP 118 5000 → 5000 Lenh
 5248  21.952077 88.198.215.20 → 217.92.232.50 UDP 118 5000 → 5000 Lenh
 5802  31.641323 88.198.215.20 → 217.92.232.50 UDP 118 5000 → 5000 Lenh
 5803  31.641807 88.198.215.20 → 217.92.232.50 UDP 118 5000 → 5000 Lenh

Cheers,
        Thomas
