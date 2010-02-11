From: Ashmath Khan <hashmat.email@gmail.com>
Date: Thu, 11 Feb 2010 12:05:07 +0000
Subject: Re: Control pppd behaviour
Message-Id: <b17c42311002110353q545e2432u3b462f18ce3ef178@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <27543592.post@talk.nabble.com>
In-Reply-To: <27543592.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

I am not looking for multiple options with which pppd needs to try.
Let me give an example, normally if auth fails...it will retry after
'a' seconds for 'n' number of times.
What I would need is say it should try after 'a' seconds for first
retry, after '2a' seconds for second try after first retry fails and
so on..etc. Basically I want to change the retry mechanism. Is there a
way to change without changing the code ?

thanks.

On Thu, Feb 11, 2010 at 2:33 PM, walter harms <wharms@bfs.de> wrote:
>
>
> Hashmat Khan schrieb:
>> Hello,
>>
>> I understand that pppd uses parameters from different files such as those
>> located in /etc/ppp directory to control its behaviours on failures etc.
>>
>> I wanted to know if its possible to say for example implement a different
>> retry algorithm(user defined). Is this possible without modifying code ?
>>
>
>
> What do you try "to retry" ? when one provider is down you can easy switc=
h to others.
> like this (not working) example:
>
> #!/bin/sh
> for PROV in prov1 prov2 prov2
> do
> =A0 =A0 =A0 =A0pppd call $PROV
> =A0 =A0 =A0 =A0if [ everythink_works ]
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0exit 0
> done
>
> exit 1
>
>
> re,
> =A0wh
>
>
>
>
>
