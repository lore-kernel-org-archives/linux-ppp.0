From: Marcus Better <marcus@better.se>
Date: Wed, 21 Nov 2007 05:44:14 +0000
Subject: Re: IPCP with mobile ISP sometimes gives bogus DNS address
Message-Id: <4743C5AE.4080804@better.se>
List-Id: <linux-ppp.vger.kernel.org>
References: <fg82hb$nrp$1@ger.gmane.org>
In-Reply-To: <fg82hb$nrp$1@ger.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

[Correcting CC for Debian bug]

James Cameron wrote:
>> It works! I patched pppd to accept the WINS settings from the other
>> side:

> Good to see.  I've reviewed the patch briefly, and it seems fine.  I've
> not tested it, as I'm not able to reproduce the conditions easily.

One thing I didn't check is how this patch works if the ms-wins option 
is used. I re-uses the same address fields in the request struct. 
Perhaps two new fields should be added instead.

Marcus

