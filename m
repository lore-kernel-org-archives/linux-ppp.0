From: =?ISO-8859-1?Q?Timo_Ter=E4s?= <ext-timo.teras@nokia.com>
Date: Mon, 18 Apr 2005 13:34:09 +0000
Subject: Re: Detecting end of GSM datacall
Message-Id: <4263B751.80907@nokia.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <426384B8.6050809@nokia.com>
In-Reply-To: <426384B8.6050809@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

ext Steve Drew wrote:
> 	I've had a similar issue with the Nokia mobiles I've been using, the workaround I've used is to put
> 
> lcp-echo-interval 4
> lcp-echo-failure 2
> 
> into the my /etc/ppp/options file.

Yes, this goes as a work around if the remote server supports lcp-echo. 
It also adds slight delay to the detection of the link going down. But 
I'd really like to have a proper fix for this. Any suggestions how to do 
that?

Is my only change to modify ppp_async_input() to detect this 'NO 
CARRIER' sequence and have it generate a LCP termination packet? Or is 
there some function that can be called to terminate the PPP link? Would 
this kind of solution be accepted the official kernel tree?

Cheers,
   Timo
