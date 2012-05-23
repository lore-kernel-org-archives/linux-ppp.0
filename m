From: "Kristian R. Evensen" <kristrev@simula.no>
Date: Wed, 23 May 2012 09:01:19 +0000
Subject: Re: PPP connection stuck at bad configuration-ack
Message-Id: <CAN0ddOkHCXh-F+NLiVDLMDhvyk2D86aFrM=uQW3BPRP1AN2Cmw@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAN0ddOm5akxZaAJ-VN4fgSAVOKEOEaXNoUkHXhDdKe4UAMjv1w@mail.gmail.com>
In-Reply-To: <CAN0ddOm5akxZaAJ-VN4fgSAVOKEOEaXNoUkHXhDdKe4UAMjv1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On 23 May 2012 01:11, James Cameron <quozl@laptop.org> wrote:
> On Wed, May 23, 2012 at 12:55:12AM +0200, Kristian Evensen wrote:
>> On 23. mai 2012, at 00:47, James Cameron <quozl@laptop.org> wrote:
>>
>> > I've seen this symptom also in the time between power up of the modem
>> > and successful network attachment.
>> >
>> > What fixed it for me was to add to the chatscript:
>> >
>> > # cease if modem is not attached to network yet
>> > ABORT '+CGATT: 0'
>> > '' AT+CGATT?

Thanks, I will add this to my chatscript. Since it doesnt make sense
to try to connect without network attachment, then it wont hurt to
have it there anyway.

>
> That will be interesting to try. =A0Line 150 or so of your paste shows
> that the peer and the host are in agreement over ms-wins values
> (10.11.12.{13,14}), then suddenly the peer changes it's mind at line
> 196 and proposes 127.0.0.1. =A0Presumably the change is due to the modem
> reaching the back end servers.

This seems to have been the case. After the ISP update their config, I
am not able to recreate the behavior. Now, the peer does not report
any ms-wins.
>
> p.s. my name looks like James Carlson, but I'm James Cameron. =A0I've
> started to think I should mention that when I join in on a thread
> involving James. =A0;-)
>

Hehehe, sorry about that.

-Kristian
