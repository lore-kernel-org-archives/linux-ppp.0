From: "Milan P. Stanic" <mps@rns-nis.co.yu>
Date: Fri, 19 Mar 2004 19:51:19 +0000
Subject: Re: Moving logwtmp
Message-Id: <20040319195119.GA12632@rns-nis.co.yu>
List-Id: <linux-ppp.vger.kernel.org>
References: <91A5926EFF44D3118B1200104B7276EB02C56E0B@hart-exchange.hartwellcorp.com>
In-Reply-To: <91A5926EFF44D3118B1200104B7276EB02C56E0B@hart-exchange.hartwellcorp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, Mar 16, 2004 at 09:00:01PM -0500, James Carlson wrote:
> Milan P. Stanic writes:
> > > Mere changes in behavior should not require the application to be
> > > recompiled from source, should they?
> > 
> > Rarely used features are compile time options. For example pam. ipv6,
> > srp, cbcp are commented in the Makefile.
> 
> Not all systems support PAM or IPv6, or have the installed libraries
> required for SRP.  Those have to be omitted on the systems that don't
> have the underlying support.
> 
> As for CBCP, I'm not sure I understand what the rationale would be.
> Sure, CBCP is nasty, brutish stuff, but ifdef doesn't seem like the
> right answer.

IMO, all extensions should be compile time options. PPP is used in
different systems from servers to embedded devices (pda's, appliances ...)
and should be small as possible. Byte saved here, byte saved there
and the sistem can fit to flash memories and such devices.
So, the rarely used features shouldn't be in the binary by default,
but this is only my opinion.

Distributors of big OS distributions will build it with all options
enabled, I'm, sure ;)

People who installs from source will know how to enable features
which they want to have.
