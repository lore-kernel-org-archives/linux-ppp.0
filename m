From: David Corbin <dcorbin@machturtle.com>
Date: Tue, 19 Jul 2005 12:40:47 +0000
Subject: Re: auth eap
Message-Id: <200507190840.47610.dcorbin@machturtle.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200507190713.53851.dcorbin@machturtle.com>
In-Reply-To: <200507190713.53851.dcorbin@machturtle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tuesday 19 July 2005 08:11 am, James Carlson wrote:
> David Corbin writes:
> > So, I'm not sure what you by "temporary credentials"
>
> Then I'd have to say that there's either a misconfiguration or bug
> somewhere.  Either you're missing the corresponding "user
> $DOMAIN\\$USERNAME" option (such that LCP can't 'see' that this entry
> would be usable)

You are suggesting the word "user" should appear in a file somewhere, are you?  
Because I don't have that.

> , or it's garbled, or there's a bug in the basic 
> auth.c code that does the lookup for LCP, or LCP itself has become
> mangled.
>

Well, I suppose I can build it and debug it with gdb (or printf).  Any 
particular tips in that area?

