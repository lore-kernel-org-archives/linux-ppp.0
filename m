From: "Ionut Turturica" <ionut.turturica@galati.uti.ro>
Date: Sun, 29 Jan 2006 16:16:47 +0000
Subject: IPCP problem
Message-Id: <op.s35d59crblqxiz@jono>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Hi,

It looks like the pptpd server requests first time mppe-stateful, then it  
changes its mind and wants mppe-stateless. Is there any way to fix this?
(I don't have access to pptpd's config)

[cut]
CHAP authentication succeeded
kernel does not support PPP filtering
sent [CCP ConfReq id=0x1 <mppe +H -M +S -L -D -C>]
rcvd [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 10.19.0.109>]
sent [IPCP TermAck id=0x1]
rcvd [CCP ConfReq id=0x1]
sent [CCP ConfAck id=0x1]
rcvd [CCP ConfNak id=0x1 <mppe -H -M +S -L -D -C>]
sent [CCP ConfReq id=0x2 <mppe -H -M +S -L -D -C>]
rcvd [CCP ConfAck id=0x2 <mppe -H -M +S -L -D -C>]
MPPE 128-bit stateful receive compression enabled
sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 0.0.0.0>]
rcvd [IPCP ConfNak id=0x1 <addr 10.20.17.120>]
sent [IPCP ConfReq id=0x2 <compress VJ 0f 01> <addr 10.20.17.120>]
rcvd [IPCP ConfAck id=0x2 <compress VJ 0f 01> <addr 10.20.17.120>]
rcvd [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 10.19.0.109>]
sent [IPCP ConfAck id=0x1 <compress VJ 0f 01> <addr 10.19.0.109>]
local  IP address 10.20.17.120
remote IP address 10.19.0.109
Script /etc/ppp/ip-up started (pid 21358)
rcvd [CCP ConfReq id=0x1]
MPPE disabled
Connect time 0.1 minutes.
Sent 0 bytes, received 4 bytes.
sent [LCP TermReq id=0x2 "MPPE disabled"]
sent [CCP ConfReq id=0x3 <mppe +H -M +S -L -D -C>]
sent [CCP ConfAck id=0x1]
Script /etc/ppp/ip-up finished (pid 21358), status = 0x0
Script /etc/ppp/ip-down started (pid 21363)
Script /etc/ppp/ip-down finished (pid 21363), status = 0x0
rcvd [LCP TermAck id=0x2]
Connection terminated.
