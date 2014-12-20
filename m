From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 Dec 2014 14:45:32 +0000
Subject: Re: [PATCH v2 0/6] net-PPP: Deletion of a few unnecessary checks
Message-Id: <54958B8C.7010105@users.sourceforge.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <548B1E44.6050005@users.sourceforge.net>	<20141212.115922.687789059853236747.davem@davemloft.net>	<54930D7C.3000901@users.sourceforge.net> <20141218.122556.2148647081075440879.davem@davemloft.net>
In-Reply-To: <20141218.122556.2148647081075440879.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, Eric Dumazet <eric.dumazet@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> I'm saying to leave the code alone.

Do I need to try another interpretation out for your feedback?


> If it goes:
> 
> 	var = foo_that_returns_ptr_err()
> 	if (IS_ERR(var))
> 		return PTR_ERR(var);
> 
> 	p->bar = var;
> 
> or whatever, simply keep it that way!

Do you want to express here that a data structure member should
only be set after a previous function call succeeded?



> I'm not engaging in this conversation any further, you have
> already consumed way too much of my limited time on this
> incredibly trivial matter.

I hope that you will find a bit time and patience again
to clarify affected implementation details in a safer and
unambiguous way.

Regards,
Markus
