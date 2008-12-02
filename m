From: tony.chamberlain@lemko.com
Date: Tue, 02 Dec 2008 14:22:55 +0000
Subject: Re:  pptp failure
Message-Id: <W2745513197293671228227775@webmail20>
List-Id: <linux-ppp.vger.kernel.org>
References: <W68317226172691227707264@webmail41>
In-Reply-To: <W68317226172691227707264@webmail41>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

see below...
-----Original Message-----
From: James Cameron [mailto:james.cameron@hp.com]
Sent: Wednesday, November 26, 2008 04:06 PM
To: tony.chamberlain@lemko.com
Cc: 'ppp, Linux'
Subject: Re: pptp failure

On Wed, Nov 26, 2008 at 01:47:44PM +0000, tony.chamberlain@lemko.com wrote:
> Box B shows this from debug:
>   sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x354ce8ff> <pcomp> <accomp>]
>   rcvd [LCP ConfReq id=0x1 <auth chap MS-v2> <mru 1460> <magic 0x99302d60>]
>   (then some more sent and receiveds)

Looks normal.  Nothing unusual.  I presume Box B is working fine?  You
didn't explicitly say.

> Box A just show repeat:
>   sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xe58c245e> <pcomp> <accomp>]
>   sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xe58c245e> <pcomp> <accomp>]
>   Script pptp X.X.X.X --nolaunchpppd  finished (pid 18300), status = 0x0
>   Modem hangup
>   Connection terminated.
> (I Xed out the actual VPN IP address which is the same as Box B).
> 
> So for some reason, Box A is not getting a response back.

This shows pppd is not receiving any data from the peer.  Without data,
pppd will not succeed.

Diagnose this further by verifying the arrival of GRE packets, protocol
47, on the network interface that the TCP port 1723 connection should
have established on.  If no packets arrive, then the problem is outside
your host.

> I see it is a different magic number.  Could that have anything to do
> with it?

No.  The magic numbers are random.

> After
> a short time it gets a SIGUSR:
>    pptpconfig: pppd process terminated by signal 16 (failed)
>    pptpconfig: SIGUSR1

Should not be relevant.  pptpconfig is deprecated, and I'm the author.
It is a PHP-GTK wrapper around pppd.  pptpconfig has several problems
that I'm not fixing, but I don't recall if any of them might cause this
symptom.  I suggest you try to exclude pptpconfig from your test.

> Any idea what is happening?  I did recently install cisco vpn client
> on Box A, but pptp was working after to that.

I don't know what the effect of that software is.

Suggest you also reveal version of pppd and version of pptp.

Reply CC mailing list.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/

===================================Sorry for the awkward-lloking cut and paste.  Best I could do with wire
shark.  I captured just the port you mentioned (TCP/UDP 1723).  I thought
for privacy I should X out the actual VPN IP address so I replaced it
(this output only) with WWW.XX.YYY.ZZ.

By the way here are the versions of what you asked:

pppd version 2.4.3
pptp version 1.7.1
Linux 2.6.9-78.0.5.ELsmp #1 SMP Wed Oct 8 07:12:03 EDT 2008 i686 i686 i386 GNU/Linux

=== Wireshark output =
No.     Time        Source                Destination           Protocol Info
    138 24.241146   192.168.5.191         WWW.XX.YYY.ZZ         TCP      34165 > pptp [SYN] Seq=0 WinX40 Len=0 MSS60 TSVP0664196 TSER=0 WS=2

Frame 138 (76 bytes on wire, 76 bytes captured)
Linux cooked capture
Internet Protocol, Src: 192.168.5.191 (192.168.5.191), Dst: WWW.XX.YYY.ZZ (WWW.XX.YYY.ZZ)
Transmission Control Protocol, Src Port: 34165 (34165), Dst Port: pptp (1723), Seq: 0, Len: 0

No.     Time        Source                Destination           Protocol Info
    139 24.259152   WWW.XX.YYY.ZZ         192.168.5.191         TCP      pptp > 34165 [SYN, ACK] Seq=0 Ack=1 WinW92 Len=0 MSS60 TSV80627876 TSERP0664196 WS=5

