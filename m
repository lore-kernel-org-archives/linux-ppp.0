From: Pieter Loubser <ploubser@sanpeople.com>
Date: Wed, 03 May 2006 09:46:05 +0000
Subject: VJCOMP Issue with Siemens MC75
Message-Id: <1146649565.11976.253.camel@io.sanpeople.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Hi,


I have a problem when using the GSM/GPRS/EDGE Siemens MC75 module
with PPP (version 2.4.2).


LCP comes up fine and authentication succeed, but while negotiating
IPCP, the VJ compression keeps failing.


<snip>

sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 0.0.0.0>
     <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
rcvd [IPCP ConfRej id=0x1 <compress VJ 0f 01> <compress VJ 0f 01>]
Received bad configure-nak/rej:  02 06 00 2d 0f 01 02 06 00 2d 0f 01

rcvd [IPCP ConfReq id=0x1 <addr 10.0.0.1>]
sent [IPCP ConfAck id=0x1 <addr 10.0.0.1>]
sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 0.0.0.0>
     <ms-dns10.0.0.0> <ms-dns3 0.0.0.0>]
rcvd [IPCP ConfRej id=0x1 <compress VJ 0f 01> <compress VJ 0f 01>]
Received bad configure-nak/rej:  02 06 00 2d 0f 01 02 06 00 2d 0f 01

sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 0.0.0.0>
     <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
rcvd [IPCP ConfRej id=0x1 <compress VJ 0f 01> <compress VJ 0f 01>]
Received bad configure-nak/rej:  02 06 00 2d 0f 01 02 06 00 2d 0f 01

<snip>


It never gets past this.



I think its because when the Siemens replies with the confrej, it
rejects the vjcomp twice in the same message.


It does work if I disable the VJ comp in PPP with "novj" and
"novjccomp". But I would like not to, for vjcomp is supported  on some
other GPRS/EDGE modules and this is a generic setup. Anyway it should
just reject it correctly and continue. The Siemens MC55 module (the
MC75's predecessor) works fine, and rejects vjcomp properly.



Any thoughts?




Thank you,

Pieter



