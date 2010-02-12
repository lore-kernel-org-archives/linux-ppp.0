From: Ashmath Khan <hashmat.email@gmail.com>
Date: Fri, 12 Feb 2010 02:24:29 +0000
Subject: Re: Control pppd behaviour
Message-Id: <b17c42311002111812u20b175bdm281392d69319db54@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <27543592.post@talk.nabble.com>
In-Reply-To: <27543592.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Thanks James.

Here is the current options file for our pppd.
plugin pppoe.so eth1
nodetach
nodefaultroute
persist
maxfail 0
noauth
user ashmat
nopcomp
lcp-max-failure 5
lcp-max-configure 10
lcp-max-terminate 2
lcp-restart 3
lcp-echo-failure 3
lcp-echo-interval 10
mru 1492
usepeerdns
linkname 2
unit 2

I do see the nodetach option. I have to understand this from my
colleagues why its not running as daemon.

So I think setting maxfail to 1 should do the trick i.e, pppd should
exit immediately after a failed connection attempt. Will pppd exit if
lcp echo timesout as well ?

On Thu, Feb 11, 2010 at 11:14 PM, James Carlson
<carlsonj@workingcode.com> wrote:
> Ashmath Khan wrote:
>> Thanks James.
>>
>> I do understand the daemon part. We do run the pppd as daemon that is
>> in the background, we don't run from terminal but an application runs
>> this. And able to catch exit codes as well !
>
> The controlling terminal in that case is the one (if any) that's
> inherited from your application.
>
>> But pppd doesn't exit if say authetication fails, instead it will retry.
>
> Then I think you've got it misconfigured. =A0pppd doesn't do that by defa=
ult.
>
> If you see otherwise, then please post complete debug logs along with
> all of your configuration settings.
>
>> I did have a look at maxfail:
>> maxfail n
>> =A0 =A0 Terminate after n consecutive failed connection attempts. A value
>> of 0 means no limit. The default value is 10.
>>
>> I wanted to have 0 retries. Is there a way ?
>
> Using 1 would do what you want.
>
> But that parameter has no meaning if you've configured pppd correctly
> for your situation. =A0"maxfail" does something if you're using "persist"
> or "demand." =A0It doesn't do anything otherwise.
>
> You shouldn't have to touch that.
>
> --
> James Carlson =A0 =A0 =A0 =A0 42.703N 71.076W =A0 =A0 =A0 =A0 <carlsonj@w=
orkingcode.com>
>
>
