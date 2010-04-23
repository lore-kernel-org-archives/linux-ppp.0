From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 23 Apr 2010 03:46:28 +0000
Subject: Re: CRC-16 or CRC-32
Message-Id: <4BD11814.6090102@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <291B2C7721AC7B49AD11449A2883992E2C4A9BDC3C@SINTEFEXMBX01.sintef.no>
In-Reply-To: <291B2C7721AC7B49AD11449A2883992E2C4A9BDC3C@SINTEFEXMBX01.sintef.no>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 4/21/2010 5:17 AM, Milan P. Stanic wrote:
> On Wed, 2010-04-21 at 10:10, Jan Just Keijser wrote:
>> the second problem is: if you want to add CRC32 support then you'd
>> have to get it into the linux kernel . that will take *quite* some
>> time (unless you can live with patched linux kernels).
> 
> It wouldn't be so hard to push it to the kernel because Paul Mackerras
> is/was on this list and he is the ppp driver maintainer, I hope ;)

It's a little tricky to implement the feature *well*.  You have to be
able to withstand your peer restarting -- which means that while you're
in CRC-32 mode, you have to be able to accept and process an LCP
Configure-Request frame with a CRC-16 FCS on it -- and you need to be
tolerant of peers that are unable to handle switching -- which means
sending LCP Configure-Request messages with more than one FCS.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
