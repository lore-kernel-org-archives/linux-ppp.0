From: James Carlson <carlsonj@workingcode.com>
Date: Sat, 31 Jul 2021 18:36:03 +0000
Subject: Re: [bug report] ppp: fix 'ppp_mp_reconstruct bad seq' errors
Message-Id: <f2558693-c7e4-8a70-94f0-09119b146e1c@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20210729141617.GC1267@kili>
In-Reply-To: <20210729141617.GC1267@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 7/30/21 1:15 PM, James Carlson wrote:
> On 7/30/21 4:48 AM, Dan Carpenter wrote:
>>> --> 2840 		ppp->nextseq = PPP_MP_CB(tail)->sequence + 1;
>>>                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>
>> Here is where Smatch complains.
> 
> If that's Smatch's analysis of the situation, then Smatch is wrong.
> It's a bogus warning.

For what it's worth, it's not my code, and I agree that it's at least a 
bit hard to follow, and may well harbor bugs.  If you're suggesting 
either some kind of suppression directive (I tried looking for some 
Smatch documentation but couldn't find much to suggest that's possible, 
though I guess now that you'd be the one who knows for sure), or adding 
something like "u32 nextseq = PPP_CB(tail)->sequence + 1;" around line 
2795, and then using "ppp->nextseq = nextseq;" on 2840, then I'd be in 
favor of that, at least to make the tool happy.

Is there an equivalent of "/* LINTED: tail pointer still ok */" here?

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
