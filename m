From: AkashB <akash.bhatnagar@vnl.in>
Date: Wed, 02 Jun 2010 10:58:53 +0000
Subject: How to increase TCP windows Size in PPP connection
Message-Id: <28752848.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Hi,

I have created a MLPPP connection using pppd(s).My PPP config file is as
follow:-
    
    defaultroute
    asyncmap 0
    sync
    lcp-echo-interval 1
    lcp-echo-failure 11

    nobsdcomp
    nodeflate
    nopcomp
    novj
    novjccomp
    noaccomp -am

    multilink
    passive
    ipcp-max-configure 7
    nodetach
    debug
    kdebug 31

Interface:
ppp0    Link encap:Point-to-Point Protocol
          inet addr:192.168.0.22  P-t-P:192.168.0.21  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:300  Metric:1
          RX packets:813 errors:0 dropped:0 overruns:0 frame:0
          TX packets:618 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:39480 (38.5 KiB)  TX bytes:25564 (24.9 KiB)

Now after connecting a TCP socket from peer entity, I am getting certain
Window Overflow errors which means that request is greater than receiver's
advertise windows size.The peer is not in Linux. On running wireshark I have
found these windows size
PPPd= 1040 ;Peer00

For ethernet the connection made successfully.
Ethernete00 ; Peer00

Is there anyway, to increase windows size in case of PPP connections??

Thanks
 
-- 
View this message in context: http://old.nabble.com/How-to-increase-TCP-windows-Size-in-PPP-connection-tp28752848p28752848.html
Sent from the linux-ppp mailing list archive at Nabble.com.

