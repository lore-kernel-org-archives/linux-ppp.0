From: Phil Mayers <p.mayers@imperial.ac.uk>
Date: Tue, 07 Feb 2006 19:55:13 +0000
Subject: mppe_decompress pessimism / CCP collapse
Message-Id: <43E8FB21.90505@imperial.ac.uk>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

All,

I'm surprised not to find another report on this. I'm using ppp as part
of a PPTP (Poptop) VPN. We're seeing problems with various crappy
clients getting their realworld MTU, MRU and tunnel MTU wrong.

Whilst investigating this, I found that ANY use of the "mru" option on
an MPPE connection creates a "hole" at the top of the IP MTU which if
any packets are sent with, locks the connection up.

This works:

lock
#uncomment when testing:
debug
# /testing
name pptpd
asyncmap 0
-chap
-mschap
+mschap-v2
require-mppe
lcp-echo-failure 30
lcp-echo-interval 5
ipcp-accept-local
ipcp-accept-remote

using channel 19
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <auth chap MS-v2> <magic
0x4a337f21> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x0 <mru 1400> <magic 0x13cc7131> <pcomp> <accomp>
<callback CBCP>]
sent [LCP ConfRej id=0x0 <callback CBCP>]
rcvd [LCP ConfReq id=0x1 <mru 1400> <magic 0x13cc7131> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <mru 1400> <magic 0x13cc7131> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <auth chap MS-v2> <magic
0x4a337f21> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <auth chap MS-v2> <magic
0x4a337f21> <pcomp> <accomp>]
sent [LCP EchoReq id=0x0 magic=0x4a337f21]
sent [CHAP Challenge id=0xf5 <CHAL>, name = "pptpd"]
rcvd [LCP code=0xc id=0x2 13 cc 71 31 4d 53 52 41 53 56 35 2e 31 30]
sent [LCP CodeRej id=0x2 0c 02 00 12 13 cc 71 31 4d 53 52 41 53 56 35 2e
31 30]
rcvd [LCP code=0xc id=0x3 13 cc 71 31 4d 53 52 41 53 2d 30 2d 58 50 2d
53 50 32 2d 56 4d 57 41 52 45]
sent [LCP CodeRej id=0x3 0c 03 00 1d 13 cc 71 31 4d 53 52 41 53 2d 30 2d
58 50 2d 53 50 32 2d 56 4d 57 41 52 45]
rcvd [LCP EchoRep id=0x0 magic=0x13cc7131]
rcvd [CHAP Response id=0xf5 <RESP>, name = "user"]
sent [CHAP Success id=0xf5 "S=BYTES"]
sent [CCP ConfReq id=0x1 <mppe +H -M +S +L -D -C>]
rcvd [CCP ConfReq id=0x4 <mppe +H +M +S +L -D +C>]
sent [CCP ConfNak id=0x4 <mppe +H -M +S -L -D -C>]
rcvd [IPCP ConfReq id=0x5 <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-wins
0.0.0.0> <ms-dns3 0.0.0.0> <ms-wins 0.0.0.0>]
sent [IPCP TermAck id=0x5]
rcvd [CCP ConfNak id=0x1 <mppe +H -M +S -L -D -C>]
sent [CCP ConfReq id=0x2 <mppe +H -M +S -L -D -C>]
rcvd [CCP ConfReq id=0x6 <mppe +H -M +S -L -D -C>]
sent [CCP ConfAck id=0x6 <mppe +H -M +S -L -D -C>]
rcvd [CCP ConfAck id=0x2 <mppe +H -M +S -L -D -C>]
sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr ADDR>]
rcvd [IPCP ConfRej id=0x1 <compress VJ 0f 01>]
sent [IPCP ConfReq id=0x2 <addr ADDR>]
rcvd [IPCP ConfAck id=0x2 <addr ADDR>]
rcvd [IPCP ConfReq id=0x7 <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-wins
0.0.0.0> <ms-dns3 0.0.0.0> <ms-wins 0.0.0.0>]
sent [IPCP ConfNak id=0x7 <addr ADDR> <ms-dns1 DNS1> <ms-wins WINS1>
<ms-dns3 DNS2> <ms-wins WINS2>]
rcvd [IPCP ConfReq id=0x8 <addr ADDR> <ms-dns1 DNS1> <ms-wins WINS1>
<ms-dns3 DNS2> <ms-wins WINS2>]
sent [IPCP ConfAck id=0x8 <addr ADDR> <ms-dns1 DNS1> <ms-wins WINS1>
<ms-dns3 DNS2> <ms-wins WINS2>]
Script /etc/ppp/ip-up started (pid 30930)
Script /etc/ppp/ip-up finished (pid 30930), status = 0x0

