From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 11 Feb 2010 14:41:51 +0000
Subject: Re: Control pppd behaviour
Message-Id: <4B74172F.8030006@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <27543592.post@talk.nabble.com>
In-Reply-To: <27543592.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Ashmath Khan wrote:
> Ok.
> Its a requirement from my customer which I need to implement !
> My customer doesn't want normal retries but want this to be tried. As
> simple as that.
> In addtion:and after m retries, I would want to switch to some default
> credentials and continue the retries.
> Does this explain ?

Unfortunately, no, but we're getting closer.

Are you talking about PPP negotiation or about separate invocations of pppd?

If it's separate invocations of pppd, then you can certainly wrap pppd
with a script that checks the exit code (make sure you use the
"updetach" option so you get something sensible), and use the exit code
to determine what to do next.  See the man page for details.

If you're talking about the individual PPP negotiation messages that a
single pppd invocation sends to its peer (i.e., you want to send PAP
Authenticate-Request using user "joe" the first two times and then "bob"
the next two times), then you'll need to modify the source to do as
you're asking.

Fortunately, it's pretty easy to modify.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
