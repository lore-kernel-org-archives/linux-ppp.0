From: Paul Mackerras <paulus@samba.org>
Date: Mon, 11 Jul 2005 01:20:03 +0000
Subject: Re: options in plugins?
Message-Id: <17105.51523.189084.568175@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <87wtny1tad.fsf@stark.xeocode.com>
In-Reply-To: <87wtny1tad.fsf@stark.xeocode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Greg Stark writes:

> I'm not sure if development on pppd is still active.

Yes it is still active, although slow.

> It seems there are dozens
> of patches floating around and no upstream releases coming. Is it? Is this
> still the list to reach the upstream maintainers?

It'll do. :)

> My question is whether there's a way to add options in a plugin. It seems the
> options list is a static array in plugins.c and plugins are loaded using
> dlsym. So unless I've missed some piece of infrastructure there isn't.

There are two ways a plugin can add options.  The first is to call
add_options, and the second is to set the_channel to point to the
plugin's channel structure, which can have a pointer to an array of
channel-specific options.

> I've hacked my personal copy to just retry every 5s forever but in an ideal
> world there would be a pppoe-restart and pppoe-maxfail just like lcp-restart
> and maxfail that could be set in the options or peers files.

Just add them to the Options[] array in pppd/plugins/rp-pppoe/plugin.c.

Paul.
