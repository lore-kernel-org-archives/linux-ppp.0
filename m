From: Kanagesh <kanagesh@ncoretech.com>
Date: Wed, 20 Oct 2004 07:08:53 +0000
Subject: PPP fails due to IPCP NAK
Message-Id: <41760C35.2010804@ncoretech.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello,

I am using WvDial and PPP to dial out from an embedded board
through a modem.  On getting the 'Connect' string, PPP is started
and initial LCP goes through fine.  However, when it comes down
to negotiating an IP address, there seems to be a conflict and the
connection is terminated.  (The debug messages actually show that
at one point of time, PPP did receive an IPCP ACK).

The board runs on Linux kernel 2.4.18 (patched with arm patch rmk7).
PPP version - 2.4.1

I have also added here the debug prints that are shown in /var/log/messages
during this attempt. 

thanks in advance,
regards,
kanagesh

--> Looks like a password prompt.
--> Sending: (password)
~&}*Starting PPP Session from 219.65.151.169 to 
203.200.15.171}-}*1}=~~[7f]}#@!}!}!} }0}"}&} }*} } 
}%}&}(<[12]OC)~~&}*Starting PPP Session fr
om 219.65.151.169 to 203.200.15.171}-}*1}=~~[7f]}#@!}!}!} }0}"}&} }*} } 
}%}&}(<[12]OC)~
--> PPP negotiation detected.
--> Starting pppd at Wed Oct 20 21:48:06 2004
Oct 20 21:48:06  daemon.notice pppd[183]: pppd 2.4.1 started by root, uid 0
Oct 20 21:48:06  daemon.debug pppd[183]: using channel 6
Oct 20 21:48:06  daemon.info pppd[183]: Using interface ppp0
Oct 20 21:48:06  daemon.notice pppd[183]: Connect: ppp0 <--> /dev/ttyS0
Oct 20 21:48:06  daemon.debug pppd[183]: sent [LCP ConfReq id=0x1 
<asyncmap 0x0> <magic 0x4af3c007> <pcomp> <accomp>]
Oct 20 21:48:06  user.notice /sbin/hotplug: no runnable 
/etc/hotplug/net.agent is installed
Oct 20 21:48:06  daemon.debug pppd[183]: rcvd [LCP ConfRej id=0x1 
<pcomp> <accomp>]
Oct 20 21:48:06  daemon.debug pppd[183]: sent [LCP ConfReq id=0x2 
<asyncmap 0x0> <magic 0x4af3c007>]
Oct 20 21:48:06  daemon.debug pppd[183]: rcvd [LCP ConfAck id=0x2 
<asyncmap 0x0> <magic 0x4af3c007>]
Oct 20 21:48:09  daemon.debug pppd[183]: rcvd [LCP ConfReq id=0x2 
<asyncmap 0xa0000> <magic 0x8bc924f>]
Oct 20 21:48:09  daemon.debug pppd[183]: sent [LCP ConfAck id=0x2 
<asyncmap 0xa0000> <magic 0x8bc924f>]
Oct 20 21:48:09   daemon.debug pppd[183]: sent [IPCP ConfReq id=0x1 
<addr 192.168.2.10> <compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3
 0.0.0.0>]
Oct 20 21:48:09   daemon.debug pppd[183]: rcvd [IPCP ConfReq id=0x1 
<addr 203.200.15.171>]
Oct 20 21:48:09   daemon.debug pppd[183]: sent [IPCP ConfNak id=0x1 
<addr 192.168.2.11>]
Oct 20 21:48:09   daemon.debug pppd[183]: rcvd [IPCP ConfReq id=0x2 
<addr 203.200.15.171>]
Oct 20 21:48:09   daemon.debug pppd[183]: sent [IPCP ConfNak id=0x2 
<addr 192.168.2.11>]
Oct 20 21:48:09   daemon.debug pppd[183]: rcvd [IPCP ConfReq id=0x3 
<addr 203.200.15.171>]
Oct 20 21:48:09   daemon.debug pppd[183]: sent [IPCP ConfNak id=0x3 
<addr 192.168.2.11>]
Oct 20 21:48:09   daemon.debug pppd[183]: rcvd [IPCP ConfReq id=0x4 
<addr 203.200.15.171>]
Oct 20 21:48:09   daemon.debug pppd[183]: sent [IPCP ConfNak id=0x4 
<addr 192.168.2.11>]
Oct 20 21:48:09   daemon.debug pppd[183]: rcvd [IPCP ConfReq id=0x5 
<addr 203.200.15.171>]
Oct 20 21:48:09   daemon.debug pppd[183]: sent [IPCP ConfNak id=0x5 
<addr 192.168.2.11>]
Oct 20 21:48:09   daemon.debug pppd[183]: rcvd [IPCP ConfReq id=0x6 
<addr 203.200.15.171>]
Oct 20 21:48:09   daemon.debug pppd[183]: sent [IPCP ConfRej id=0x6 
<addr 203.200.15.171>]
Oct 20 21:48:10   daemon.debug pppd[183]: rcvd [IPCP ConfReq id=0x7]
Oct 20 21:48:10   daemon.debug pppd[183]: sent [IPCP ConfAck id=0x7]
Oct 20 21:48:12   daemon.debug pppd[183]: sent [IPCP ConfReq id=0x1 
<addr 192.168.2.10> <compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3
 0.0.0.0>]
