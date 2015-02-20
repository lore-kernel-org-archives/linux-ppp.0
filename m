From: Christoph Schulz <develop@kristov.de>
Date: Fri, 20 Feb 2015 13:25:39 +0000
Subject: Re: [PATCH] pppoe: Use workqueue to die properly when a PADT is received
Message-Id: <20150220142539.21186y3dd8fwgamr@berry.schulz.ip-v6.eu>
List-Id: <linux-ppp.vger.kernel.org>
References: <1424381068-22252-1-git-send-email-simon@farnz.org.uk>
 <3411251.Z29qxOyJF6@f19simon>
In-Reply-To: <3411251.Z29qxOyJF6@f19simon>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Farnsworth <simon@farnz.org.uk>
Cc: netdev@vger.kernel.org, Dan Williams <dcbw@redhat.com>, mostrows@gmail.com, linux-ppp@vger.kernel.org

(Cc: linux-ppp@vger.kernel.org, mostrows@gmail.com)

Hello!

Simon Farnsworth schrieb am Fri, 20 Feb 2015 11:17:26 +0000:

> Michal's e-mail as listed in MAINTAINERS is bouncing (he's listed as PPPoE
> maintainer).

I once had the same problem. I finally used mostrows@gmail.com, found  
elsewhere (see e.g. http://patchwork.ozlabs.org/patch/36932/).


Regards,
-- 
Christoph Schulz

