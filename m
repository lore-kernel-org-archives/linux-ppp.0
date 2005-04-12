From: Ray Van Dolson <rayvd@digitalpath.net>
Date: Tue, 12 Apr 2005 16:15:07 +0000
Subject: Re: pppd + ldap??
Message-Id: <20050412161507.GA8332@digitalpath.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <f06200707be81410e288b@[195.169.144.222]>
In-Reply-To: <f06200707be81410e288b@[195.169.144.222]>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

You would use the radius plugin to authenticate against a RADIUS server which
in turn would be configured to authenticate against LDAP.

Ray

On Tue, Apr 12, 2005 at 11:14:53AM +0200, Ramses van Pinxteren wrote:
> Hi,
> 
> I read on the net somewhere that ldap authentication was done by 
> radius.so plugin?? if this is true, then I hope someone can help me 
> with setting this plugin up?
> 
> thanks,
> ramses
