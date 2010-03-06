From: walter harms <wharms@bfs.de>
Date: Sat, 06 Mar 2010 11:33:21 +0000
Subject: Re: wrong return code in pppd 2.4.5
Message-Id: <4B923D81.6030201@bfs.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <4B73C880.2040100@bfs.de>
In-Reply-To: <4B73C880.2040100@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



Paul Mackerras schrieb:
> On Thu, Feb 11, 2010 at 10:06:08AM +0100, walter harms wrote:
>> I found this bug in ppp 2.4.5 (Source:ftp://ftp.samba.org/pub/ppp/ppp-2.4.5.tar.gz).
>>
>> After idle the pppd should return with 12 (idle timeout) but does
>> return with 16 (hang up).
>> (see log below)
>>
>> Is this a known problem ? Is there a patch available ?
>>
>> re,
>>  wh
>>
>>
>>
>> /var/log/messages:
>>
>> ....
>> Feb 10 11:02:51 mws3-94700737 daemon.notice pppd[1716]: Terminating connection due to lack of activity.
>> Feb 10 11:02:51 mws3-94700737 daemon.info pppd[1716]: Connect time 1.4 minutes.
>> Feb 10 11:02:51 mws3-94700737 daemon.info pppd[1716]: Sent 3090 bytes, received 3869 bytes.
>> Feb 10 11:02:51 mws3-94700737 daemon.debug pppd[1716]: Script /etc/ppp/ip-down started (pid 1751)
>> Feb 10 11:02:51 mws3-94700737 daemon.debug pppd[1716]: sent [LCP TermReq id=0x2 "Link inactive"]
>> Feb 10 11:02:51 mws3-94700737 daemon.debug pppd[1716]: Script /etc/ppp/ip-down finished (pid 1751), status = 0x0
>> Feb 10 11:02:54 mws3-94700737 daemon.debug pppd[1716]: sent [LCP TermReq id=0x3 "Link inactive"]
>> Feb 10 11:02:57 mws3-94700737 daemon.notice pppd[1716]: Connection terminated.
>> Feb 10 11:02:58 mws3-94700737 daemon.notice pppd[1716]: Modem hangup
>> Feb 10 11:02:58 mws3-94700737 daemon.info pppd[1716]: Exit.
>> Feb 10 11:02:58 mws3-94700737 user.notice root: pppd terminated with: 16
> 
> Is this talking to a modem attached to a real serial port?  I'm
> wondering what might have caused pppd to see a hangup from the modem.
> 
> In any case, I suppose pppd should ignore hangups once we've decided
> to terminate the link from our end.  Patches welcome. :)
> 

I took a look into the code but i did not find WHY this is happening.
Since 2.4.4 returned the correct value someone familar with the changes should
find it more easy.
An yes the modem is connected to the serial port, nothing special. if a patch is
available i can test it.

re,
 wh





