From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 05 Oct 2009 17:38:06 +0000
Subject: Re: ppp question
Message-Id: <4ACA2EFE.9060309@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <008201ca45e2$eb8f8f60$0413010a@scu.escambray.com.cu>
In-Reply-To: <008201ca45e2$eb8f8f60$0413010a@scu.escambray.com.cu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Davy Leon wrote:
> I have a question. Every time I dialup to the internet pppd executes an
> script called ip-up. My question is, everytime someone dials in it's
> executed too?

Yes.  It's executed every time an IP interface is brought up by PPP.

Note that PPP itself knows nothing about dialing in or out; those are
attributes of the lower layer -- the chat script and modems or other
communications gear involved.  PPP is symmetric and peer-to-peer.
There's no "client" or "server."

> If the answer is yes, how can I handle the script to
> execute one part when dianing out and another part when dialing in. I
> meant something like

The man page has a number of environment variables documented that you
could use for this task.  $PEERNAME is fairly useful -- it will be set
only if you have an authenticated peer name.

If you have different devices for dialing in and out (it's often a good
idea to do this, but not always done), then $DEVICE might tell you what
you want to know.

If you want to get fancier, you can use $LINKNAME with the "linkname"
option.

The simple answer would be:

	if [[ -n ${PEERNAME:+I_am_server} ]]; then
		# the peer probably called me
	else
		# I'm probably dialing out
	fi

But note that this is making a big assumption about authentication
configuration: that you always authenticate people calling you, and you
never authenticate people you call.  That's how PPP is commonly used,
but there's nothing in the standards that _requires_ it to be used that way.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
