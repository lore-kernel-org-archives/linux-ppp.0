From: Bill Unruh <unruh@physics.ubc.ca>
Date: Fri, 30 Oct 2009 16:49:27 +0000
Subject: Re: pppd & ntpd
Message-Id: <Pine.LNX.4.64.0910300945310.12261@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <4AEAFDE0.2060600@bfs.de>
In-Reply-To: <4AEAFDE0.2060600@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Fri, 30 Oct 2009, walter harms wrote:

> Hi list,
> the question is a bit of topic, but
> has someone a dial-in server with ntpd running ?
> we have noticed that  'ntpd 4.2.4p6' seems
> to have problems accepting connections from ppp0.
>

Lets understand your problem a bit better. You have a machine which is
connected to the net via ppp. That machine is listed as an ntp server on
another machine. That other machine is having trouble syncing to this machine.

What evidence do you have that the the problem is "accepting connections"?
Do you have a tcpdump which shows that the ntp  packets are being dropped by
the server (ie not being processed ) (up the poll interval to 4 on the outside
machine so you can see the packets over a reasonable period of time)


> i "fixed" the problem with a kill -1 in ip-up.

I have no idea how a kill -1 ( of what?) would fix anything.

>
> did someone see such problem before ?
>
> re,
> wh
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
