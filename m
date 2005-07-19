From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 19 Jul 2005 13:43:16 +0000
Subject: Re: auth eap
Message-Id: <17117.884.100671.724053@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <200507190713.53851.dcorbin@machturtle.com>
In-Reply-To: <200507190713.53851.dcorbin@machturtle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

David Corbin writes:
> On Tuesday 19 July 2005 08:11 am, James Carlson wrote:
> > David Corbin writes:
> > > So, I'm not sure what you by "temporary credentials"
> >
> > Then I'd have to say that there's either a misconfiguration or bug
> > somewhere.  Either you're missing the corresponding "user
> > $DOMAIN\\$USERNAME" option (such that LCP can't 'see' that this entry
> > would be usable)
> 
> You are suggesting the word "user" should appear in a file somewhere, are you?  
> Because I don't have that.

It should be part of the pppd configuration, either in one of the
"options" files, or on the pppd command line.  If you don't specify
it, then pppd assumes the system hostname as the default.  Unless your
system hostname happens to be $DOMAIN\\$USERNAME, that's probably not
going to work.  See the pppd man page for details.

> > , or it's garbled, or there's a bug in the basic 
> > auth.c code that does the lookup for LCP, or LCP itself has become
> > mangled.
> >
> 
> Well, I suppose I can build it and debug it with gdb (or printf).  Any 
> particular tips in that area?

The function that's used to determine if there's a viable
MD5-Challenge secret present in the /etc/ppp/chap-secrets file is
have_chap_secret() in pppd/auth.c.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
