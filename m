From: James Cameron <quozl@laptop.org>
Date: Tue, 15 Mar 2011 11:03:45 +0000
Subject: Re: pptponfig centos 5.4
Message-Id: <20110315110345.GB5486@us.netrek.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <W6630510430284451299766958@webmail23>
In-Reply-To: <W6630510430284451299766958@webmail23>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Then I don't understand what you are asking, sorry.

On Tue, Mar 15, 2011 at 12:21:15AM +0000, tony.chamberlain@lemko.com wrote:
> That is what I do, James.  ip-up.lcaol but for each server I have to change
> it.  I know openvpn will set the routes for you.  Maybe the windows thing
> just did a default route?
> 
> -----Original Message-----
> From: James Cameron [mailto:quozl@laptop.org]
> Sent: Monday, March 14, 2011 04:46 PM
> To: linux-ppp@vger.kernel.org
> Subject: Re: pptponfig centos 5.4
> 
> On Mon, Mar 14, 2011 at 01:05:26PM +0000, tony.chamberlain@lemko.com wrote:
> > Using the Windows pptp when I connect it allows the remote host to set
> > my routes for the PPTP vpn.
> 
> Is there a protocol specification for how this is achieved?
> 
> > Is there a way to do this in Linux too?
> 
> Not to my knowledge.  It would imply a communication of routing policy
> over the PPP link, and some way to know if it is trusted.
> 
> A common way to achieve this is to use /etc/ppp/ip-up.d scripts on the
> client side that recognise the tunnel in some way.
> 
> -- 
> James Cameron
> http://quozl.linux.org.au/
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
James Cameron
http://quozl.linux.org.au/
