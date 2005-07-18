From: Cristi Mitrana <cristi.mitrana@gmail.com>
Date: Mon, 18 Jul 2005 13:36:34 +0000
Subject: Re: Linux Greatest Feature
Message-Id: <f1de940b05071806368720815@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <dbfm3g$h6$1@sea.gmane.org>
In-Reply-To: <dbfm3g$h6$1@sea.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

 hello, 

> Under Linux this doesn't happen. I get disconnected, and I have to wait
> for the sockets to TIMEOUT. So I end up with Psi spewing things into a
> blackhole, and Thunderbird flat out screws up and can barely function.
> 
> A long while back I made a post about this to the Linux PPP mailing
> list. The reason that was laid out is that sockets and the devices are
> in seperate layers so a socket doesn't know what device it is on. That's
> nice if you have an ethernet cable powering a static IP, and you like to
> unplug it just for shits. It's not so nice when you're on a dynamic IP
> and well, those connections just don't make any sense anymore.
>

 The behaviour you describe I see it as an advantage, it keeps your
connection 'up' even if the link goes down, say ppp disconects
accidentally and you have not finished transfering you files, ppp
connects and the link is up again, so the transfer continues without
interruption. This is ok for TCP/IP  connections, for some other this
might not be the case.
  The timeouts for the link to announce itself as 'down' can be
customized with the '/proc' (sysctl) interface, so you can customize
it. The linux kernel has by default a bigger timeout than MS Windows'
kernel/net stack so that's why you perceive the difference more
easily.

hth,
 mitu
