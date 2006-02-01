From: James Cameron <james.cameron@hp.com>
Date: Wed, 01 Feb 2006 23:13:07 +0000
Subject: Re: Hot to perform a null login?
Message-Id: <20060201231307.GB4191@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1138770376.8869.17.camel@localhost.localdomain>
In-Reply-To: <1138770376.8869.17.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

It might be possible to test without changing code if you add the
usehostname option and set the system hostname to a null string.

I'd tried this on my test system, got an error from the hostname
command, and presumed it wouldn't accept a null string.  After I'd sent
the previous mail, I found some things were no longer working, so I
checked and the change had taken effect, "hostname" by itself gave a
blank line.

So at the risk of breaking stuff that relies on a valid hostname, give
it a try.

-- 
James Cameron
http://ftp.hp.com.au/sigs/jc/
