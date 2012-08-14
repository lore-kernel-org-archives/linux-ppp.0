From: Charlie Brady <charlieb-linux-ppp@budge.apana.org.au>
Date: Tue, 14 Aug 2012 14:01:27 +0000
Subject: Re: Using pppd as a library
Message-Id: <Pine.LNX.4.64.1208140958450.26223@e-smith.charlieb.ott.istop.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <502A3A31.2050106@ibtechnology.com>
In-Reply-To: <502A3A31.2050106@ibtechnology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


On Tue, 14 Aug 2012, neha chatrath wrote:

> Hello,
> 
> I have system requirement in which I need to invoke pppd from a user
> application. This user application needs to do configuration, get status etc
> of the PPP links.
> Well there are various ways of doing it, I am exploring the option of
> including pppd as a library in my build. With this,
> -I can spawn my application as a thread.
> -I can avoid  use of fork and exec operations for executing pppd for different
> links.

Why do you want to avoid such useful constructs? I suggest you google for 
"make a rod for your own back".

> Can somebody help me with this. Is there any pppd library already available?
> 
> Thanks and regards
> Neha Chatrath

Really, the following is true?

> Disclaimer : This email communication may contain privileged and 
> confidential information and is intended for the use of the addressee 
> only.

Total bullcrap...

> If you are not an intended recipient you are
> requested not to reproduce,copy
> disseminate or in any manner distribute this email communication as the same
> is strictly prohibited. If
> you have received this email in error, Please notify the sender immediately by
> return e-mail and delete
> the communication sent in error.Email communications cannot be guaranteed to
> be secure & error free
> and INDIABULLS is not liable for any errors in the email communication or for
> the proper, timely and
> complete transmission thereof.
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
