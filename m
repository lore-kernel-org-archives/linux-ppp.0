From: Daniel Golle <dgolle@allnet.de>
Date: Sun, 03 Jun 2012 18:19:29 +0000
Subject: Re: Upcoming 2.4.6 release
Message-Id: <4FCBAAB1.8020307@allnet.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <20120602100037.GE17089@pale.ozlabs.ibm.com>
In-Reply-To: <20120602100037.GE17089@pale.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 03/06/12 20:35, James Carlson wrote:
> On 6/2/2012 1:30 PM, Daniel Golle wrote:
>> On Sat, Jun 02, 2012 at 12:00:37PM +0200, Paul Mackerras wrote:
>>> I have just pushed a dozen commits to the ppp.git repository at
>>> git://ozlabs.org/~paulus/ppp.git.  I'd like to do a 2.4.6 release
>>> soon.  So if anyone has patches pending, now is the time to send
>>> them, and if people could test what's there that would be good.
>> I recently moved the PPtP plugin from accel-pptp[1] into pppd and tested it with
>> OpenWrt in the past month. Seems to work great and would obsolete pptpd.
>>
> 
> Seems like a good step forward.  One question, though: if it's a pppd
> plug-in, why does it have its own independent debug/error logging
> infrastructure?
> 
It generally looks like the management-connection handling of PPtPd was
refactored and reused in the PPtP plugin. Probably this is why it brings all
that redundant piece of logging infrastructure with it.
However, as the logging calls are handled through macros in util.h it's quite
easy to just use sed to replace them and use the macros from pppd.h instead.
I'll see if more decent critique comes up and then do all that I believe makes
sense and then re-submit the patch.
