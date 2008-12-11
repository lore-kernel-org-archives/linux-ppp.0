From: GauloisID <David.Babin@dmic.fr>
Date: Thu, 11 Dec 2008 16:49:46 +0000
Subject: Re: PPP Recovery
Message-Id: <20959398.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20958060.post@talk.nabble.com>
In-Reply-To: <20958060.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Great! Thanks, that's exactly what i look for !


Gilles Espinasse wrote:
> 
> Selon GauloisID <David.Babin@dmic.fr>:
> 
>>
>> Hi all,
>>
>> I Would like to setup a permanent connection with a local rs232 GPRS
>> modem.
>> I Use kernel 2.6.24 and PPP 2.4.4.
>>
>> My connection work fine (DNS, ICMP...), but sometimes my GPRS provider
>> drop
>> my connection due to timeout, moving....
>>
>> Is there any way to tell ppp that sent packet (TCP/UDP) have
>> retransmission
>> timeout to indicate that the connection is dead ? In this case it would
>> be
>> easy to re-negociate the link.
>>
> That's achieved by lcp options you could activate when starting the
> connection
> (if the server support that, it usually should).
> After lcp traffic has been interrupted a time defined by the combination
> of lcp
> options values, ppp session goes down and if persist option has been used,
> pppd
> restart the connection.
> 
> 
> Gilles
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 

-- 
View this message in context: http://www.nabble.com/PPP-Recovery-tp20958060p20959398.html
Sent from the linux-ppp mailing list archive at Nabble.com.