Oct 20 21:48:12   daemon.debug pppd[183]: rcvd [IPCP ConfRej id=0x1 
<compress VJ 0f 01>]
Oct 20 21:48:12   daemon.debug pppd[183]: sent [IPCP ConfReq id=0x2 
<addr 192.168.2.10> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Oct 20 21:48:12   daemon.debug pppd[183]: rcvd [IPCP ConfNak id=0x2 
<addr 219.65.151.169> <ms-dns1 202.54.12.163> <ms-dns3 202.54.12.3
 >]
Oct 20 21:48:12   daemon.debug pppd[183]: sent [IPCP ConfReq id=0x3 
<addr 192.168.2.10> <ms-dns1 202.54.12.163> <ms-dns3 202.54.12.3>]
Oct 20 21:48:12   daemon.debug pppd[183]: rcvd [IPCP ConfNak id=0x3 
<addr 219.65.151.169>]
Oct 20 21:48:12   daemon.debug pppd[183]: sent [IPCP ConfReq id=0x4 
<addr 192.168.2.10> <ms-dns1 202.54.12.163> <ms-dns3 202.54.12.3>]
Oct 20 21:48:12   daemon.debug pppd[183]: rcvd [IPCP ConfNak id=0x4 
<addr 219.65.151.169>]
Oct 20 21:48:12   daemon.debug pppd[183]: sent [IPCP ConfReq id=0x5 
<addr 192.168.2.10> <ms-dns1 202.54.12.163> <ms-dns3 202.54.12.3>]
Oct 20 21:48:12   daemon.debug pppd[183]: rcvd [IPCP ConfNak id=0x5 
<addr 219.65.151.169>]
Oct 20 21:48:12   daemon.debug pppd[183]: sent [IPCP ConfReq id=0x6 
<addr 192.168.2.10> <ms-dns1 202.54.12.163> <ms-dns3 202.54.12.3>]
Oct 20 21:48:12   daemon.debug pppd[183]: rcvd [IPCP ConfNak id=0x6 
<addr 219.65.151.169>]
Oct 20 21:48:12   daemon.debug pppd[183]: sent [IPCP ConfReq id=0x7 
<addr 192.168.2.10> <ms-dns1 202.54.12.163> <ms-dns3 202.54.12.3>]
Oct 20 21:48:12   daemon.debug pppd[183]: rcvd [IPCP ConfReq id=0x8]
Oct 20 21:48:12   daemon.debug pppd[183]: sent [IPCP ConfNak id=0x8 
<addr 192.168.2.11>]
Oct 20 21:48:13   daemon.debug pppd[183]: rcvd [IPCP ConfNak id=0x7 
<addr 219.65.151.169>]
Oct 20 21:48:13   daemon.debug pppd[183]: sent [IPCP ConfReq id=0x8 
<addr 192.168.2.10> <ms-dns1 202.54.12.163> <ms-dns3 202.54.12.3>]
Oct 20 21:48:13   daemon.debug pppd[183]: rcvd [IPCP ConfReq id=0x9]
Oct 20 21:48:13   daemon.debug pppd[183]: sent [IPCP ConfAck id=0x9]
Oct 20 21:48:13   daemon.debug pppd[183]: rcvd [IPCP ConfNak id=0x8 
<addr 219.65.151.169>]
Oct 20 21:48:13   daemon.debug pppd[183]: sent [IPCP ConfReq id=0x9 
<addr 192.168.2.10> <ms-dns1 202.54.12.163> <ms-dns3 202.54.12.3>]
Oct 20 21:48:13   daemon.debug pppd[183]: rcvd [IPCP ConfNak id=0x9 
<addr 219.65.151.169>]
Oct 20 21:48:13   daemon.debug pppd[183]: sent [IPCP ConfReq id=0xa 
<addr 192.168.2.10> <ms-dns1 202.54.12.163> <ms-dns3 202.54.12.3>]
Oct 20 21:48:13   daemon.debug pppd[183]: rcvd [IPCP ConfNak id=0xa 
<addr 219.65.151.169>]
Oct 20 21:48:13   daemon.debug pppd[183]: sent [IPCP ConfReq id=0xb 
<addr 192.168.2.10> <ms-dns1 202.54.12.163> <ms-dns3 202.54.12.3>]
Oct 20 21:48:13   daemon.debug pppd[183]: rcvd [IPCP ConfNak id=0xb 
<addr 219.65.151.169>]
Oct 20 21:48:13   daemon.debug pppd[183]: sent [IPCP ConfReq id=0xc 
<addr 192.168.2.10> <ms-dns1 202.54.12.163> <ms-dns3 202.54.12.3>]
Oct 20 21:48:13   daemon.debug pppd[183]: rcvd [LCP TermReq id=0x3]
Oct 20 21:48:13   daemon.info pppd[183]: LCP terminated by peer
Oct 20 21:48:13   daemon.debug pppd[183]: sent [LCP TermAck id=0x3]
Oct 20 21:48:13   daemon.debug pppd[183]: rcvd [IPCP ConfNak id=0xc 
<addr 219.65.151.169>]
Oct 20 21:48:13   daemon.debug pppd[183]: rcvd [IPCP TermReq id=0xa]
--> PPP daemon has died! (exit code = 10)
--> Disconnecting at Wed Oct 20 21:48:16 2004
--> Auto Reconnect will be attempted in 160 seconds
--> pppd error!  Look at files in /var/log for an explanation.
