From: Christopher Fowler <cfowler@outpostsentinel.com>
Date: Tue, 08 Mar 2005 03:49:32 +0000
Subject: IPCP ConfRej's forever
Message-Id: <1110253772.18073.91.camel@linux.linxdev.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I have two hosts that are configured to dial each other on demand.  

One host is setup as 10.0.6.1:10.0.6.2 and the other as
192.168.5.6:192.168.5.7.  When the 10.0.6.1 sends the IPCP ConfReq
packet to request the remote accept the config of 10.0.6.1:10.0.6.2 it
is promptly rejected by the 192.168.5.6 machine.  This is totally
understandable since I did not provide the command line options
ipcp-allow-remote and ipcp-allow-local.  My problem is that when this
happens the ppp proces on 192.168.5.6 never terminates the connection. 
I get a stream of the folloing messages in syslog:

Mar  7 22:14:23 dialup pppd[130]: rcvd [IPCP ConfReq id=0x52 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:23 dialup pppd[130]: sent [IPCP ConfRej id=0x52 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:23 dialup pppd[130]: rcvd [IPCP ConfReq id=0x53 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:23 dialup pppd[130]: sent [IPCP ConfRej id=0x53 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:23 dialup pppd[130]: rcvd [IPCP ConfReq id=0x54 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:23 dialup pppd[130]: sent [IPCP ConfRej id=0x54 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:24 dialup pppd[130]: rcvd [IPCP ConfReq id=0x55 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:24 dialup pppd[130]: sent [IPCP ConfRej id=0x55 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:24 dialup pppd[130]: rcvd [IPCP ConfReq id=0x56 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:24 dialup pppd[130]: sent [IPCP ConfRej id=0x56 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:24 dialup pppd[130]: rcvd [IPCP ConfReq id=0x57 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:24 dialup pppd[130]: sent [IPCP ConfRej id=0x57 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:24 dialup pppd[130]: rcvd [IPCP ConfReq id=0x58 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:24 dialup pppd[130]: sent [IPCP ConfRej id=0x58 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:24 dialup pppd[130]: rcvd [IPCP ConfReq id=0x59 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:24 dialup pppd[130]: sent [IPCP ConfRej id=0x59 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:24 dialup pppd[130]: rcvd [IPCP ConfReq id=0x5a <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:24 dialup pppd[130]: sent [IPCP ConfRej id=0x5a <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:24 dialup pppd[130]: rcvd [IPCP ConfReq id=0x5b <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:24 dialup pppd[130]: sent [IPCP ConfRej id=0x5b <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:24 dialup pppd[130]: rcvd [IPCP ConfReq id=0x5c <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:24 dialup pppd[130]: sent [IPCP ConfRej id=0x5c <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:24 dialup pppd[130]: rcvd [IPCP ConfReq id=0x5d <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:24 dialup pppd[130]: sent [IPCP ConfRej id=0x5d <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:25 dialup pppd[130]: rcvd [IPCP ConfReq id=0x5e <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:25 dialup pppd[130]: sent [IPCP ConfRej id=0x5e <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:25 dialup pppd[130]: rcvd [IPCP ConfReq id=0x5f <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:25 dialup pppd[130]: sent [IPCP ConfRej id=0x5f <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:25 dialup pppd[130]: rcvd [IPCP ConfReq id=0x60 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:25 dialup pppd[130]: sent [IPCP ConfRej id=0x60 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:25 dialup pppd[130]: rcvd [IPCP ConfReq id=0x61 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:25 dialup pppd[130]: sent [IPCP ConfRej id=0x61 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:25 dialup pppd[130]: rcvd [IPCP ConfReq id=0x62 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:25 dialup pppd[130]: sent [IPCP ConfRej id=0x62 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:25 dialup pppd[130]: rcvd [IPCP ConfReq id=0x63 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:25 dialup pppd[130]: sent [IPCP ConfRej id=0x63 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:25 dialup pppd[130]: rcvd [IPCP ConfReq id=0x64 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:25 dialup pppd[130]: sent [IPCP ConfRej id=0x64 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:25 dialup pppd[130]: rcvd [IPCP ConfReq id=0x65 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:25 dialup pppd[130]: sent [IPCP ConfRej id=0x65 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:25 dialup pppd[130]: rcvd [IPCP ConfReq id=0x66 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:25 dialup pppd[130]: sent [IPCP ConfRej id=0x66 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:26 dialup pppd[130]: rcvd [IPCP ConfReq id=0x67 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:26 dialup pppd[130]: sent [IPCP ConfRej id=0x67 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:26 dialup pppd[130]: rcvd [IPCP ConfReq id=0x68 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:26 dialup pppd[130]: sent [IPCP ConfRej id=0x68 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:26 dialup pppd[130]: rcvd [IPCP ConfReq id=0x69 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:26 dialup pppd[130]: sent [IPCP ConfRej id=0x69 <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:26 dialup pppd[130]: rcvd [IPCP ConfReq id=0x6a <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:26 dialup pppd[130]: sent [IPCP ConfRej id=0x6a <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:26 dialup pppd[130]: rcvd [IPCP ConfReq id=0x6b <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:26 dialup pppd[130]: sent [IPCP ConfRej id=0x6b <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:26 dialup pppd[130]: rcvd [IPCP ConfReq id=0x6c <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:26 dialup pppd[130]: sent [IPCP ConfRej id=0x6c <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:26 dialup pppd[130]: sent [IPCP ConfReq id=0x10]
Mar  7 22:14:26 dialup pppd[130]: rcvd [IPCP ConfReq id=0x6d <addrs
10.0.6.1 10.0.6.2>]
Mar  7 22:14:26 dialup pppd[130]: sent [IPCP ConfRej id=0x6d <addrs
10.0.6.1 10.0.6.2>]


And it goes on forever and ever.  Should'nt there be a point where no
IPCP address could be negotiated and the remote terminate the
connection? 

Could this be version related?  The version that is on the remote is
2.4.1 and the version on local (10.0.6.1) is 2.4.2.  

Thanks,
Chris Fowler

