From: James Cameron <james.cameron@hp.com>
Date: Tue, 08 Jun 2004 07:20:02 +0000
Subject: Re: pppd segfaults on AMD64 with ms-chap
Message-Id: <20040608072002.GX5462@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <40C59FC1.6070007@quadra.ru>
In-Reply-To: <40C59FC1.6070007@quadra.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Matt Domsch posted a patch to one of the PPTP mailing lists today that
causes the MPPE module to use the in-kernel implementations of SHA1 and
ARC4.  You might find that the existing kernel code is 64-bit clean.

I'm sure we'd love to hear how it goes.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
