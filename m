From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 11 Feb 2010 17:44:09 +0000
Subject: Re: Control pppd behaviour
Message-Id: <4B7441E9.9020203@workingcode.com>
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
> I do understand the daemon part. We do run the pppd as daemon that is
> in the background, we don't run from terminal but an application runs
> this. And able to catch exit codes as well !

The controlling terminal in that case is the one (if any) that's
inherited from your application.

> But pppd doesn't exit if say authetication fails, instead it will retry.

Then I think you've got it misconfigured.  pppd doesn't do that by default.

If you see otherwise, then please post complete debug logs along with
all of your configuration settings.

> I did have a look at maxfail:
> maxfail n
>     Terminate after n consecutive failed connection attempts. A value
> of 0 means no limit. The default value is 10.
> 
> I wanted to have 0 retries. Is there a way ?

Using 1 would do what you want.

But that parameter has no meaning if you've configured pppd correctly
for your situation.  "maxfail" does something if you're using "persist"
or "demand."  It doesn't do anything otherwise.

You shouldn't have to touch that.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>

