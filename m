From: James Chapman <jchapman@katalix.com>
Date: Fri, 12 Feb 2010 08:04:41 +0000
Subject: Re: Control pppd behaviour
Message-Id: <4B750B99.6030807@katalix.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <27543592.post@talk.nabble.com>
In-Reply-To: <27543592.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Ashmath Khan wrote:
> Thanks James.
> 
> Here is the current options file for our pppd.
> plugin pppoe.so eth1
> nodetach
> nodefaultroute
> persist
> maxfail 0
> noauth
> user ashmat
> nopcomp
> lcp-max-failure 5
> lcp-max-configure 10
> lcp-max-terminate 2
> lcp-restart 3
> lcp-echo-failure 3
> lcp-echo-interval 10
> mru 1492
> usepeerdns
> linkname 2
> unit 2
> 
> I do see the nodetach option. I have to understand this from my
> colleagues why its not running as daemon.

You probably do a fork and exec to run pppd so that your app can catch
pppd exiting.

> So I think setting maxfail to 1 should do the trick i.e, pppd should
> exit immediately after a failed connection attempt. Will pppd exit if
> lcp echo timesout as well ?

As you're using persist, your app wants pppd to do the retries. Have you
considered changing your app to respawn pppd when it fails? i.e. remove
the persist and maxfail options. That way, you could implement the
exponential backoff retry algorithm in your app rather than in pppd.

Maybe pppd needs a new option to enable exponential backoff of retries
when persist is enabled?

> 
> On Thu, Feb 11, 2010 at 11:14 PM, James Carlson
> <carlsonj@workingcode.com> wrote:
>> Ashmath Khan wrote:
>>> Thanks James.
>>>
>>> I do understand the daemon part. We do run the pppd as daemon that is
>>> in the background, we don't run from terminal but an application runs
>>> this. And able to catch exit codes as well !
>> The controlling terminal in that case is the one (if any) that's
>> inherited from your application.
>>
>>> But pppd doesn't exit if say authetication fails, instead it will retry.
>> Then I think you've got it misconfigured.  pppd doesn't do that by default.
>>
>> If you see otherwise, then please post complete debug logs along with
>> all of your configuration settings.
>>
>>> I did have a look at maxfail:
>>> maxfail n
>>>     Terminate after n consecutive failed connection attempts. A value
>>> of 0 means no limit. The default value is 10.
>>>
>>> I wanted to have 0 retries. Is there a way ?
>> Using 1 would do what you want.
>>
>> But that parameter has no meaning if you've configured pppd correctly
>> for your situation.  "maxfail" does something if you're using "persist"
>> or "demand."  It doesn't do anything otherwise.
>>
>> You shouldn't have to touch that.
>>
>> --
>> James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
>>
>>


-- 
James Chapman
Katalix Systems Ltd
http://www.katalix.com
Catalysts for your Embedded Linux software development

