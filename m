From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 Dec 2014 07:01:54 +0000
Subject: Re: [PATCH v2 0/6] net-PPP: Deletion of a few unnecessary checks
Message-Id: <548A92E2.8090304@users.sourceforge.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <547C82A6.2030808@users.sourceforge.net>	<547CA157.1080401@cogentembedded.com>	<5480DA32.8000201@users.sourceforge.net> <20141209.145447.2234157264287438778.davem@davemloft.net>
In-Reply-To: <20141209.145447.2234157264287438778.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, Eric Dumazet <eric.dumazet@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> Generally speaking, it is advisable to not leave error pointers in data
> structures, even if they are about to be free'd up in an error path anyways.
>
> Therefore I do not like some of the patches in this series.

Can you give any more concrete feedback here?

Regards,
Markus
