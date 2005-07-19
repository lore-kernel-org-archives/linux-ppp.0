From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 19 Jul 2005 12:11:57 +0000
Subject: Re: auth eap
Message-Id: <17116.60941.980784.621675@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <200507190713.53851.dcorbin@machturtle.com>
In-Reply-To: <200507190713.53851.dcorbin@machturtle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

David Corbin writes:
> > To find out which EAP method is needed, you could either ask the
> > person who owns that peer system, or set up some temporary credentials
> > in /etc/ppp/chap-secrets and find out what EAP method the peer
> > requests.  When it's not one that's implemented by pppd (almost a
> > certainty), you'll need to go off and find code (a patch) that does
> > this for you, or implement it yourself.
> 
> 
> But I have /etc/ppp/chap-secrets, with a line like this (appropriate 
> substituions apply).
> 
> $DOMAIN\\$USERNAME PPTP $PASSWORD *
> 
> So, I'm not sure what you by "temporary credentials"

Then I'd have to say that there's either a misconfiguration or bug
somewhere.  Either you're missing the corresponding "user
$DOMAIN\\$USERNAME" option (such that LCP can't 'see' that this entry
would be usable), or it's garbled, or there's a bug in the basic
auth.c code that does the lookup for LCP, or LCP itself has become
mangled.

(The latter two are at least remotely possible ... there've been a few
changes in this area over the years.)

> > For what it's worth (and it might not be much), PPTP is quirky and of
> > probably questionable value.
> 
> yeah.  Well, I *tried* to get them to use a linux-based system, but some 
> people are to MS-bound in the head.

It wouldn't have to be Linux-based to be better.  Just standards-based
would be nice.  Even MS supports some decent standards, but it seems
that you have to push hard to get anyone to configure and use them.
The proprietary goop is the path of least resistance.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
