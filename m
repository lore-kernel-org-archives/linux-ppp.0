From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 11 Mar 2014 16:56:17 +0000
Subject: Re: PPPD plugin development
Message-Id: <531F4031.5080304@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <531BEBF2.3020508@gmail.com>
In-Reply-To: <531BEBF2.3020508@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 03/11/14 05:55, Greg wrote:
> Hey guys,
> 
> Once again, Thanks for all the help.
> 
> I've managed to get it to work completely. I had to globalize a USERID
> variable, and from there I was able to set it in the verify function and
> call it from the ip_down notifier. This allowed me to do all the
> updating I needed.

I would have done this with the existing /etc/ppp/auth-down script,
which should be invoked with $PEERNAME set in the environment if the
user was authenticated.

But, if you've got your scheme working, then that sounds great.  Glad to
hear that it's working out.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
