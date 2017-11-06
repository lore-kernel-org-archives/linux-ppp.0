From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 06 Nov 2017 18:31:57 +0000
Subject: Re: SOLVED: kernel-mode PPPoE does not seem able to work with MPPE.
Message-Id: <1ada5160-5fbe-f2b6-010b-db14e6d13bad@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <7587137d-f9ae-a4ac-843e-6688af5ff017@googlemail.com>
In-Reply-To: <7587137d-f9ae-a4ac-843e-6688af5ff017@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 11/06/17 09:59, David Fernandez wrote:
> Yes, the code could be deleted, I just wanted somebody to check and say
> that there is no point in yet putting a warning in the log for this...

RFC3078 7.2 says that the receiver changes its key on receiving a "flag"
packet (where (count&0xff) = 0xff).  It says nothing about the
transmitter setting the FLUSHED flag in this case.  That flag is used
*only* when a sequence error is detected.

So I think the original code was wrong (it should not have insisted on
the flag being set), and the new code without the message and without
the error handling is correct.

It _might_ be a good idea to check and at least comment the sending
code.  It should not be setting the FLUSHED flag merely because it is
sending a flag packet ... but, for compatibility with broken Linux MPPE
implementations already deployed, it might have to continue doing that.

It's a shame documents like this don't go through WG review with
multiple independent implementations.  This is the sort of spec
misinterpretation that a good open review is designed to catch.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