I can then send packets with 1400 byte payloads and everything works,
even though pppd has set the MTU to 1396

rcvd [LCP TermReq id=0x9 13 cc 71 31 00 3c cd 74 00 00 00 00]
Script /etc/ppp/ip-down started (pid 30938)
sent [LCP TermAck id=0x9]
Script /etc/ppp/ip-down finished (pid 30938), status = 0x0


However, if I add:

mru 1400

...to the options.pptpd (doesn't matter what value I use, it happens
with all of them), I get:

using channel 20
sent [LCP ConfReq id=0x1 <mru 1400> <asyncmap 0x0> <auth chap MS-v2>
<magic 0xb85c8941> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x0 <mru 1400> <magic 0x6cbd0cba> <pcomp> <accomp>
<callback CBCP>]
sent [LCP ConfRej id=0x0 <callback CBCP>]
rcvd [LCP ConfAck id=0x1 <mru 1400> <asyncmap 0x0> <auth chap MS-v2>
<magic 0xb85c8941> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <mru 1400> <magic 0x6cbd0cba> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <mru 1400> <magic 0x6cbd0cba> <pcomp> <accomp>]
sent [LCP EchoReq id=0x0 magic=0xb85c8941]
sent [CHAP Challenge id=0xd1 <CHAL>, name = "pptpd"]
rcvd [LCP code=0xc id=0x2 6c bd 0c ba 4d 53 52 41 53 56 35 2e 31 30]
sent [LCP CodeRej id=0x2 0c 02 00 12 6c bd 0c ba 4d 53 52 41 53 56 35 2e
31 30]
rcvd [LCP code=0xc id=0x3 6c bd 0c ba 4d 53 52 41 53 2d 30 2d 58 50 2d
53 50 32 2d 56 4d 57 41 52 45]
sent [LCP CodeRej id=0x3 0c 03 00 1d 6c bd 0c ba 4d 53 52 41 53 2d 30 2d
58 50 2d 53 50 32 2d 56 4d 57 41 52 45]
rcvd [LCP EchoRep id=0x0 magic=0x6cbd0cba]
rcvd [CHAP Response id=0xd1 <RESP>, name = "user"]
sent [CHAP Success id=0xd1 "S=BYTES"]
sent [CCP ConfReq id=0x1 <mppe +H -M +S +L -D -C>]
rcvd [CCP ConfReq id=0x4 <mppe +H +M +S +L -D +C>]
sent [CCP ConfNak id=0x4 <mppe +H -M +S -L -D -C>]
rcvd [IPCP ConfReq id=0x5 <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-wins
0.0.0.0> <ms-dns3 0.0.0.0> <ms-wins 0.0.0.0>]
sent [IPCP TermAck id=0x5]
rcvd [CCP ConfNak id=0x1 <mppe +H -M +S -L -D -C>]
sent [CCP ConfReq id=0x2 <mppe +H -M +S -L -D -C>]
rcvd [CCP ConfReq id=0x6 <mppe +H -M +S -L -D -C>]
sent [CCP ConfAck id=0x6 <mppe +H -M +S -L -D -C>]
rcvd [CCP ConfAck id=0x2 <mppe +H -M +S -L -D -C>]
sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr ADDR>]
rcvd [IPCP ConfRej id=0x1 <compress VJ 0f 01>]
sent [IPCP ConfReq id=0x2 <addr ADDR>]
rcvd [IPCP ConfAck id=0x2 <addr ADDR>]
rcvd [IPCP ConfReq id=0x7 <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-wins
0.0.0.0> <ms-dns3 0.0.0.0> <ms-wins 0.0.0.0>]
sent [IPCP ConfNak id=0x7 <addr ADDR> <ms-dns1 DNS1> <ms-wins WINS1>
<ms-dns3 DNS2> <ms-wins WINS2>]
rcvd [IPCP ConfReq id=0x8 <addr ADDR> <ms-dns1 DNS1> <ms-wins WINS2>
<ms-dns3 DNS2> <ms-wins WINS2>]
sent [IPCP ConfAck id=0x8 <addr ADDR> <ms-dns1 DNS1> <ms-wins WINS1>
<ms-dns3 DNS2> <ms-wins WINS2>]
Script /etc/ppp/ip-up started (pid 31165)
Script /etc/ppp/ip-up finished (pid 31165), status = 0x0

