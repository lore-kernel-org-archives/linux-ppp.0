From: Christoph Schulz <develop@kristov.de>
Date: Wed, 16 Jul 2014 21:19:50 +0000
Subject: Re: [PATCH net-next 1/1] net: ppp: reset nextseq counter when enabling SC_MULTILINK
Message-Id: <20140716231950.17744ie9e3i9ea9i@berry.schulz.ip-v6.eu>
List-Id: <linux-ppp.vger.kernel.org>
References: <53C4F987.1040401@kristov.de>
 <20140715.225259.1933230941203001162.davem@davemloft.net>
In-Reply-To: <20140715.225259.1933230941203001162.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-ppp@vger.kernel.org, paulus@samba.org

Hello!

David Miller schrieb am Tue, 15 Jul 2014 22:52:59 -0700 (PDT):

> Applied, thanks Christoph.

Sorry, the extra code has to be surrounded by

#ifdef CONFIG_PPP_MULTILINK
...
#endif

I will submit an updated patch ASAP.


Best regards,

Christoph Schulz

