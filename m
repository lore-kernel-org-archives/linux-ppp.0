From: James Carlson <carlson@workingcode.com>
Date: Fri, 19 Mar 2004 20:52:48 +0000
Subject: Re: Moving logwtmp
Message-Id: <16475.23968.492747.723186@c-24-147-210-59.ne.client2.attbi.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <91A5926EFF44D3118B1200104B7276EB02C56E0B@hart-exchange.hartwellcorp.com>
In-Reply-To: <91A5926EFF44D3118B1200104B7276EB02C56E0B@hart-exchange.hartwellcorp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Milan P. Stanic writes:
> IMO, all extensions should be compile time options. PPP is used in
> different systems from servers to embedded devices (pda's, appliances ...)
> and should be small as possible.

Sure.  But this particular implementation isn't really designed to do
that.

If you're arguing that it should be, then I'd probably agree with you.
It'd be a real pile of work to get it into shape so that it could
actually be used in embedded environments.  Glad to see you've
volunteered.  ;-}

Among the things to worry about:

	- lack of support for multiple contexts (relies on VM -- one
          process per PPP instance)

	- lack of SNMP and other administrative interfaces

	- dependence on a POSIX-like filesystem and kernel behavior
          (including subtle things such as controlling tty semantics)

	- wrappers for "standard" C libraries

	- code hasn't been thoroughly audited (as far as I know) to
          make sure there are no slow memory leaks

> Distributors of big OS distributions will build it with all options
> enabled, I'm, sure ;)

The current set of targets for which ppp-2.4 successfully builds and
installs doesn't include anything but those "big OS distributions."

That might well constitute a bug in its own right, though.

> People who installs from source will know how to enable features
> which they want to have.

Sure ... but since I've actually done this in the past (albeit using
2.3 as a base), I can attest to the fact that ifdefs around an
arbitrary handful of services (and ifdefs that are themselves rarely
if ever tested -- and thus often fail to produce a working object when
disabled) doesn't help a lot, and does obscure the code.

-- 
James Carlson                                  <carlson@workingcode.com>
