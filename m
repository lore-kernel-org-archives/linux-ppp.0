From: Alexey Osipov <simba@lerlan.ru>
Date: Sun, 19 Feb 2012 15:46:00 +0000
Subject: Re: PPP to MS RRAS Server Protocol errors
Message-Id: <1329666360.4667.17.camel@dahari>
List-Id: <linux-ppp.vger.kernel.org>
References: <loom.20120218T220252-25@post.gmane.org>
In-Reply-To: <loom.20120218T220252-25@post.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

В Вск, 19/02/2012 в 09:19 -0500, Charlie Brady пишет:
> On Sun, 19 Feb 2012, Alexey Osipov wrote:
> 
> > > where xxx seems to have a fairly random value.
> > > Any clues?
> > 
> > I've ran in similar trouble a year ago. The difference in my case was
> > that I was connecting from windows box to linux server, but the issue
> > seems to be same.
> > 
> > You can look at my original post to this mail list here:
> > http://marc.info/?l=linux-ppp&m9753728204109&w=2
> > 
> > But I had no response to that. It seems, nobody here is interested in
> > getting stateful mppe encryption work. MPPE stateless mode works good,
> > however.
> 
> Try the pptp specific lists (client and poptop server). Provide more 
> information when you do (use "verbose" flag).

It's not only PPtP specific. It's a PPP-specific (both PPP daemon and
kernel module levels), which also affects PPPoE and possibly other
underneath transport types.

Alexey.

