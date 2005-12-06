From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 06 Dec 2005 21:23:09 +0000
Subject: Re: Basic Question.
Message-Id: <17302.317.610974.597779@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <a2617ef40512061213v7823a29fr@mail.gmail.com>
In-Reply-To: <a2617ef40512061213v7823a29fr@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Clifford Kite writes:
> | I have two adsl Links and I would like to start adsl1 always in ppp0 
> |and the adsl2 always in the ppp1, otherwise  when I reboot and the
> |adsl1 fail to connect,  the adsl2 start in ppp0 and my
> |firewall rules screw up !
> 
> Man pppd, see whether the option "unit <num>" is what you want.

... or use the /etc/ppp/ip-up script interface to rewrite the firewall
rules on the fly.

(Agreed; there needs to be a better way to deal with this issue.)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
