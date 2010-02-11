From: Ashmath Khan <hashmat.email@gmail.com>
Date: Thu, 11 Feb 2010 16:50:28 +0000
Subject: Re: Control pppd behaviour
Message-Id: <b17c42311002110850h2d0ebd64ga9d2b262d717e030@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <27543592.post@talk.nabble.com>
In-Reply-To: <27543592.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Thanks James.
From man page:
updetach
    With this option, pppd will detach from its controlling terminal
once it has successfully established the ppp connection (to the point
where the first network control protocol, usually the IP control
protocol, has come up).

How about if chap authentication fails ? then updetach won't work.
what is controlling terminal here ?

On Thu, Feb 11, 2010 at 9:15 PM, James Carlson <carlsonj@workingcode.com> w=
rote:
> Ashmath Khan wrote:
>> Its neither about PPP negotiation nor about separate invocation of pppd.
>>
>> As I mentioned its about retry mechanism or the algorithm or you can
>> call it the strategy employed to retry if things fail.
>>
>> For the normal retries if the retry interval is 30 secs and max retries =
is 5 ...
>> then the 1st retry is at 30 secs
>> 2nd at 60 secs
>> 3rd at 90 secs
>>
>> But I need it something like this:
>> 1st retry at 30 secs
>> 2nd retry at 120 secs
>> 3rd retry at 300 secs etc..
>>
>> Hope its clear. thanks.
>
> Ashmath Khan wrote:
>> I want to consider all failure cases(at lcp, at chap etc), any
>> negotiation failure etc, for which pppd would retry with the server
>> from scratch.
>> Basically I don't pppd to retry after a failure but I want pppd to
>> exit, and then the retry will be done by my program by relaunching
>> pppd. is this possible ? maybe i need to keep the retries as zero ?
>> thanks.
>
> How about using the pppd "updetach" option, and using a script to invoke
> and retry pppd as desired?
>
> --
> James Carlson =A0 =A0 =A0 =A0 42.703N 71.076W =A0 =A0 =A0 =A0 <carlsonj@w=
orkingcode.com>
>
>
