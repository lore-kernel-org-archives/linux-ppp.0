From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 10 Mar 2005 12:36:33 +0000
Subject: Re: Blowfish encryption
Message-Id: <16944.16209.356422.666549@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <1110403872.18073.330.camel@linux.linxdev.com>
In-Reply-To: <1110403872.18073.330.camel@linux.linxdev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Christopher Fowler writes:
> I've been thinking about encryption in pppd.  By reading my emails
> you've probably have an idea of what we do with pppd.  Since I don't use
> pppd to attach a windows desktop to a Linux server I was thinking about
> maybe an implementation of Blowfish type encryption between two pppd
> processes.  There could be a command line argument that runs on
> encryption and the two processes could determine in the LCP phase that
> they are to encrypt all data between them.    This is mainly for those
> individuals who think that the phone company will tap their line and see
> their data.  Not very useful in tunnels since programs like vtun do the
> encryption for pppd.  

Not LCP, as peer identity isn't known at that time -- see the
standards-based ECP (RFC 1968) and Microsoft's ugly hacks to CCP (RFC
3078) instead.

> Is this something that might be feasible?  I'm not looking to add
> certificate based encryption like SSL but encryption like SSH, Vtun and
> others.

Before spending a lot of time on the low-level details, I'd suggest
considering what the threat model is, and what security associations
are necessary.

For feasibility, there are a few issues to consider:

  - You can't (or at least should not) just steal an option number to
    negotiate some new feature.  The risk is that someone else will
    use the same number to mean something else, and the result will be
    an unpredictable interoperability problem.  Instead, go through
    the IETF and IANA to do the proper allocation if you want to
    create a new protocol.

  - Other implementations are required to reject things they don't
    understand, so it's reasonable to assume that they will do the
    right thing with any new option.  However, it's unfortunately very
    well known that there are a pile of truly horrid implementations
    out there.  Some don't pay attention to rejects correctly.  Some
    reject things that were never offered.  Some get confused and just
    crash.  So, it's likely that you'll need some sort of option to
    enable this new behavior; it shouldn't be the default.

  - Deployment is a consideration for any new protocol.  If it's just
    for your own use, I guess you can do anything you want.  But the
    goal of IETF protocols is to produce interoperable
    implementations.  Thus, it'd be wise to study the existing
    solutions carefully to see if any can be coerced into doing what
    you need.  Only if all of the existing solutions are unacceptable
    should you try to create a new one -- and even then, you face the
    problem that everyone in the world will need to implement your new
    feature in order for the feature to be useful.  It's not a short
    path.

>  Would a windows connection croak if it dialed into my box and
> my box wanted to use encryption?  Would the windows ppp process be smart
> enough to reject that request?  Has anything like this been tried yet?

I'm not sure those questions make sense.  If your system requires
encryption, why would *you* ever accept a connection that wasn't
encrypted?  In that case, why would you care that Windows flies to
pieces when you ask it to encrypt?  That's exactly what I think you
would *want* to have it do.

-- 
James Carlson                                 <carlsonj@workingcode.com>
