From: Guy Rouillier <guy-rouillier@speakeasy.net>
Date: Wed, 21 Jul 2004 05:29:35 +0000
Subject: compressor dropped pkt - scp upload stalls
Message-Id: <20040721012935.262926c4@emach>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I attempted to search for this issue on the archives and on the net, and
while I did get some hits, I have to humbly admit that I'm beyond my
level of competency.  I'm running Mandrake AMD64, and I've recompiled
the supplied kernel 2.6.3-9 with some small config changes needed to get
this working on my eMachines AMD64 laptop, plus some sha1 changes I
discussed on this list previously to make it 64-bit safe.  I'm running
ppp-2.4.2 and pptp 1.4.0 I obtained from the pptpclient site as source.

Briefly, the problem I'm experiencing is this.  I'm connecting to a
Microsoft VPN server at work using PPTP on PPP, which requires MPPE. 
When I try to use scp to upload a file to a work system, I see this in
/var/log/messages:

Jul 21 00:38:37 emach kernel: ppp: compressor dropped pkt
Jul 21 00:39:07 emach last message repeated 8 times

Then my upload stalls.  On the target system, I see  a directory entry
for the attempted upload, but the filesize is zero.

If I try to download a file from the same work system, I see hundreds of
the following messages:

Jul 21 00:42:24 emach pptp[2343]: anon log[decaps_gre:pptp_gre.c:388]:
buffering packet 289 (expecting 287, lost or reordered)
Jul 21 00:42:24 emach pptp[2343]: anon log[decaps_gre:pptp_gre.c:388]:
buffering packet 290 (expecting 287, lost or reordered)
Jul 21 00:42:24 emach pptp[2343]: anon log[decaps_gre:pptp_gre.c:388]:
buffering packet 291 (expecting 287, lost or reordered)

Amazingly, the resulting file is intact and good.  I can remote desktop
into a work system, but I see many of the above messages getting logged;
I guess the remote desktop protocol is more forgiving of these errors
than is scp.

What are my best hopes for getting a working connection?  I know how to
recompile the kernel, apply patches, etc, but debugging this code is
beyond me at this time.   Thanks for all advice.

-- 
Guy Rouillier
