From: carlsonj@workingcode.com
Date: Thu, 28 Oct 2004 15:00:24 +0000
Subject: Re: ppp 2.4.3 cvs authentication issue
Message-Id: <16769.2440.831660.368734@carlson.workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20041028124517.7204.qmail@web25210.mail.ukl.yahoo.com>
In-Reply-To: <20041028124517.7204.qmail@web25210.mail.ukl.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

a b writes:
> sent [CCP ConfReq id=0x1 <mppe +H -M +S -L -D -C>]

You ask for MPPE.

> rcvd [CCP ConfReq id=0x1 <deflate 15> <deflate(old#)
> 15> <bsd v1 15>]

The peer asks for the usual suite of freely-available compression
algorithms, but does *NOT* ask for MPPE.

> MPPE required but peer negotiation failed
> sent [LCP TermReq id=0x2 "MPPE required but peer
> negotiation failed"]

Two problems: (1) what I consider to be a design bug in MPPE, as it
should not just shut down, but should try to negotiate first and (2)
peer that is either misconfigured or just doesn't support MPPE.

> 2. you're saying that "the peer apparently isn't
> configured to use MPPE."

Yes.

> My question is: is there something to do on the client
> side in order to ask for a mppe authentication ?

MPPE isn't authentication; it's encryption.

According to the pppd(8) man page:

     nomppe
          Disables MPPE (Microsoft Point  to  Point  Encryption).
          This is the default.
[...]
     require-mppe
          Require the use  of  MPPE  (Microsoft  Point  to  Point
          Encryption).   This  option disables all other compres-
          sion  types.   This  option  enables  both  40-bit  and
          128-bit  encryption.  In order for MPPE to successfully
          come up, you must have authenticated  with  either  MS-
          CHAP  or MS-CHAPv2.  This option is presently only sup-
          ported under Linux, and only if your  kernel  has  been
          configured to include MPPE support.

In other words, I think the peer needs this configuration option as
well in order to use MPPE.

-- 
James Carlson                                 <carlsonj@workingcode.com>
