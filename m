From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 12 Oct 2010 15:18:33 +0000
Subject: Re: Using PPPD pty option and script: controlling stdin buffer size?
Message-Id: <4CB47C49.2090401@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <291B2C7721AC7B49AD11449A2883992E2E0DF561DB@SINTEFEXMBX01.sintef.no>
In-Reply-To: <291B2C7721AC7B49AD11449A2883992E2E0DF561DB@SINTEFEXMBX01.sintef.no>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Arne Lie wrote:
> Walter,
> 
> thanks, this could be the trick yes, we will have a look at that one!
> 
> /Arne
> 
>> -----Original Message-----
>> From: walter harms [mailto:wharms@bfs.de]
>> Sent: 12. oktober 2010 16:31
>> To: Arne Lie
>> Cc: ppp Linux
>> Subject: Re: Using PPPD pty option and script: controlling stdin buffer
>> size?
>>
>> I am not sure if i understand you correctly,
>> but can change the bufferhandling of stdio by setting the buffer size
>> using setbuf() (man 3 setbuf)

That only does something if you're reading through the stdio functions
(e.g., fread(3C)), and not through the recommended section low-level
read(2) function.  Using stdio to read/write from the master side of a
pty pair would be ... odd.

If you're seeing unwanted buffering here, I think you'll need to modify
either the kernel's pty subsystem or the PPP line discipline that it's
using.

I wouldn't recommend doing this, though.  Buffering is generally a good
thing.  If your application doesn't do sufficient congestion control to
avoid getting unacceptably stuck behind a long queue in the middle of
the network, then I'd call that a bug in the application, rather than a
problem with the network interface.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
