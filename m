From: James Carlson <carlson@workingcode.com>
Date: Tue, 16 Mar 2004 20:26:08 +0000
Subject: Re: Moving logwtmp
Message-Id: <16471.25312.832766.345659@c-24-147-210-59.ne.client2.attbi.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <91A5926EFF44D3118B1200104B7276EB02C56E0B@hart-exchange.hartwellcorp.com>
In-Reply-To: <91A5926EFF44D3118B1200104B7276EB02C56E0B@hart-exchange.hartwellcorp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Milan P. Stanic writes:
> On Tue, Mar 16, 2004 at 07:54:04AM -0500, James Carlson wrote:
> > I'd support that as a configuration option, though, with appropriate
> > warnings.  ("If you do this, then your wtmp file will contain
> > PPP-authenticated names that might not match real UIDs on your system,
> > and may confuse the heck out of management software.")
> 
> Maybe is beter to make that compile time option.

Why?  In my opinion, compile time options should be reserved for
extreme cases where it just can't be compiled at all on certain
systems without the flag.

Mere changes in behavior should not require the application to be
recompiled from source, should they?

-- 
James Carlson                                  <carlson@workingcode.com>
