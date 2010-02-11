From: Ashmath Khan <hashmat.email@gmail.com>
Date: Thu, 11 Feb 2010 13:43:21 +0000
Subject: Re: Control pppd behaviour
Message-Id: <b17c42311002110531o4ea595bcl397e3dc063d767e0@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <27543592.post@talk.nabble.com>
In-Reply-To: <27543592.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Thanks James for long explanation.

Let me explain. I am actually looking for a different retry mechanism
for failures. My retry interval would vary depending on the number of
retries. To given an example:
nth retry is to be attempted at (n - 1)3 x 10 secs after previous attempt

So the retry interval is not constant but derived from a formula.

Are such things possible without modifying the code ?

thanks.



On Thu, Feb 11, 2010 at 6:48 PM, James Carlson <carlsonj@workingcode.com> w=
rote:
> Ashmath Khan wrote:
>> I am not looking for multiple options with which pppd needs to try.
>> Let me give an example, normally if auth fails...it will retry after
>> 'a' seconds for 'n' number of times.
>> What I would need is say it should try after 'a' seconds for first
>> retry, after '2a' seconds for second try after first retry fails and
>> so on..etc. Basically I want to change the retry mechanism. Is there a
>> way to change without changing the code ?
>
> It's still unclear what you're after.
>
> Are you asking about the details of how the protocol itself works? =A0In
> other words, are you asking about how you can modify the algorithm that
> decides when to send PPP negotiation packets?
>
> If so, then you'll need to change the source code and recompile. =A0There
> are documented parameters that allow you to change the maximum number of
> retries and the interval between retries, but none that change the
> algorithm used to determine when retries occur. =A0The algorithm is simple
> and fixed: when the timer expires and there are retries left, the TO+
> event is delivered, and that causes the timer to be restarted and a new
> message to be generated.
>
> Perhaps the real question here is: "what are you trying to do?" =A0If you
> could explain what higher-level problem you're trying to solve, it might
> be possible for someone to give you a better answer.
>
> Are you trying to work around a problem? =A0If so, what problem, with what
> symptoms and debug log messages? =A0Are you trying to interoperate with a
> peer that has bugs? =A0Are you trying to experiment with PPP itself?
>
> On the off chance that you're trying to "work around" an error message
> such as "LCP: timeout sending Config-Requests", you shouldn't. =A0That
> message doesn't mean there's anything wrong with the timer algorithm.
> It means that either the physical link isn't working properly or that
> the peer just isn't running PPP at all. =A0With a dial-up link, it usually
> means that the chat script has failed.
>
> --
> James Carlson =A0 =A0 =A0 =A0 42.703N 71.076W =A0 =A0 =A0 =A0 <carlsonj@w=
orkingcode.com>
>
