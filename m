From: Christoph Schulz <develop@kristov.de>
Date: Sun, 13 Jul 2014 16:07:35 +0000
Subject: Re: [PATCH net 1/1] net: ppp: fix creating PPP pass and active filters
Message-Id: <20140713180735.209671xd9qjsgmo7@berry.schulz.ip-v6.eu>
List-Id: <linux-ppp.vger.kernel.org>
References: <53C28297.4080507@kristov.de> <53C29DAA.8020405@gmail.com>
In-Reply-To: <53C29DAA.8020405@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Varka Bhadram <varkabhadram@gmail.com>
Cc: netdev@vger.kernel.org, linux-ppp@vger.kernel.org, paulus@samba.org, isdn@linux-pingi.de

Hello!

Varka Bhadram schrieb am Sun, 13 Jul 2014 20:24:34 +0530:

> checkpatch warnings on this patch

Yes, I know. But could you please give me a hint how to indent this  
properly such that it doesn't conflict with any formatting rules I  
possibly don't even know about?

+                        err = sk_unattached_filter_create(&is->pass_filter,
+                                                          &fprog);

Can I use

+                        err = sk_unattached_filter_create(
+                                &is->pass_filter, &fprog);

or similar? I do not want to rename variables to fit the line into 80  
characteres...


Regards,

Christoph Schulz

