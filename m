From: Bill Unruh <unruh@physics.ubc.ca>
Date: Thu, 24 Jun 2004 21:14:32 +0000
Subject: Re: restarting pppd
Message-Id: <Pine.LNX.4.50.0406241412550.23086-100000@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040624201058.23124.qmail@web50203.mail.yahoo.com>
In-Reply-To: <20040624201058.23124.qmail@web50203.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, 24 Jun 2004, Jaspreet Singh wrote:

> Hi,
> If I am not using mgetty then is there a way to
> restart pppd after a connection has been established
> and terminated?

Why are you not using mgetty? mgetty is THE way of answering a modem--
or do you mean that you are not using a modem? 
You could always start up pppd in /etc/inittab with the passive option
if you really wanted to, and if you have a direct connection between the
two machines. In any other case, pls use mgetty.
