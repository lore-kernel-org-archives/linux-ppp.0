From: Matt Domsch <Matt_Domsch@dell.com>
Date: Tue, 20 Jul 2004 20:45:40 +0000
Subject: [0/2]: ppp_mppe inclusion
Message-Id: <20040720204540.GA27576@lists.us.dell.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

This mail will be followed by two patches, for comment on proposed
solution.  I've compiled this, but am not able to test this week.

1: ppp_generic.patch adds three new fields to struct compressor,
allowing ppp_generic.c to allocate additional skb space for
compression/decompression routines that may need such, and a
'must_compress' flag to be used to avoid sending non-encrypted packets
when SC_CCP_UP is not set.

2: ppp_mppe.patch adds the ppp_mppe compressor, which implements
Microsoft Point-to-Point Tunnelling Protocol.

Thanks
Matt

-- 
Matt Domsch
Sr. Software Engineer, Lead Engineer
Dell Linux Solutions linux.dell.com & www.dell.com/linux
Linux on Dell mailing lists @ http://lists.us.dell.com
