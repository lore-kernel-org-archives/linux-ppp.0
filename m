From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 07 Mar 2006 22:11:36 +0000
Subject: Re: LCP terminated by peer (Normal Termination by NCP) - Please help
Message-Id: <17422.1304.257789.219098@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <BAD05164DBF6BF44AD171A36DBC6E77505DACADD@pusehe0w.eh.pweh.com>
In-Reply-To: <BAD05164DBF6BF44AD171A36DBC6E77505DACADD@pusehe0w.eh.pweh.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Desai, Ankit (Export) writes:
> rcvd [LCP ConfReq id=0x2 <mru 1600> <auth pap> <magic 0xd8397cb7> <asyncmap
> 0x0> <pcomp> <accomp>]
> 
> sent [LCP ConfReq id=0x1 <magic 0x58526cf7> <pcomp> <accomp>]
> 
> sent [LCP ConfRej id=0x2 <mru 1600> <asyncmap 0x0>]

This is curious.  It means that you've explicitly configured pppd to
reject those options.  Why?  What's in your configuration?

> sent [IPCP ConfReq id=0x1 <addr 0.0.0.0> <compress VJ 0f 01> <ms-dns1
> 0.0.0.0> <ms-dns3 0.0.0.0>]
> 
> sent [CCP ConfReq id=0x1 <deflate 15> <deflate(old#) 15>]
> 
> rcvd [LCP ProtRej id=0x0 80 fd 01 01 00 0c 1a 04 78 00 18 04 78 00 35]
> 
> rcvd [LCP TermReq id=0x0 "Normal Termination by NCP"]

Obviously, the peer is well within its rights to terminate the
connection for any reason or no reason at all.  You need to check the
logs on the peer's side to find out why it sent that message.  The
text message the peer chose to include isn't very illuminating.

One thing to try might be turning off CCP ("noccp").  Perhaps that
just confuses the peer.  (There's no reason that the perfectly normal
LCP Protocol-Reject shouldn't handle the problem as expected, but
perhaps the peer has bugs.)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