Frame 139 (76 bytes on wire, 76 bytes captured)
Linux cooked capture
Internet Protocol, Src: WWW.XX.YYY.ZZ (WWW.XX.YYY.ZZ), Dst: 192.168.5.191 (192.168.5.191)
Transmission Control Protocol, Src Port: pptp (1723), Dst Port: 34165 (34165), Seq: 0, Ack: 1, Len: 0

No.     Time        Source                Destination           Protocol Info
    140 24.259222   192.168.5.191         WWW.XX.YYY.ZZ         TCP      34165 > pptp [ACK] Seq=1 Ack=1 WinX40 Len=0 TSVP0664214 TSER80627876

Frame 140 (68 bytes on wire, 68 bytes captured)
Linux cooked capture
Internet Protocol, Src: 192.168.5.191 (192.168.5.191), Dst: WWW.XX.YYY.ZZ (WWW.XX.YYY.ZZ)
Transmission Control Protocol, Src Port: 34165 (34165), Dst Port: pptp (1723), Seq: 1, Ack: 1, Len: 0

No.     Time        Source                Destination           Protocol Info
    141 24.259596   192.168.5.191         WWW.XX.YYY.ZZ         PPTP     Start-Control-Connection-Request

Frame 141 (224 bytes on wire, 224 bytes captured)
Linux cooked capture
Internet Protocol, Src: 192.168.5.191 (192.168.5.191), Dst: WWW.XX.YYY.ZZ (WWW.XX.YYY.ZZ)
Transmission Control Protocol, Src Port: 34165 (34165), Dst Port: pptp (1723), Seq: 1, Ack: 1, Len: 156
Point-to-Point Tunnelling Protocol


No.     Time        Source                Destination           Protocol Info
    142 24.280101   WWW.XX.YYY.ZZ         192.168.5.191         TCP      pptp > 34165 [ACK] Seq=1 Ack7 Winh80 Len=0 TSV80627878 TSERP0664214

Frame 142 (68 bytes on wire, 68 bytes captured)
Linux cooked capture
Internet Protocol, Src: WWW.XX.YYY.ZZ (WWW.XX.YYY.ZZ), Dst: 192.168.5.191 (192.168.5.191)
Transmission Control Protocol, Src Port: pptp (1723), Dst Port: 34165 (34165), Seq: 1, Ack: 157, Len: 0

No.     Time        Source                Destination           Protocol Info
    143 24.280488   WWW.XX.YYY.ZZ         192.168.5.191         PPTP     Start-Control-Connection-Reply

Frame 143 (224 bytes on wire, 224 bytes captured)
Linux cooked capture
Internet Protocol, Src: WWW.XX.YYY.ZZ (WWW.XX.YYY.ZZ), Dst: 192.168.5.191 (192.168.5.191)
Transmission Control Protocol, Src Port: pptp (1723), Dst Port: 34165 (34165), Seq: 1, Ack: 157, Len: 156
Point-to-Point Tunnelling Protocol

No.     Time        Source                Destination           Protocol Info
    144 24.280506   192.168.5.191         WWW.XX.YYY.ZZ         TCP      34165 > pptp [ACK] Seq7 Ack7 WinX40 Len=0 TSVP0664235 TSER80627878

Frame 144 (68 bytes on wire, 68 bytes captured)
Linux cooked capture
Internet Protocol, Src: 192.168.5.191 (192.168.5.191), Dst: WWW.XX.YYY.ZZ (WWW.XX.YYY.ZZ)
Transmission Control Protocol, Src Port: 34165 (34165), Dst Port: pptp (1723), Seq: 157, Ack: 157, Len: 0

No.     Time        Source                Destination           Protocol Info
    151 25.261703   192.168.5.191         WWW.XX.YYY.ZZ         PPTP     Outgoing-Call-Request

Frame 151 (236 bytes on wire, 236 bytes captured)
Linux cooked capture
Internet Protocol, Src: 192.168.5.191 (192.168.5.191), Dst: WWW.XX.YYY.ZZ (WWW.XX.YYY.ZZ)
Transmission Control Protocol, Src Port: 34165 (34165), Dst Port: pptp (1723), Seq: 157, Ack: 157, Len: 168
Point-to-Point Tunnelling Protocol

No.     Time        Source                Destination           Protocol Info
    152 25.285458   WWW.XX.YYY.ZZ         192.168.5.191         PPTP     Outgoing-Call-Reply

