From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 13 Nov 2018 16:49:56 +0000
Subject: Re: How to know when a link is established or destroyed?
Message-Id: <12a81187-bf39-61c4-9f16-55b1653f945f@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20181022122818.1780e0bd@PC-dev2>
In-Reply-To: <20181022122818.1780e0bd@PC-dev2>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On 11/13/18 07:08, Morel B=C3=A9renger wrote:
>> The simplest is to use the "debug" option, and get the log messages
>> via syslog.  Use "logfile /path/to/some/file" if you can't use syslog
>> for some reason.  (Note: don't use kdebug unless there are
>> kernel-level problems.  This doesn't sound like a kernel-level
>> problem.)
>=20
> Are logs sent to a file exactly the same as those sent to syslog?

Yes, if you use the "logfile /path/to/some/file" option.

Missing from the logs you sent is the "debug" option, so the information
you've provided is *very* sketchy and not very useful.  However, I do
have some questions about it.  During the first 197.7 minute-long
session, did you successfully connect?  Did you get actual IP service on
the initial try?

I don't know whether you have a completely failing connection (which
would point towards one set of problems) or a connection that merely
fails on retry (which points to a different set of problems).

If you kill off pppd, wait a few seconds, and then start it again, will
you get another successful session at the start?  Is it only having
trouble during a post-failure retry (i.e., during 'persist')?

Based on the following messages, I can make at least one somewhat
educated guess.

Nov  7 15:15:13 700009-vnf-180918 pppd[1161]: Remote message: Greetings!!
Nov  7 15:15:13 700009-vnf-180918 pppd[1161]: PAP authentication succeeded
Nov  7 15:15:13 700009-vnf-180918 pppd[1161]: Hangup (SIGHUP)
Nov  7 15:15:13 700009-vnf-180918 pppd[1161]: Modem hangup
Nov  7 15:15:13 700009-vnf-180918 pppd[1161]: Connection terminated.


As I said in my previous message, GPRS is really quite horrible.  One of
the horrible aspects of it is that it deliberately *lies* to the peer
during the PPP authentication phase.  If you pass bad credentials
(either via one of the PPP authentication protocols or via some 'hidden'
channel, such as your subscriber ID / telephone number), a GPRS server
will send back a fake "success" message.  The actual authentication work
in GPRS is (inexplicably) delayed until the PPP Network phase.  This
means that an authentication failure perversely manifests as IPCP
negotiation failure.  Instead of getting a good address to use, you get
a garbage address that doesn't work, or no address at all, and the
system just waits for you to hang up in frustration with no outward
indication of the real problem.

So, at a glance, and without the strength of seeing the actual pppd
"debug" messages I originally requested, the summary informational
messages above *may* tend to indicate that your user name or password
are not valid, or that something about your local configuration isn't
right with respect to credentials, or the account that you're using to
connect to this GPRS server is itself not authorized, or that you're
violating some policy rule that the GPRS provider has in place (e.g.,
maximum number of connected minutes per day or minimum time between
successive connection attempts or some such rule).

When I was PPPEXT chair, I argued with the GPRS people until I was blue
in the face.  It did no good, of course.  I'm sorry you're one of the
victims here.

--=20
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
