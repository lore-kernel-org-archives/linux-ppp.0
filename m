From: Bill Unruh <unruh@physics.ubc.ca>
Date: Tue, 06 Jan 2004 19:34:28 +0000
Subject: Re: LCP terminated by peer
Message-Id: <Pine.LNX.4.50.0401061131120.26940-100000@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <3FFB1210.2080606@swissinfo.org>
In-Reply-To: <3FFB1210.2080606@swissinfo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, 6 Jan 2004, Sebastien Hugues wrote:

> Hi,
> 
> I want a GPRS connection throught bluetooth and my Nokia 3650 but it 
> doesn't

Put in noccp into the ppp/options file, and set up your pap-secrets file
properly and use the 
user username
where username is your name on the remote ppp host and in the
pap-secrets file.

> sent [LCP ConfRej id=0x0 <auth pap>]

You reject pap. why?

> sent [CCP ConfReq id=0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]

You ask for compressions that noone but a linux box would be able to
use. Why?
> my ppp options:
> noauth
> local
> notty
> defaultroute
> nodetach
> nocrtscts

why do you have no hardware flow control?

> noipdefault
> debug
> 
> Any ideas ? Thanks a lot..
> 
> Regards
> Seb
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
