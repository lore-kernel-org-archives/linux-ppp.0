From: James Cameron <james.cameron@hp.com>
Date: Mon, 07 Nov 2005 22:37:07 +0000
Subject: Re: linux ppp problem
Message-Id: <20051107223707.GA4300@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200511070400.34908.wt@penguintechs.com>
In-Reply-To: <200511070400.34908.wt@penguintechs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I've also seen something like this on 2.6.13.4 using a CDMA modem on
/dev/ttyACM0.  I'm not sure what caused the event cascade, but I suspect
it was a provider network disconnection.  /dev/ttyACM0 becomes useless
after this happens.  Reconnecting the modem causes it to show up as
/dev/ttyACM1, which responds as normal.  ppp 2.4.3.

-- 
James Cameron
http://ftp.hp.com.au/sigs/jc/
