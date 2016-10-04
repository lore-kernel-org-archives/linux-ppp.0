From: Manish Kambdur <manish.kambdur@gmail.com>
Date: Tue, 04 Oct 2016 04:41:03 +0000
Subject: Re: Problem: How to force(?) pcomp and accomp
Message-Id: <CAAAUBLRSZg=zWA2yjjwN=gNjG25mn+6d7QJnWCuiixBRzeRQMg@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAAAUBLR3EqnpES7FrcABVZWB1j-NeOyH7_MoTH-iVYFJD14_XQ@mail.gmail.com>
In-Reply-To: <CAAAUBLR3EqnpES7FrcABVZWB1j-NeOyH7_MoTH-iVYFJD14_XQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

> Yes, it does.  /etc/ppp/options sets the system-wide options required
> for all links.  The privileged "call" and unprivileged "file" options
> are there (along with the command line) to add options that are specific
> to an individual link.

I had assumed all three are equivalent and I had to choose one method.
The actual design makes much more sense.

> That information would have helped.  GPRS has a number of built-in
> design flaws.  One of them is that the LCP negotiation is done locally
> (not end-to-end) along with a completely faked-out authentication layer.
>  The "real" negotiation with the remote endpoint doesn't occur until the
> Network phase -- that is, during IPCP.
>
> So, yes, I'm referring to the device doing LCP negotiation.  It's not
> doing it right.

Thanks a lot for this explanation. My whole setup and situation is
much more clear to me now.
I kept wondering why the peer had different behaviour based on the
GPRS modem I was using. I was under the impression that the chat
script talks to the modem, and pppd talks to the remote server.

Thanks again!!

Regards,
Manish