Frame 152 (100 bytes on wire, 100 bytes captured)
Linux cooked capture
Internet Protocol, Src: WWW.XX.YYY.ZZ (WWW.XX.YYY.ZZ), Dst: 192.168.5.191 (192.168.5.191)
Transmission Control Protocol, Src Port: pptp (1723), Dst Port: 34165 (34165), Seq: 157, Ack: 325, Len: 32
Point-to-Point Tunnelling Protocol

No.     Time        Source                Destination           Protocol Info
    153 25.285503   192.168.5.191         WWW.XX.YYY.ZZ         TCP      34165 > pptp [ACK] Seq25 Ack9 WinX40 Len=0 TSVP0665240 TSER80627978

Frame 153 (68 bytes on wire, 68 bytes captured)
Linux cooked capture
Internet Protocol, Src: 192.168.5.191 (192.168.5.191), Dst: WWW.XX.YYY.ZZ (WWW.XX.YYY.ZZ)
Transmission Control Protocol, Src Port: 34165 (34165), Dst Port: pptp (1723), Seq: 325, Ack: 189, Len: 0

No.     Time        Source                Destination           Protocol Info
    180 30.918488   WWW.XX.YYY.ZZ         192.168.5.191         TCP      pptp > 34165 [FIN, ACK] Seq9 Ack25 Winy36 Len=0 TSV80628542 TSERP0665240

Frame 180 (68 bytes on wire, 68 bytes captured)
Linux cooked capture
Internet Protocol, Src: WWW.XX.YYY.ZZ (WWW.XX.YYY.ZZ), Dst: 192.168.5.191 (192.168.5.191)
Transmission Control Protocol, Src Port: pptp (1723), Dst Port: 34165 (34165), Seq: 189, Ack: 325, Len: 0

No.     Time        Source                Destination           Protocol Info
    181 30.918669   192.168.5.191         WWW.XX.YYY.ZZ         PPTP     Call-Clear-Request

Frame 181 (84 bytes on wire, 84 bytes captured)
Linux cooked capture
Internet Protocol, Src: 192.168.5.191 (192.168.5.191), Dst: WWW.XX.YYY.ZZ (WWW.XX.YYY.ZZ)
Transmission Control Protocol, Src Port: 34165 (34165), Dst Port: pptp (1723), Seq: 325, Ack: 190, Len: 16
Point-to-Point Tunnelling Protocol


No.     Time        Source                Destination           Protocol Info
    182 30.918827   192.168.5.191         WWW.XX.YYY.ZZ         TCP      34165 > pptp [FIN, ACK] Seq41 Ack0 WinX40 Len=0 TSVP0670874 TSER80628542

Frame 182 (68 bytes on wire, 68 bytes captured)
Linux cooked capture
Internet Protocol, Src: 192.168.5.191 (192.168.5.191), Dst: WWW.XX.YYY.ZZ (WWW.XX.YYY.ZZ)
Transmission Control Protocol, Src Port: 34165 (34165), Dst Port: pptp (1723), Seq: 341, Ack: 190, Len: 0

No.     Time        Source                Destination           Protocol Info
    183 30.939478   WWW.XX.YYY.ZZ         192.168.5.191         TCP      pptp > 34165 [RST] Seq0 Win=0 Len=0

Frame 183 (62 bytes on wire, 62 bytes captured)
Linux cooked capture
Internet Protocol, Src: WWW.XX.YYY.ZZ (WWW.XX.YYY.ZZ), Dst: 192.168.5.191 (192.168.5.191)
Transmission Control Protocol, Src Port: pptp (1723), Dst Port: 34165 (34165), Seq: 190, Len: 0

No.     Time        Source                Destination           Protocol Info
    184 30.939693   WWW.XX.YYY.ZZ         192.168.5.191         TCP      pptp > 34165 [RST] Seq0 Win=0 Len=0

Frame 184 (62 bytes on wire, 62 bytes captured)
Linux cooked capture
Internet Protocol, Src: WWW.XX.YYY.ZZ (WWW.XX.YYY.ZZ), Dst: 192.168.5.191 (192.168.5.191)
Transmission Control Protocol, Src Port: pptp (1723), Dst Port: 34165 (34165), Seq: 190, Len: 0





