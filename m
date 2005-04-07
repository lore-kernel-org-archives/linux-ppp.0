From: Bill Unruh <unruh@physics.ubc.ca>
Date: Thu, 07 Apr 2005 16:42:09 +0000
Subject: Re: Help
Message-Id: <Pine.LNX.4.61.0504070940090.22269@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <16981.24544.943856.326880@gargle.gargle.HOWL>
In-Reply-To: <16981.24544.943856.326880@gargle.gargle.HOWL>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Not sure what you mean. Each client must come in over their own link-- eg
you need a phone line and modem for each client (assuming they ae coming in
over phone lines). You cannot use one modem for 10 people at once.
Each link has one ppp session running it. You can have as many ppp sessions
running as you wish, one pppd for each session. 
I do not know what the limit is, probably memory.


On Thu, 7 Apr 2005, Kumar wrote:

> Hi,
>
>
> I have to run linux pppd as a server and need to support many ppp
> clients. I'm currently using linux pppd-2.4.2.
>
> Would you please tell me if the linux ppp has support for multi
> channels? If so, by default how many links it supports?
>
> If we have to increase the support for more connections, what needs to
> be done both in pppd and in kernel ppp?
>
>
> I'll appreciate any help or pointers in this regard.
>
> Thanks in advance.
>
>
> Regards,
>
> Kumar
>
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
