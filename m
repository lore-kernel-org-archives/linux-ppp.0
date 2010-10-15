From: Leonid Lisovskiy <lly.dev@gmail.com>
Date: Fri, 15 Oct 2010 11:11:43 +0000
Subject: Re: [PATCH] pppoe: Missed check for destination addr in PADT frame processing
Message-Id: <AANLkTikU+XjUpuXmdumY84wGdhJhhgSR3qew2YB+rR=N@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTim5m4f-7U4kMghBR0yEQka3-iOaJ9aHwf4sGsxj@mail.gmail.com>
In-Reply-To: <AANLkTim5m4f-7U4kMghBR0yEQka3-iOaJ9aHwf4sGsxj@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 10/15/10, Sujit K M <sjt.kar@gmail.com> wrote:
>> In case of ISP has single access point, it has one source MAC for all
>> network, right? If such AP is buggy and give two(or more) equal
>> session_id's to several clients, this cause situation I described
>> above.
>
> I am still not clear. The session_id will have an unique value for the pppoe
> connection. I think It will be a part of
> 1. The handshake that goes on
> 2. Crytography for the device(specific to the modem).
>
> Even If 2 fails, 1 Should fix it(be it single/multiple).
>

Once more - this is how it should be done by RFC. But due to buggy ISP
hardware uniqueness of session_id violated! Client doesn't know
anything about other clients connected to the ISP, so it can't fix
anything.

Also I don't understand you - how cryptography relates to PPPoE frame header.
