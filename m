From: Paul Mackerras <paulus@samba.org>
Date: Sat, 19 Jul 2008 10:05:33 +0000
Subject: Re: PPP difficulties regarding connection establishment and bogus
Message-Id: <18561.48237.974778.266982@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <66abdca00806060145ua700d3cydeb3e37df39b94f8@mail.gmail.com>
In-Reply-To: <66abdca00806060145ua700d3cydeb3e37df39b94f8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Paulius Zaleckas writes:

> Attached is patch I made for my GPRS modem with the same problem.

>      NAKCIDNS(CI_MS_DNS1, req_dns1,
> -	     if (treat_as_reject) {
> -		 try.req_dns1 = 0;
> -	     } else {
>  		 try.dnsaddr[0] = cidnsaddr;
> -	     }
>  	     );
>  
>      NAKCIDNS(CI_MS_DNS2, req_dns2,
> -	     if (treat_as_reject) {
> -		 try.req_dns2 = 0;
> -	     } else {
>  		 try.dnsaddr[1] = cidnsaddr;
> -	     }
>  	     );

I don't understand why this would help.  Can you show me the log for a
successfull connection with this patch applied (using the debug
option)?

Paul.
