From: Bill Unruh <unruh@physics.ubc.ca>
Date: Sun, 13 Sep 2009 02:23:13 +0000
Subject: Re: Calling-Station-Id
Message-Id: <Pine.LNX.4.64.0909121918330.6827@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <4AA572CF.8070900@watchuktv.co.uk>
In-Reply-To: <4AA572CF.8070900@watchuktv.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Sat, 12 Sep 2009, Neville wrote:

> Anyone, please.
>
> Thx
> Nev
> ----- Original Message ----- From: "Nev" <nev@watchuktv.co.uk>
> To: <linux-ppp@vger.kernel.org>
> Sent: Monday, September 07, 2009 9:53 PM
> Subject: Calling-Station-Id
>
>
>>  This is my very first post, so apologies if I'm posting to the wrong list.
>>
>>  OS CentOS 5.3
>>  Kernel 2.6.18-128
>>
>>  My setup is PPTP client >> INTERNET >> pptpd (1.3.4) / PPP (2.4.4.-2) /
>>  Radius (2.1.6)
>>
>>  in /etc/pptpd I have noipparam commented in order that the client's IP
>>  address is pass to PPP
>>
>>  in /var/log/messages the clients ip is passed
>>
>>  Sep  7 21:41:32 vpn1 pppd[9945]: ipparam 78.8X.18X.XX           # (from
>>  command line)

man pppd

ipparam string
               Provides  an  extra parameter to the ip-up, ip-pre-up and
               ip-down scripts.  If this option  is  given,  the  string
               supplied  is given as the 6th parameter to those scripts.


pppd does NOT do anything withit. It is up to your scripts to do something with
it. pppd certainly does not send it on  to the other end.

But why do you care? ppp is peer to peer . It does not use ip addresses. And
usually your address is given by the remote side since it is what has to
forward the packets to you, and you simply dump the packets onto the line--
there is no routing.

Note also that that line in the logs is NOT passing anything. It simply states
that pppd has received that parameter from the command line. It does not say
it has done anything with it.


>>
>>  But what ends in Radius is Calling-Station-Id = "8.87" and not the FULL
>>  IP.
>>
>>  I searched google and I can see alot of people have had this problem, but
>>  I've not be able to find a fix.
>>
>>  Thx
>>  Nev
>>
>>  --
>>  To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
>>  the body of a message to majordomo@vger.kernel.org
>>  More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> 
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
