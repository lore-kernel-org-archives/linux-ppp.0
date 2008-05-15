From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 15 May 2008 13:57:57 +0000
Subject: Re: from which hook , I can get the usrname that pppd used?
Message-Id: <18476.16741.523405.846872@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <200805151619318592147@foxmail.com>
In-Reply-To: <200805151619318592147@foxmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

cyx_mail writes:
> from which hook , I can get the usrname that pppd used? both chap or pap, is that a same hook?

What "user name" do you want?  Inside of a script, pppd sets a bunch
of environment variables, which are documented in the "SCRIPTS"
section of the man page.  (You've read through the man page, correct?)

If the peer authenticates itself, then PEERNAME will be set.  The
variables ORIG_UID and PPPLOGNAME have the invoking user's UID and
name.  The local 'name' value in use (the our_name[] array) isn't put
into the environment.  Perhaps it could be.

If you're not talking about a script, but are instead talking about a
pppd plugin, then you can just reference the variables you want --
our_name[] or peer_authname[].

It's possible that you may need to provide more details about what
you're attempting to do, what you've already tried to do, and what
doesn't work in order to get more substantial guidance.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
