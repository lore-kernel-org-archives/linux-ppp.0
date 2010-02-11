From: Ashmath Khan <hashmat.email@gmail.com>
Date: Thu, 11 Feb 2010 14:59:18 +0000
Subject: Re: Control pppd behaviour
Message-Id: <b17c42311002110658h7bb351e9o2d7ce6be468f176d@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <27543592.post@talk.nabble.com>
In-Reply-To: <27543592.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Its neither about PPP negotiation nor about separate invocation of pppd.

As I mentioned its about retry mechanism or the algorithm or you can
call it the strategy employed to retry if things fail.

For the normal retries if the retry interval is 30 secs and max retries is =
5 ...
then the 1st retry is at 30 secs
2nd at 60 secs
3rd at 90 secs

But I need it something like this:
1st retry at 30 secs
2nd retry at 120 secs
3rd retry at 300 secs etc..

Hope its clear. thanks.

On Thu, Feb 11, 2010 at 8:11 PM, James Carlson <carlsonj@workingcode.com> w=
rote:
> Ashmath Khan wrote:
>> Ok.
>> Its a requirement from my customer which I need to implement !
>> My customer doesn't want normal retries but want this to be tried. As
>> simple as that.
>> In addtion:and after m retries, I would want to switch to some default
>> credentials and continue the retries.
>> Does this explain ?
>
> Unfortunately, no, but we're getting closer.
>
> Are you talking about PPP negotiation or about separate invocations of pp=
pd?
>
> If it's separate invocations of pppd, then you can certainly wrap pppd
> with a script that checks the exit code (make sure you use the
> "updetach" option so you get something sensible), and use the exit code
> to determine what to do next. =A0See the man page for details.
>
> If you're talking about the individual PPP negotiation messages that a
> single pppd invocation sends to its peer (i.e., you want to send PAP
> Authenticate-Request using user "joe" the first two times and then "bob"
> the next two times), then you'll need to modify the source to do as
> you're asking.
>
> Fortunately, it's pretty easy to modify.
>
> --
> James Carlson =A0 =A0 =A0 =A0 42.703N 71.076W =A0 =A0 =A0 =A0 <carlsonj@w=
orkingcode.com>
>
