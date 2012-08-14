From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 14 Aug 2012 14:57:13 +0000
Subject: Re: Using pppd as a library
Message-Id: <502A6749.3000007@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <502A3A31.2050106@ibtechnology.com>
In-Reply-To: <502A3A31.2050106@ibtechnology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 08/14/12 07:44, neha chatrath wrote:
> I have system requirement in which I need to invoke pppd from a user
> application. This user application needs to do configuration, get status
> etc of the PPP links.
> Well there are various ways of doing it, I am exploring the option of
> including pppd as a library in my build. With this,
> -I can spawn my application as a thread.
> -I can avoid  use of fork and exec operations for executing pppd for
> different links.

You'll need to somehow deal with the event loop that handles both timers
and control path I/O.  And you may also have to deal with blocking
operations, such as name service look-ups that occur during
configuration parsing, that the rest of your application may not be
expecting in a library.

It sounds like a non-trivial thing to get right, at least to me.  (Of
course, it's probably possible to do it wrong with less effort.  ;-})

Note also that the current code assumes that it's running in a single
process per PPP link.  It's littered with statics and other things that
would need to be cleaned up if you were to make it useful for multiple
links in a single process.

I wouldn't do it this way.  Instead, I would use some IPC mechanism to
get at the data necessary.  Then it's just a matter of figuring out how
to get the IPC into the existing event loop (or go multi-threaded if you
dare).  Suitable IPCs (UDP sockets, named pipes, Solaris Doors) will
vary depending on OS, and suitable protocols to use over the IPC will
also vary depending on the application.  In some cases, it may make
sense to build an SNMP agent into the pppd code.

If fork+exec is expensive in your neighborhood (it certainly shouldn't
be, but I don't live where you do), then I think you have a long row to hoe.

> Can somebody help me with this. Is there any pppd library already
> available?

To my knowledge, it's never been done.  When I was with a start-up many
years ago, I did modify the code so that it could handle multiple links
at once, because we scaled to many thousands of links, but I still did
the control and monitoring through an IPC.  (No, I don't have that code
... it went with the start-up.  :-<)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