Then, when I send a packet of 1400 bytes I get this:

rcvd [Compressed data] 90 13 53 11 6b f8 d5 3d ...
sent [CCP ResetReq id=0x3]
decompress[0]: osize too small! (have: 1404 need: 1405)

...and the connection collapses:

rcvd [Compressed data] 90 14 f6 94 c2 07 e5 db ...
sent [CCP ResetReq id=0x3]
rcvd [Compressed data] 90 15 7c 2d 5d 98 46 23 ...
sent [CCP ResetReq id=0x3]
rcvd [Compressed data] 90 16 67 90 1a 78 d7 1a ...
rcvd [Compressed data] 90 17 65 60 78 20 2c c3 ...
sent [CCP ResetReq id=0x3]
rcvd [LCP TermReq id=0x9
"l\37777777675\014\37777777672\000<\37777777715t\000\000\000\000"]
Script /etc/ppp/ip-down started (pid 31178)
sent [LCP TermAck id=0x9]
Script /etc/ppp/ip-down finished (pid 31178), status = 0x0

I think the problem may be pessimistic code in ppp_mppe.c or I guess
possibly a bug in windows' PPP stack.

Specifically, ppp_generic.c has ppp_decompress_frame, which does:

len = ppp->rcomp->decompress(OTHERARGS, ppp->mru + PPP_HDRLEN);

...and ppp_mppe.c has:

/*
  * Make sure we have enough room to decrypt the packet.
  * Note that for our test we only subtract 1 byte whereas in
  * mppe_compress() we added 2 bytes (+MPPE_OVHD);
  * this is to account for possible PFC.
  */
if (osize < isize - MPPE_OVHD - 1) {
	printk(KERN_DEBUG "mppe_decompress[%d]: osize too small! "
	       "(have: %d need: %d)\n", state->unit,
	       osize, isize - MPPE_OVHD - 1);
	return DECOMP_ERROR;
}
osize = isize - MPPE_OVHD - 2;	/* assume no PFC */

I think this "-1" is wrong. Surely it should be a -2, then further down
when it says:

	/*
	 * Do PFC decompression.
	 * This would be nicer if we were given the actual sk_buff
	 * instead of a char *.
	 */
	if ((obuf[0] & 0x01) != 0) {
		obuf[1] = obuf[0];
		obuf[0] = 0;
		obuf++;
		osize++;
	}

...only THEN once you KNOW you've got a compressed packet add the extra
byte and raise an error if you don't have enough space.

Would this be correct and feasible? If so I'll have a go at a patch, but
it's possible my limited understanding of PPP or MPPE means this would
not help. I don't really understand the user-space code, but as far as I
can tell, it pushes the MRU into the kernel via the ioctl() and that
number ends up as the osize parameter.

So, if you *don't* specify mru, the user-space code pushes DEFMRU, 1500
in and everything is fine. But if you *do* want to decrease the MRU, the
value you specify gets pushed into the kernel *and* sent via LCP, and
the far end obeys it.

Hope I'm being clear - let me know if not.
