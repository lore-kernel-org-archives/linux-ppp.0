From: Bill Unruh <unruh@physics.ubc.ca>
Date: Thu, 28 Oct 2004 16:10:40 +0000
Subject: Re: ppp 2.4.3 cvs authentication issue
Message-Id: <Pine.LNX.4.58.0410280908350.1553@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <20041028124517.7204.qmail@web25210.mail.ukl.yahoo.com>
In-Reply-To: <20041028124517.7204.qmail@web25210.mail.ukl.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, 28 Oct 2004, a b wrote:

> Hi again,
> 
> You were right: I was missing the "user" option ... it
> works now with mschap-v2, thank you ... but, next step
> is to use mppe, of course:

Why would you want to use mppe? Now you want to put a semitrailer air
deflector on top of your ferrari.
The only reason mppe should be in pppd is because of stupid MS machines
which demand it. 
