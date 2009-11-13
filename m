From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 13 Nov 2009 16:54:16 +0000
Subject: Re: getting the device of the ppp connection
Message-Id: <4AFD8F38.1090108@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <dac45060911130554u31df1580x13d2c901372567af@mail.gmail.com>
In-Reply-To: <dac45060911130554u31df1580x13d2c901372567af@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Charlie Brady wrote:
> 
> On Fri, 13 Nov 2009, James Carlson wrote:
> 
>> This is information that's really known only to the dialer involved, and
>> not to pppd, which 'sees' only a channel for PPP frames.  You can hack
>> around the issue by setting an environment variable to communicate the
>> information needed, but there's no native support in the current design
>> for recording this medium-dependent information.
>>
>> There probably should be something added,
> 
> I don't agree. The caller of pppd can provide the information in the
> environment. Adding stuff to pppd would just be bloat, and more code
> generally means more bugs.
> 
> KISS.

I didn't say it would necessarily need to be something added to pppd.
How to arrange for storing and retrieving that information sounds like a
detailed design decision to me, and might not necessarily involve pppd.
 The high level issue is that it should be possible for the user (or the
user's application) to know just the "ppp0" identity and end up knowing
where that interface actually goes.

I think stuffing it into the environment is just a hack.  It sort of
works, but there's no standard way to encode the information in a string
format, so how it's done is going to end up varying by vendor or even by
system administrator whim.  That's not a great answer for folks trying
to build third party applications.  (Such as, say, an SNMP agent
supporting interface stacking ...)

For what it's worth, I agree that pppd probably shouldn't care much
about this.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
