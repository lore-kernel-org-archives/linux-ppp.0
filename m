From: James Carlson <carlsonj@workingcode.com>
Date: Sat, 13 Dec 2008 19:33:24 +0000
Subject: Re: pptpd
Message-Id: <18756.3588.987557.26196@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <W9548217129274771229195924@webmail26>
In-Reply-To: <W9548217129274771229195924@webmail26>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

tony.chamberlain@lemko.com writes:
> and then in CHAP secrets I put logins and passwords.
> Thing is, people need their own IP address (need to count
> on it each time they connect).  For instance, if I have
> something in chap secrets like
> 
> 
> 
>    lincoln * abraham *

Change that to:

	lincoln * abraham 192.168.0.234

> Can I do this somehow?  Doesn't have to be in chap-secrets as long as
> I can do it.  Is there something like an options.lincoln file?

No, but if the fifth element on the line is "--", you can add extra
options there.  These are applied only after the PPP Authentication
phase, so they can't be LCP or auth options.  For instance:

	lincoln * abraham 192.168.0.234 -- novj

You can also specify the fourth parameter as an allowed address range
or include "+" to specify that the address is formed using the unit
number.  See the man page for details.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
