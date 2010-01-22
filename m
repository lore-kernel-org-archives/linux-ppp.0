From: James Cameron <quozl@laptop.org>
Date: Fri, 22 Jan 2010 02:13:09 +0000
Subject: Re: pppd hangs on SIGHUP
Message-Id: <20100122021309.GG9581@us.netrek.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <8D.DA.01403.892965B4@cdptpa-omtalb.mail.rr.com>
In-Reply-To: <8D.DA.01403.892965B4@cdptpa-omtalb.mail.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I must be looking at different source.  Ah, yes, I am.  You're using
Debian patched source, I guess.  Here's what I do to compile pppd with
debugging ...

git clone git://ozlabs.org/~paulus/ppp.git

... then ./configure and make ... and the -g flag is already used.  You
may be using source that has had debugging disabled.  Distribution
source often does this.

-- 
James Cameron
http://quozl.linux.org.au/
