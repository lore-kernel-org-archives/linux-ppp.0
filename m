From: James Carlson <carlson@workingcode.com>
Date: Wed, 03 Mar 2004 17:27:05 +0000
Subject: Re: Writing a dialer
Message-Id: <16454.5481.146038.907479@c-24-147-210-59.ne.client2.attbi.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200403031714.i23HEtJN021770@webmail2.magma.ca>
In-Reply-To: <200403031714.i23HEtJN021770@webmail2.magma.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Javier Govea writes:
> A requirement for my program is that I must have control over the pppd's so that i can
> kill them or restart them. One form of getting that control, within my C++ program, is by
> getting the pid's, but i'm open to other suggestions.

Assuming your program keeps running while pppd runs, that sounds like
the best way to do it.

If your program just runs to start up pppd, exits, and then runs again
to shut it down, then consider using the "linkname" option to have the
pppd pid stored somewhere convenient.

> How can I call pppd and chat from C++ to setup my ppp links?? and at the same time to have
> control over the pppd processes?? Is this possible??? or I defenitely have to write my own
> 'chat' program??? 

It has nothing to do with chat.  These are separate issues.

> I already tried two things from my C++ code, the first one:
> 
> system ("/usr/sbin/pppd /dev/input/ttyACM0 call my-script user user1")

Take a look at the "nodetach" and "updetach" options for pppd.  The
former is useful if you're going to hang around for the whole session,
the latter is useful if you just want to know that pppd got off to a
good start.

> The second thing I tried is this: 
> 
> char *args[] = {"/dev/input/ttyACM0\0", "call\0", "my-script\0", "user\0", "user1", NULL};

What's with all the "\0" escapes?  Those should not be needed.

And why doesn't args[0] contain "pppd"?  That doesn't look at all
healthy to me.

> execv returns the pid and gives me more control over the pppd. execv starts the pppd but
> the chat program does not run properly. It seems that the chat program is started as an
> independent process and not as child of the pppd (which is the way i think it should run). 

No, chat is a child of pppd, and it runs synchronously (pppd waits for
it to exit).  It sounds like the environment or something else was
mangled when your program started pppd.  The invocation of exec that
you posted doesn't look right.

It's impossible to tell, though, without debug logs.

-- 
James Carlson                                  <carlson@workingcode.com>
