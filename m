From: James Carlson <carlson@workingcode.com>
Date: Sat, 21 Feb 2004 19:41:12 +0000
Subject: Re: Problems with ppp
Message-Id: <16439.46168.718842.845531@c-24-147-210-59.ne.client2.attbi.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <BAY15-F30oYAPNXRPmc0000689e@hotmail.com>
In-Reply-To: <BAY15-F30oYAPNXRPmc0000689e@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Juan Pablo Romero writes:
> Feb 21 12:33:58 localhost pppd[2995]: sent [LCP ConfReq id=0x1 <asyncmap 
> 0x0> <magic 0x90c4467f> <pcomp> <accomp>]
> Feb 21 12:33:58 localhost pppd[2995]: rcvd [LCP ConfAck id=0x1 <asyncmap 
> 0x0> <magic 0x90c4467f> <pcomp> <accomp>]
> Feb 21 12:34:00 localhost pppd[2995]: rcvd [LCP ConfReq id=0x44 <asyncmap 
> 0xa0000> <auth pap> <magic 0x409e2ccc> <pcomp> <accomp>]

The peer is asking for asyncmap 0xa0000.  Since many systems that do
that tend to have bugs in ACCM handling, and these bugs could lead to
connection drops, I recommend adding "asyncmap a0000" to your pppd
configuration.

> Feb 21 12:34:03 localhost pppd[2995]: sent [IPCP ConfReq id=0x1 <addr 
> 0.0.0.0> <compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]

The peer is behaving as though it can't hear you once LCP is done
negotiating.  That's a common symptom when there's an ACCM problem.

> It seems as if my ISP didn't understand the compress/deflate command.

No ... I don't think it can hear you past the LCP exchange at all.  I
see no evidence there that it was doing anything other than blindly
sending you packets.  This means there's a low-level communications
problem.  Such problems can result from ACCM trouble, bad flow
control, or configuration problems with the modem.  The simplest thing
to do is to correct the ACCM first.

-- 
James Carlson                                  <carlson@workingcode.com>
