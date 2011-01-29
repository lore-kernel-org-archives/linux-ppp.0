From: Juergen Beisert <juergen127@kreuzholzen.de>
Date: Sat, 29 Jan 2011 13:13:41 +0000
Subject: Re: DSL link sometimes dies: pppd or kernel problem?
Message-Id: <201101291413.41631.juergen127@kreuzholzen.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <201101281649.51225.juergen127@kreuzholzen.de>
In-Reply-To: <201101281649.51225.juergen127@kreuzholzen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

terry white wrote:
> ... ciao:
> : on "1-28-2011" "Juergen Beisert" writ:
> :
> : Jan 28 16:05:21 star pppd[249]: Starting link
> : Jan 28 16:05:21 star pppd[249]: error sending pppoe packet: Network is
> : down
>
>     "Network is down" seems to make more sense than anything on your end.
>
>     i moved to a higher speed, and new modem from qwest.net.  i had
> originally purchased a non wireless modem, but received a wireless device
> anyway.  i fought that through two (2) different modems of the same
> model, and finally got the modem i'd originally wanted to buy.
>     during that process, i was running a cron at 1 minute intervals to
> chech, and log errors, and those results were substantial.  with the
> final device, the cron has switched to 5 minutes, with few events being
> handled.
>
>     the long and short of it, from experience, sometimes, it really is
> their fault ...

So, the "Network is down" means something fails at the provider's side? But 
why it is up and running again when I just restart the pppd? This log is from 
the pppd-2.4.5.
Running the pppd-2.4.4 a message like the "Modem hangup" terminates the pppd, 
nothing else. Also in this case I just start the pppd again and everything is 
working again. I'm confused. 

jbe
