From: Ashmath Khan <hashmat.email@gmail.com>
Date: Thu, 11 Feb 2010 15:15:37 +0000
Subject: Re: Control pppd behaviour
Message-Id: <b17c42311002110703n1ba5777boe85495c2ba0d4a19@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <27543592.post@talk.nabble.com>
In-Reply-To: <27543592.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

I want to consider all failure cases(at lcp, at chap etc), any
negotiation failure etc, for which pppd would retry with the server
from scratch.
Basically I don't pppd to retry after a failure but I want pppd to
exit, and then the retry will be done by my program by relaunching
pppd. is this possible ? maybe i need to keep the retries as zero ?
thanks.

On Thu, Feb 11, 2010 at 8:28 PM, James Carlson <carlsonj@workingcode.com> w=
rote:
> Ashmath Khan wrote:
>> What would I need to do so that pppd doesn't retry for any failures? tha=
nks.
>
> Can you define precisely what you mean by "retry" and "failure" and what
> particular cases you're concerned about?
>
> Sorry to be obtuse here, but it's just plain unclear to me what you're
> after, and I'd very much like to be helpful.
>
> The Point-to-Point Protocol includes a negotiation mechanism that
> resends messages when there's no response and sometimes when there are
> disagreements between the peers. =A0I *suspect* you're not really
> interested in that, though you seem to have expressed interest in
> changing it.
>
> The pppd implementation also includes ways to restart the entire
> connection after failure. =A0That behavior is not the default. =A0You must
> use options such as "demand" or "persist" in order to get the daemon to
> retry after fatal problems, such as authentication rejection or
> parameter negotiation failure.
>
> If you don't want it to do that, then just don't use those options.
>
> Please see the pppd man page for details on these options, and post a
> *precise* description of what you want it to do and under what conditions.
>
> --
> James Carlson =A0 =A0 =A0 =A0 42.703N 71.076W =A0 =A0 =A0 =A0 <carlsonj@w=
orkingcode.com>
>
