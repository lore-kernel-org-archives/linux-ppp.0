From: Bill Unruh <unruh@physics.ubc.ca>
Date: Tue, 22 Jun 2004 16:58:59 +0000
Subject: Re: PPPd as a dialin server and dialout client
Message-Id: <Pine.LNX.4.50.0406220956070.24383-100000@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040622140754.68934.qmail@web50209.mail.yahoo.com>
In-Reply-To: <20040622140754.68934.qmail@web50209.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, 22 Jun 2004, Jaspreet Singh wrote:

> Hi,
> Is it possible to configure one PPPd as a dialin
> server and a dial out client? I have a situation where
> an incoming call should be handled and a dial on
> demand should be handled for the same port.

Sure. EAsily. You just need to handle the file locking properly (put the
lock option into /etc/ppp/options, and make sure that pppd and mgetty
use the same /dev file name.)

Note that I would not use dial on demand, since the incoming connection
is liable to want to go out as well, and that could cause problems. In
many cases dial on demand is more trouble than it is worth.
Surely your users know when they want to go out, and can click on an
icon to get connected.

> 
> Regards,
> Jaspreet
> 
> 
> 		
> __________________________________
> Do you Yahoo!?
> Yahoo! Mail Address AutoComplete - You start. We finish.
> http://promotions.yahoo.com/new_mail 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
