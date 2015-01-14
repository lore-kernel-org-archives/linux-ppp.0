From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 14 Jan 2015 00:10:35 +0000
Subject: Re: ppp_async: ioctl to set MTU needed
Message-Id: <54B5B3FB.8010801@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <54B556D0.5090204@mirix.org>
In-Reply-To: <54B556D0.5090204@mirix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 1/13/2015 6:04 PM, Christoph Schulz wrote:
> Hello!
> 
> Christoph Schulz schrieb am Tue, 13 Jan 2015 23:56:25 +0100:
> 
>> By the way, how does Solaris solve this problem? [...]
> 
> Never mind, I forgot that pppd supports multilink PPP only under Linux.

Yes, exactly.  At Sun, we had a multilink implementation, but there
wasn't much call for it.  The best reason to use MP is to bond together
the two B channels in Basic-Rate ISDN or two or more B channels in
Primary-Rate ISDN.  Those links tend to be tightly controlled in terms
of delay and error rate, so they work well for MP.

And not many people ended up caring too much about ISDN.  (Yeah, I know
there are still aficionados out there ...)

If because the segmentation/reassembly process in MP works only as well
as the worst-performing link, it tends to be an overall loss if you have
links that differ.

A better plan is to use multipath IP routes -- ECMP across multiple
independent ordinary (non-MP) PPP links -- if you have links that differ.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
