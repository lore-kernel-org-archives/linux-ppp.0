From: Bill Unruh <unruh@physics.ubc.ca>
Date: Thu, 28 Oct 2004 16:07:59 +0000
Subject: Re: ppp 2.4.3 cvs authentication issue
Message-Id: <Pine.LNX.4.58.0410280905280.1553@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <20041028124517.7204.qmail@web25210.mail.ukl.yahoo.com>
In-Reply-To: <20041028124517.7204.qmail@web25210.mail.ukl.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

> 
> server:
> 
> logfile /tmp/vpn.log
> dump
> debug
> auth
> refuse-pap
> refuse-eap
> refuse-chap
> refuse-mschap
> require-mschap-v2

Again, why mschap? Get rid ofall the refuse lines. ALL of them. Put in
one line
require-chap

You seem to be under the impression that anything with bigger numbers or
a longer name is better. It is not. 

> peer refused to authenticate: terminating link

AGain I think you forgot the user option on the client.


