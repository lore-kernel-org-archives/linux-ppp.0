From: "Desai, Jason" <jase@sensis.com>
Date: Thu, 29 Jan 2004 01:27:46 +0000
Subject: MPPE required but peer negotiation failed
Message-Id: <ADF6087CA978A4418AF7F76DDCF2F72102757859@europa.ats.sensis.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello.

I am running a pptp server (using poptop) on linux and for various reasons,
I have had to upgrade from ppp 2.4.1 on linux 2.2.17 to ppp 2.4.2 on linux
2.4.24 (both patched with mppe support).  The ppp 2.4.2 is actually Debian's
ppp 2.4.2+20031127-2.  I found http://pptpclient.sourceforge.net/ and it has
helped me get things set up with this upgrade.  

I have a PocketPC client that is trying to connect.  It used to be able to
connect to ppp 2.4.1.  Here are the relevant logs - I know these are two
different hosts - but it is the same client trying to connect to each.

ppp 2.4.2:
Jan 28 10:26:16 bob pppd[19285]: sent [CCP ConfReq id=0x1 <mppe +H -M +S -L
-D -C>]
Jan 28 10:26:16 bob pppd[19285]: rcvd [CCP ConfReq id=0x0 <mppe -H -M -S -L
-D +C>]
Jan 28 10:26:16 bob pppd[19285]: MPPE required but peer negotiation failed
Jan 28 10:26:16 bob pppd[19285]: sent [LCP TermReq id=0x2 "MPPE required but
peer negotiation failed"]
Jan 28 10:26:16 bob pppd[19285]: sent [CCP ConfRej id=0x0 <mppe -H -M -S -L
-D +C>]
Jan 28 10:26:16 bob pppd[19285]: rcvd [CCP ConfNak id=0x1 <mppe -H -M +S -L
-D -C>]
Jan 28 10:26:16 bob pppd[19285]: rcvd [LCP TermAck id=0x2]
Jan 28 10:26:16 bob pppd[19285]: Connection terminated.

ppp 2.4.1:
Jan 19 11:09:51 vortex pppd[19256]: sent [CCP ConfReq id=0x1 <deflate 15>
<deflate(old#) 15> <mppe 1 0 0 40> <bsd v1 15>]
Jan 19 11:09:51 vortex pppd[19256]: rcvd [CCP ConfReq id=0x0 <mppe 0 0 0 1>]
Jan 19 11:09:51 vortex pppd[19256]: sent [CCP ConfNak id=0x0 <mppe 0 0 0
40>]
Jan 19 11:09:51 vortex pppd[19256]: rcvd [CCP ConfRej id=0x1 <deflate 15>
<deflate(old#) 15> <bsd v1 15>]
Jan 19 11:09:51 vortex pppd[19256]: sent [CCP ConfReq id=0x2 <mppe 1 0 0
40>]
Jan 19 11:09:51 vortex pppd[19256]: rcvd [CCP ConfReq id=0x1 <mppe 0 0 0
40>]
Jan 19 11:09:51 vortex pppd[19256]: sent [CCP ConfAck id=0x1 <mppe 0 0 0
40>]
Jan 19 11:09:51 vortex pppd[19256]: rcvd [CCP ConfNak id=0x2 <mppe 0 0 0
40>]
Jan 19 11:09:51 vortex pppd[19256]: sent [CCP ConfReq id=0x3 <mppe 0 0 0
40>]
Jan 19 11:09:51 vortex pppd[19256]: rcvd [CCP ConfAck id=0x3 <mppe 0 0 0
40>]

Thanks to this page -
http://pptpclient.sourceforge.net/howto-diagnosis.phtml#mppe_bits -
explaining the bitmasks, it looks like in both cases, the client initially
sends a CCP packet requesting to only do compression.  But with ppp 2.4.2,
the server responds with a ConfRej, and with ppp 2.4.1, it responds with
ConfNak.  With ppp 2.4.1, the peers were able to successfully negotiate to
use MPPE 128-bit compression.  In both instances, ppp was configured to
require MPPE 128-bit compression.  

I'm not sure if it the client or the server which is "broken".  Is there
some configuration option or patch that will make ppp behave as it did in
2.4.1?  Any help would be appreciated.  TIA!

Jason Desai
Network Administrator
Sensis Corporation
jase@sensis.com
http://www.sensis.com
(315) 445-5811
