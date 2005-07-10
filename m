From: David Ananian-Cooper <davidac17@yahoo.com>
Date: Sun, 10 Jul 2005 22:41:18 +0000
Subject: Re: options in plugins?
Message-Id: <20050710224118.81007.qmail@web30506.mail.mud.yahoo.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <87wtny1tad.fsf@stark.xeocode.com>
In-Reply-To: <87wtny1tad.fsf@stark.xeocode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

hi,

yeah - you definately can add options in a plugin.

define a global static option_t array in your code:

e.g.

static option_t options[] = {{"optionname", o_string,
&variable_name, "Description"},{"option2name",
o_string, &variable2_name, "Description2"}, ... ,
{NULL}};

(o_string is the option type - there are some other
ones - i forget which pppd source file to look in for
the list and i don't have a copy of the source on hand
atm. Also, there has to be a {NULL} entry to denote
the end of the list)

then include an add_options(options); command in your
plugin_init().

I think all you need include is pppd.h.

As for development, as far as i can tell, there is
still development going on. I've been suscribed to
this list for a few years and it is very low traffic.
I'm guessing development is done somewhat as an
exclusive club kinda thing.

hope this helps.

cheers,

David

--- Greg Stark <gsstark@mit.edu> wrote:

> 
> I'm not sure if development on pppd is still active.
> It seems there are dozens
> of patches floating around and no upstream releases
> coming. Is it? Is this
> still the list to reach the upstream maintainers?
> 
> My question is whether there's a way to add options
> in a plugin. It seems the
> options list is a static array in plugins.c and
> plugins are loaded using
> dlsym. So unless I've missed some piece of
> infrastructure there isn't.
> 
> This is really unfortunate. My ultimate goal is to
> make the timeouts and
> retries in pppoe configurable just as they are for
> LCP. Currently they're set
> to 5s with unbounded exponential backoff and a max
> of 3 retries. That makes
> any temporary outage of even about 30s result in a
> complete failure.
> 
> I've hacked my personal copy to just retry every 5s
> forever but in an ideal
> world there would be a pppoe-restart and
> pppoe-maxfail just like lcp-restart
> and maxfail that could be set in the options or
> peers files.
> 
> But I don't see any reasonable way to do that
> without writing a lot of code.
> Nor am I clear whether such a patch would eventually
> get released. There's not
> much point in writing it just for myself -- I have
> my personal version hacked
> up for my use already. If development is dead then
> there's not much point in
> fixing this problem so generally.
> 
> -- 
> greg
> 
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> 

