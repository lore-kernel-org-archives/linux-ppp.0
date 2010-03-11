From: walter harms <wharms@bfs.de>
Date: Thu, 11 Mar 2010 16:04:17 +0000
Subject: Re: wrong return code in pppd 2.4.5
Message-Id: <4B991481.5010302@bfs.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <4B73C880.2040100@bfs.de>
In-Reply-To: <4B73C880.2040100@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



Paul Mackerras schrieb:
> On Sat, Mar 06, 2010 at 12:33:21PM +0100, walter harms wrote:
> 
>> I took a look into the code but i did not find WHY this is happening.
>> Since 2.4.4 returned the correct value someone familar with the changes should
>> find it more easy.
> 
> I don't see any changes between 2.4.4 and 2.4.5 that would affect
> this.  I suspect it's a race condition.
> 
>> An yes the modem is connected to the serial port, nothing special. if a patch is
>> available i can test it.
> 
> Try the below.
> 
> Paul.
> 
> diff --git a/pppd/main.c b/pppd/main.c
> index 014d614..4236050 100644
> --- a/pppd/main.c
> +++ b/pppd/main.c
> @@ -1041,7 +1041,8 @@ get_input()
>  	}
>  	notice("Modem hangup");
>  	hungup = 1;
> -	status = EXIT_HANGUP;
> +	if (!(phase = PHASE_TERMINATE || phase = PHASE_DISCONNECT))
> +	    status = EXIT_HANGUP;
>  	lcp_lowerdown(0);	/* serial link is no longer available */
>  	link_terminated(0);
>  	return;
> 

It seems that this did not help:

Terminating connection due to lack of activity.      <-------
Connect time 0.6 minutes.
Sent 137 bytes, received 185 bytes.
Script /etc/ppp/ip-down started (pid 918)
sent [LCP TermReq id=0x2 "Link inactive"]
Script /etc/ppp/ip-down finished (pid 918), status = 0x0
sent [LCP TermReq id=0x3 "Link inactive"]
Connection terminated.
Modem hangup
pppd return value 16                <-----


sorry for the delay we had serious phone problems, someone stole the cable (*twice*)

re,
 wh
