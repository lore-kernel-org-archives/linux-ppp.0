From: Bill Unruh <unruh@physics.ubc.ca>
Date: Tue, 23 May 2006 16:01:10 +0000
Subject: DHCP failure on machine with ppp running.
Message-Id: <Pine.LNX.4.61.0605230857220.8368@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, 23 May 2006, JOBY THAMPAN wrote:

> Hi all,
>
> 	When I made DHCP Relay listening on a machine containing PPP
> Interface, the DHCP Relay is not recieving the offer packet from dhcp server

Sounds like your routing is messed up. I do not knw what you mean  in your
description of the problem however. Your machine contains both a ppp and an
eth0 interface? and you want it to set up dhcp on eth0? How do you go about
it?

Also please use subjects to your emails and do NOT use all capitals in your
name. both are typical of spam and your email almost certainly got tossed
out from almost everyone in this group as spam.

>
> 	But when I made DHCP Relay listening on ethernet interface on a
> different machine other than the machine containing PPP Interface DHCP Offer
> Successfully recieved.
>
> 	If somebody knows, Please explain why this is so???
>
> Rgds
> joby
>
>
> ---------------------------------------------------------------------------
>       "This e-mail and any files transmitted with it are for the sole use
> of the intended recipient(s) and may contain confidential and privileged
> information. If you are not the intended recipient, please contact the
> sender by reply e-mail and destroy all copies of the original message.
>
>       Any unauthorized review, use, disclosure, dissemination, forwarding,
> printing or copying of this email or any action taken upon this e-mail is
> strictly prohibited and may be unlawful."
> ---------------------------------------------------------------------------
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
