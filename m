From: Guy Rouillier <guy-rouillier@speakeasy.net>
Date: Thu, 22 Jul 2004 05:07:11 +0000
Subject: Re: compressor dropped pkt - scp upload stalls
Message-Id: <20040722010711.64f89fdc@emach>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040721012935.262926c4@emach>
In-Reply-To: <20040721012935.262926c4@emach>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

A little more information that I hope is useful.  On the same hardware
in a different partition, I installed 32-bit Mandrake 9.2.  I still get
the "packets out of order" messages with remote desktop, but now I can
successfully upload files.  Differences between 32-bit 9.2 and 64-bit
10.0:

(1) 32-bit vs. 64-bit
(2) kernel 2.4.22-10 vs. 2.6.3-9
(3) ppp 2.4.1 vs 2.4.2
(4) pptp 1.3.1 vs 1.4.0

Let me know if I can provide any additional info.  Would perhaps trying
the new ppp-2.4.3 and pptp 1.5.0 change anything?


On Wed, 21 Jul 2004 01:29:35 -0400
Guy Rouillier <guy-rouillier@speakeasy.net> wrote:

> I attempted to search for this issue on the archives and on the net,
> and while I did get some hits, I have to humbly admit that I'm beyond
> my level of competency.  I'm running Mandrake AMD64, and I've
> recompiled the supplied kernel 2.6.3-9 with some small config changes
> needed to get this working on my eMachines AMD64 laptop, plus some
> sha1 changes I discussed on this list previously to make it 64-bit
> safe.  I'm running ppp-2.4.2 and pptp 1.4.0 I obtained from the
> pptpclient site as source.
> 
> Briefly, the problem I'm experiencing is this.  I'm connecting to a
> Microsoft VPN server at work using PPTP on PPP, which requires MPPE. 
> When I try to use scp to upload a file to a work system, I see this in
> /var/log/messages:
> 
> Jul 21 00:38:37 emach kernel: ppp: compressor dropped pkt
> Jul 21 00:39:07 emach last message repeated 8 times
> 
> Then my upload stalls.  On the target system, I see  a directory entry
> for the attempted upload, but the filesize is zero.
> 
> If I try to download a file from the same work system, I see hundreds
> of the following messages:
> 
> Jul 21 00:42:24 emach pptp[2343]: anon log[decaps_gre:pptp_gre.c:388]:
> buffering packet 289 (expecting 287, lost or reordered)
> Jul 21 00:42:24 emach pptp[2343]: anon log[decaps_gre:pptp_gre.c:388]:
> buffering packet 290 (expecting 287, lost or reordered)
> Jul 21 00:42:24 emach pptp[2343]: anon log[decaps_gre:pptp_gre.c:388]:
> buffering packet 291 (expecting 287, lost or reordered)
> 
> Amazingly, the resulting file is intact and good.  I can remote
> desktop into a work system, but I see many of the above messages
> getting logged; I guess the remote desktop protocol is more forgiving
> of these errors than is scp.
> 
> What are my best hopes for getting a working connection?  I know how
> to recompile the kernel, apply patches, etc, but debugging this code
> is beyond me at this time.   Thanks for all advice.
> 
> -- 
> Guy Rouillier
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
Guy Rouillier
