From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 19 Nov 2015 19:29:04 +0000
Subject: Re: Problems with pppd option: record file
Message-Id: <564E2300.9070801@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <564CBFC6.4090409@web.de>
In-Reply-To: <564CBFC6.4090409@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 11/19/15 14:25, Thomas Bergholz wrote:
> Actually I did simply not think of trying the underlying physical
> interface as capture target directly.... - works great!
> 
> Thanks for taking time to watch into this.
> 

No problem; glad it's working as you need.

(Note that even if you could get the "record" option to work, it would
only be the PPP traffic, and wouldn't include PPPoE.  That lower layer
is sometimes the source of interesting problems.)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
