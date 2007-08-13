From: Joe Perches <joe@perches.com>
Date: Mon, 13 Aug 2007 15:35:25 +0000
Subject: Re: [PATCH] [384/2many] MAINTAINERS - PPP PROTOCOL DRIVERS AND
Message-Id: <1187019325.10249.74.camel@localhost>
List-Id: <linux-ppp.vger.kernel.org>
References: <46bffb62.YUHsMJB9NIlhwots%joe@perches.com>
	 <18112.9870.744182.247752@cargo.ozlabs.ibm.com>
In-Reply-To: <18112.9870.744182.247752@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Mackerras <paulus@samba.org>
Cc: torvalds@linux-foundation.org, linux-ppp@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org

On Mon, 2007-08-13 at 19:38 +1000, Paul Mackerras wrote:
> Except for drivers/net/ppp_synctty.c.

It seems poor form to have 5 file entries where 1 would do.

Would renaming this one file to pppsynctty.c work?

