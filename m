From: Ashmath Khan <hashmat.email@gmail.com>
Date: Thu, 11 Feb 2010 14:51:22 +0000
Subject: Re: Control pppd behaviour
Message-Id: <b17c42311002110639p304f4711tbe287f0d82ac31a9@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <27543592.post@talk.nabble.com>
In-Reply-To: <27543592.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

James or others,

Is there a documentation explaining what each ppp option stands for
options file, I do understand some but others I want to know in detail
eg:
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
thanks


On Thu, Feb 11, 2010 at 7:19 PM, Ashmath Khan <hashmat.email@gmail.com> wro=
te:
> Ok.
> Its a requirement from my customer which I need to implement !
> My customer doesn't want normal retries but want this to be tried. As
> simple as that.
> In addtion:and after m retries, I would want to switch to some default
> credentials and continue the retries.
> Does this explain ?
>
> On Thu, Feb 11, 2010 at 7:09 PM, James Carlson <carlsonj@workingcode.com>=
 wrote:
>> Ashmath Khan wrote:
>>> Thanks James for long explanation.
>>>
>>> Let me explain. I am actually looking for a different retry mechanism
>>> for failures. My retry interval would vary depending on the number of
>>> retries. To given an example:
>>> nth retry is to be attempted at (n - 1)3 x 10 secs after previous attem=
pt
>>
>> Why? =A0You still haven't explained what you're doing.
>>
>> What problem are you attempting to solve? =A0Can you give us any hints a=
t all?
>>
>>> So the retry interval is not constant but derived from a formula.
>>>
>>> Are such things possible without modifying the code ?
>>
>> No. =A0See pppd/fsm.c, f->timeouttime, and the TIMEOUT() macro.
>>
>> --
>> James Carlson =A0 =A0 =A0 =A0 42.703N 71.076W =A0 =A0 =A0 =A0 <carlsonj@=
workingcode.com>
>>
>
