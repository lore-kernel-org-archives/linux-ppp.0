From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 Dec 2014 17:22:48 +0000
Subject: Re: [PATCH v2 0/6] net-PPP: Deletion of a few unnecessary checks
Message-Id: <548B2468.5050402@users.sourceforge.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <548B0A29.8050503@users.sourceforge.net>	<20141212.105106.1162681032492664308.davem@davemloft.net>	<548B1E44.6050005@users.sourceforge.net> <20141212.115922.687789059853236747.davem@davemloft.net>
In-Reply-To: <20141212.115922.687789059853236747.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, Eric Dumazet <eric.dumazet@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> Where should "the error pointers" be stored instead?
> A local variable, before you assign it into the datastructure.

Will it be acceptable for you that anyone (or even me) will introduce
such a change with a seventh (and eventually eighth) update step here?
Do you want any other sequence for source code preparation of
the requested software improvement?

Regards,
Markus
