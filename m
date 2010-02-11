From: walter harms <wharms@bfs.de>
Date: Thu, 11 Feb 2010 09:03:01 +0000
Subject: Re: Control pppd behaviour
Message-Id: <4B73C7C5.2050603@bfs.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <27543592.post@talk.nabble.com>
In-Reply-To: <27543592.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



Hashmat Khan schrieb:
> Hello,
> 
> I understand that pppd uses parameters from different files such as those
> located in /etc/ppp directory to control its behaviours on failures etc.
> 
> I wanted to know if its possible to say for example implement a different
> retry algorithm(user defined). Is this possible without modifying code ?
> 


What do you try "to retry" ? when one provider is down you can easy switch to others.
like this (not working) example:

#!/bin/sh
for PROV in prov1 prov2 prov2
do
	pppd call $PROV
	if [ everythink_works ]
		exit 0
done

exit 1


re,
 wh




