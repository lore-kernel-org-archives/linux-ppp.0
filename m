From: walter harms <wharms@bfs.de>
Date: Sat, 02 Feb 2013 09:49:34 +0000
Subject: Re: [PATCH] ppp: ignore unrecognised radiusclient configuration directives
Message-Id: <510CE12E.1020900@bfs.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.64.1208301919580.27411@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.64.1208301919580.27411@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Normaly paul takes care of patches:

paulus@samba.org


re,
 wh

Am 01.02.2013 20:35, schrieb Charlie Brady:
> 
> Is anyone maintaining linux ppp? 2nd repost of this patch.
> 
> On Fri, 23 Nov 2012, Charlie Brady wrote:
> 
>>
>> Paul, did you just miss this, or are you waiting for some more 
>> information? Or do we need David Skoll's input?
>>
>> This is relevant for RHEL6, BTW, where default freeradiusclient 
>> configuration includes new 'bindaddr' keyword.
>>
>> On Thu, 30 Aug 2012, Charlie Brady wrote:
>>
>>> New versions of freeradius occasionally add configuration keywords. 
>>> There's no reason that the pppd plugin should fail when that occurs.
>>>
>>> Signed-off-by:  Charlie Brady <charlieb@budge.apana.org.au>
>>>
>>> --- ppp-2.4.5.rhel6/pppd/plugins/radius/config.c        2009-11-16 17:26:07.000000000 -0500
>>> +++ ppp-2.4.5/pppd/plugins/radius/config.c      2012-08-30 16:59:19.911025000 -0400
>>> @@ -216,8 +216,8 @@
>>>                 p[pos] = '\0';
>>>  
>>>                 if ((option = find_option(p, OT_ANY)) = NULL) {
>>> -                       error("%s: line %d: unrecognized keyword: %s", filename, line, p);
>>> -                       return (-1);
>>> +                       warn("%s: line %d: unrecognized keyword: %s", filename, line, p);
>>> +                       continue;
>>>                 }
>>>  
>>>                 if (option->status != ST_UNDEF) {
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
