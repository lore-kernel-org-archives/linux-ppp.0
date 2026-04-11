Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976B62D97BB
	for <linux-ppp@vger.kernel.org>; Sat, 11 Apr 2026 03:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775879815; cv=none; b=W+MxddVq2TFeDvLsQULt/lSgeGvREGygRyrlcTCngeKQlyIeKlzQjIrof1MQO53pMpu+/mN0WFPiKAI6rZiagY+WcIAHtBrdhO0Rq1CYUL4pU4rT0rY2RuJ+yltOIH7wH+pU0elU4RGfzYXKIdskZj4Q9XjuS1Ry324y6fCANdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775879815; c=relaxed/simple;
	bh=gY9BX8ndo1Au+FLkia0CIopO9z3f3s85O6n/lIdCgn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E07rL3qT04dzRRduNOqSrOLVG7uXZ0F5JQNtuHg1TYby3a+UjmqctgWlwseRmlfDSA3YdlhEJLDYxzgveDC4h34n7Qpc+9LUFGpAXLgZaaFFJdfodv5wlhUulRue3Vr/+6/8UJTOf0g3RNcbVpCK1eaPrSz1w+eew3HLYGbdgIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GfUBydho; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GfUBydho"
Message-ID: <717da5ac-a020-4710-8ebb-6ed9d6e48bf4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775879801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kdhw0jGWtJDqj6BYFvHj/GHFWDSmVSSZj7ntCKNRU8Q=;
	b=GfUBydhoGNgk4jsdYDiiN1CvIryl7zksbqLZP+kFxJN62lJuOoNkn5CSx2+1g1EncpWFAz
	b19sl/XeVRI2TOzZLPjEbyDhNDaa41rcws8gzNjl40x5P5tqVYIBcXoHwpNdQMBfhkYtww
	Qsc5x6dMb9wCwNdd/h5mQh1F8dvL/Zk=
Date: Sat, 11 Apr 2026 11:56:30 +0800
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net v4 1/2] flow_dissector: do not dissect PPPoE PFC
 frames
To: Simon Horman <horms@kernel.org>
Cc: linux-ppp@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Guillaume Nault <gnault@redhat.com>,
 Wojciech Drewek <wojciech.drewek@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
 Jaco Kroon <jaco@uls.co.za>, James Carlson <carlsonj@workingcode.com>,
 Marcin Szycik <marcin.szycik@linux.intel.com>
References: <20260410033627.93786-1-qingfang.deng@linux.dev>
 <20260410171056.GD469338@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <20260410171056.GD469338@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,

On 4/11/2026 1:10 AM, Simon Horman wrote:
> On Fri, Apr 10, 2026 at 11:36:20AM +0800, Qingfang Deng wrote:
>> @@ -1361,7 +1376,7 @@ bool __skb_flow_dissect(const struct net *net,
>>   			struct pppoe_hdr hdr;
>>   			__be16 proto;
>>   		} *hdr, _hdr;
>> -		u16 ppp_proto;
>> +		__be16 ppp_proto;
> 
> I'm unclear of the relationship between changing the type of ppp_proto
> and the problem described in the patch description. And it
> is creating a log of churn in this patch. I suggest dropping it.

The intention is to restore the original behavior before the blamed 
commit. If you find it too verbose for a fix, I can drop it and then 
repost that part later to net-next.

>> @@ -1374,27 +1389,19 @@ bool __skb_flow_dissect(const struct net *net,
>>   			break;
>>   		}
>>   
>> -		/* least significant bit of the most significant octet
>> -		 * indicates if protocol field was compressed
>> -		 */
>> -		ppp_proto = ntohs(hdr->proto);
>> -		if (ppp_proto & 0x0100) {
>> -			ppp_proto = ppp_proto >> 8;
>> -			nhoff += PPPOE_SES_HLEN - 1;
>> -		} else {
>> -			nhoff += PPPOE_SES_HLEN;
>> -		}
> 
> Could we go for something like this?
> 
> 		ppp_proto = ntohs(hdr->proto);
> 		nhoff += PPPOE_SES_HLEN;
> 
> 		/* Explanation of what is going on */
> 		if (ppp_proto & 0x0100)
> 			ppp_proto = some invalid value like 0
>

I think it is redundant. ppp_proto_is_valid() already requires 
uncompressed frames.

>> +		ppp_proto = hdr->proto;
>> +		nhoff += PPPOE_SES_HLEN;
>>   
>> -		if (ppp_proto == PPP_IP) {
>> +		if (ppp_proto == htons(PPP_IP)) {
>>   			proto = htons(ETH_P_IP);
>>   			fdret = FLOW_DISSECT_RET_PROTO_AGAIN;
>> -		} else if (ppp_proto == PPP_IPV6) {
>> +		} else if (ppp_proto == htons(PPP_IPV6)) {
>>   			proto = htons(ETH_P_IPV6);
>>   			fdret = FLOW_DISSECT_RET_PROTO_AGAIN;
>> -		} else if (ppp_proto == PPP_MPLS_UC) {
>> +		} else if (ppp_proto == htons(PPP_MPLS_UC)) {
>>   			proto = htons(ETH_P_MPLS_UC);
>>   			fdret = FLOW_DISSECT_RET_PROTO_AGAIN;
>> -		} else if (ppp_proto == PPP_MPLS_MC) {
>> +		} else if (ppp_proto == htons(PPP_MPLS_MC)) {
>>   			proto = htons(ETH_P_MPLS_MC);
>>   			fdret = FLOW_DISSECT_RET_PROTO_AGAIN;
>>   		} else if (ppp_proto_is_valid(ppp_proto)) {
