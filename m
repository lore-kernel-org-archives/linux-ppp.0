From: "Milan P. Stanic" <mps@rns-nis.co.yu>
Date: Tue, 16 Mar 2004 22:53:53 +0000
Subject: Re: Moving logwtmp
Message-Id: <20040316225353.GA4899@rns-nis.co.yu>
List-Id: <linux-ppp.vger.kernel.org>
References: <91A5926EFF44D3118B1200104B7276EB02C56E0B@hart-exchange.hartwellcorp.com>
In-Reply-To: <91A5926EFF44D3118B1200104B7276EB02C56E0B@hart-exchange.hartwellcorp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, Mar 16, 2004 at 03:26:08PM -0500, James Carlson wrote:
> Milan P. Stanic writes:
> > On Tue, Mar 16, 2004 at 07:54:04AM -0500, James Carlson wrote:
> > > I'd support that as a configuration option, though, with appropriate
> > > warnings.  ("If you do this, then your wtmp file will contain
> > > PPP-authenticated names that might not match real UIDs on your system,
> > > and may confuse the heck out of management software.")
> > 
> > Maybe is beter to make that compile time option.
> 
> Why?  In my opinion, compile time options should be reserved for
> extreme cases where it just can't be compiled at all on certain
> systems without the flag.

It depends how much overhead, stability and size they bring to code.
 
> Mere changes in behavior should not require the application to be
> recompiled from source, should they?

Rarely used features are compile time options. For example pam. ipv6,
srp, cbcp are commented in the Makefile.
