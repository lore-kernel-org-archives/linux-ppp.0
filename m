From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 10 Mar 2005 19:30:32 +0000
Subject: Re: pppd (version 2.4.1) - unrecognized options
Message-Id: <16944.41048.500620.904933@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <20C86D2620F6D411A199009005DC010208337402@exchange_serve.multitech.prv>
In-Reply-To: <20C86D2620F6D411A199009005DC010208337402@exchange_serve.multitech.prv>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Thanh Tran writes:
> I checked the source code and found that the "ipcp_option_list" (which
> contains "IP addresses", o_wild, (void *) &setipaddr ... ) is defined in the
> "ipcp_protent" structure, but this structure is being #if out with "Brindha"
> in Main.c (user/pppd-2.4.1/pppd).  

What?

I just did a search over all the releases from 2.3.11 through 2.4.3,
and I can't find any references to "Brindha" anywhere in any file.

It sounds like you have hacked sources.  Where did you get them?  And
why aren't you using the real sources?

-- 
James Carlson                                 <carlsonj@workingcode.com>
