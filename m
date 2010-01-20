From: James Cameron <quozl@laptop.org>
Date: Wed, 20 Jan 2010 05:43:24 +0000
Subject: Re: pppd hangs on SIGHUP
Message-Id: <20100120054324.GL32704@us.netrek.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <8D.DA.01403.892965B4@cdptpa-omtalb.mail.rr.com>
In-Reply-To: <8D.DA.01403.892965B4@cdptpa-omtalb.mail.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Sounds normal.  What do you have set for parameters holdoff and maxfail?
Perhaps you need non-default values.  Ten is the default on my Debian
system for maxfail, which means your method would work ten times.

-- 
James Cameron
http://quozl.linux.org.au/
