From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 31 Oct 2008 13:06:05 +0000
Subject: Re:  Banyan Vines
Message-Id: <18699.701.972121.302773@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <W9913123352266171225199214@webmail4>
In-Reply-To: <W9913123352266171225199214@webmail4>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

tony.chamberlain@lemko.com writes:
> Especially since the VPN had been working (with mmpe or is it mppe?) for
> 6 or 7 months.
> 
> Could it be hackers?

Possible, but unlikely.  They'd have to be faking the PPTP headers but
then falling down on the encryption portion.  Why bother?  It's not
even disruptive, let alone a serious threat, and there are obviously
much better things in the world to attack.  Even sending out random
TCP RST packets to snipe away connections is a worse thing to do, and
it's far simpler.

My money would be split on two bets: a bug in MPPE or a high
underlying packet loss/reordering rate.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
