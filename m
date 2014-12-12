From: David Miller <davem@davemloft.net>
Date: Fri, 12 Dec 2014 16:59:22 +0000
Subject: Re: [PATCH v2 0/6] net-PPP: Deletion of a few unnecessary checks
Message-Id: <20141212.115922.687789059853236747.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <548B0A29.8050503@users.sourceforge.net>
	<20141212.105106.1162681032492664308.davem@davemloft.net>
	<548B1E44.6050005@users.sourceforge.net>
In-Reply-To: <548B1E44.6050005@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: elfring@users.sourceforge.net
Cc: sergei.shtylyov@cogentembedded.com, paulus@samba.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, eric.dumazet@gmail.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, julia.lawall@lip6.fr

From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 Dec 2014 17:56:36 +0100

> Where should "the error pointers" be stored instead?

A local variable, before you assign it into the datastructure.
