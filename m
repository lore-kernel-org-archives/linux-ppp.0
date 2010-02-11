From: Charlie Brady <charlieb-ppp@budge.apana.org.au>
Date: Thu, 11 Feb 2010 17:52:23 +0000
Subject: Re: Control pppd behaviour
Message-Id: <Pine.LNX.4.64.1002111250030.18550@e-smith.charlieb.ott.istop.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <27543592.post@talk.nabble.com>
In-Reply-To: <27543592.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


On Thu, 11 Feb 2010, Ashmath Khan wrote:

> But pppd doesn't exit if say authetication fails, instead it will retry.

Really? Do you have evidence for that? Why would pppd retry if 
authentication fails - the authentication is unlikely to succeed when 
retried.

> I did have a look at maxfail:
> maxfail n
>    Terminate after n consecutive failed connection attempts. A value
> of 0 means no limit. The default value is 10.
>
> I wanted to have 0 retries. Is there a way ?

"maxfail 1" will not retry ("terminate after 1 failed connection attempt").

