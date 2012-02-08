From: Srinidhi M <srinidhi.m26@gmail.com>
Date: Wed, 08 Feb 2012 11:55:19 +0000
Subject: Re: CPU processing time between using TCP and UDP
Message-Id: <CADa7JjWKJLBTPtK1c5iUbvbBsqO+kwWNWJZ1R6NkeJZXY2DWfg@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CADa7JjUrtiQF=bBm--a1WLBFSW877_=Ws95Z+rDpwhaWnXBuyg@mail.gmail.com>
In-Reply-To: <CADa7JjUrtiQF=bBm--a1WLBFSW877_=Ws95Z+rDpwhaWnXBuyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Tue, Feb 7, 2012 at 9:00 PM, James Carlson <carlsonj@workingcode.com> wr=
ote:
> Srinidhi M wrote:
>> Could you please let me know, which module in TCP/IP is consuming more
>> time than UDP? How can we reduce packet processing time when sending
>> through TCP stack? Please let me know your thoughts.
>
> Are you sure you wanted to post this message on the Linux PPP mailing lis=
t?

No. I do not know the exact mailing list name for these type of
questions. First, I mailed to main kernel, but, I did not get any
response. So, I mailed to this group. Please let me know the mailing
list name for posting these type of questions.

> Anyway, without knowing a lot about your application, how you're
> measuring things, and what environment you're running in, it's a little
> hard to guess at what sort of change you might require. =A0But I'll give
> it a try.

Just using "top" command. No other commands.

> Have you tried setting the TCP_NODELAY option and/or redesigning around
> TCP_CORK?

No. We are not using these options. We will try to change the options
for setsockopt call.

> If your application does a lot of tiny write(2) calls, you
> will sometimes see RTT delays in delivery. =A0This is normal, and it's
> something that the stack does in order to protect the network against
> misbehaving (or just inefficient) applications. =A0You can disable it in
> order to force a write(2) to result in a transmission ... but be careful
> if you do this, because doing so can result in a flood of tiny packets
> if you (say) write a byte at a time.
>
> Have you considered SCTP instead? =A0If you have a message-oriented
> protocol (rather than a stream-oriented one), and you need reliable
> delivery, SCTP may be a better option for you than TCP.

We will think about these, later.

Thank you very much for your reply.

Regards,
Srinidhi M.
> --
> James Carlson =A0 =A0 =A0 =A0 42.703N 71.076W =A0 =A0 =A0 =A0 <carlsonj@w=
orkingcode.com>
