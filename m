From: Paul Mackerras <paulus@samba.org>
Date: Wed, 08 Feb 2006 22:44:48 +0000
Subject: Re: [PATCH] ppp: don't use 0 in pointer context
Message-Id: <17386.29792.87133.852682@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20060208222559.GA14543@mipter.zuzino.mipt.ru>
	<17386.27957.822041.83512@gargle.gargle.HOWL>
In-Reply-To: <17386.27957.822041.83512@gargle.gargle.HOWL>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Carlson <carlsonj@workingcode.com>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, Al Viro <viro@ftp.linux.org.uk>, netdev@vger.kernel.org, linux-ppp@vger.kernel.org

James Carlson writes:

> Alexey Dobriyan writes:
> > -	if (ap = 0)
> > +	if (!ap)
> 
> And the solution is to treat it as a boolean instead?!  I'm not sure
> which is more ugly.
> 
> Why wouldn't explicit comparison against NULL be the preferred fix?

I just think this whole "you shouldn't compare a pointer to 0" thing
is completely silly, and patches like this have about the same level
of usefulness as patches that change "color" to "colour" or vice
versa.

However, the head penguin seems to have some bee in his bonnet about 0
not being a pointer value (despite what the C standard says), so
whatever.  *shrug*

Paul.
