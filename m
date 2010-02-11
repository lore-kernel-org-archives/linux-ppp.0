From: Ashmath Khan <hashmat.email@gmail.com>
Date: Thu, 11 Feb 2010 14:51:52 +0000
Subject: Re: Control pppd behaviour
Message-Id: <b17c42311002110651o2851fb6bve7c8092f6d360d83@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <27543592.post@talk.nabble.com>
In-Reply-To: <27543592.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

What would I need to do so that pppd doesn't retry for any failures? thanks.

On Thu, Feb 11, 2010 at 8:15 PM, James Carlson <carlsonj@workingcode.com> w=
rote:
> Ashmath Khan wrote:
>> James or others,
>>
>> Is there a documentation explaining what each ppp option stands for
>> options file, I do understand some but others I want to know in detail
>> eg:
>> plugin pppoe.so eth1
>> nodetach
>> nodefaultroute
>> persist
>> maxfail 0
>> noauth
>> user ashmat
>> nopcomp
>> lcp-max-failure 5
>> lcp-max-configure 10
>> lcp-max-terminate 2
>> lcp-restart 3
>> lcp-echo-failure 3
>> lcp-echo-interval 10
>> mru 1492
>
> Have you read the man page? =A0How about RFC 1661?
>
> What more details would you like to have? =A0Which particular options are
> confusing? =A0(Or are they all troublesome?)
>
> Perhaps we could offer some help here or fix the man page where it's
> deficient, but please give us some idea what you need.
>
> --
> James Carlson =A0 =A0 =A0 =A0 42.703N 71.076W =A0 =A0 =A0 =A0 <carlsonj@w=
orkingcode.com>
>
