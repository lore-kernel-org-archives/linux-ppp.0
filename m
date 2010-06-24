From: arun b <arun.s.bailur@gmail.com>
Date: Thu, 24 Jun 2010 10:22:36 +0000
Subject: Re: PPP comression and extension info required...
Message-Id: <AANLkTilpQlpsiaCCK0Nq6W9Ab1ZetVwzNr3G5ure7bj3@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4C2246C1.2000206@workingcode.com>
In-Reply-To: <4C2246C1.2000206@workingcode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

HI,
Ok thanks, To agree it is a peer-issue (server ).
few things to know..
1) In the logs it shows deflate , bsd   is that mean is PPPD tries for
multiple types of encryption and fails?
2)can we run this test for PPPoE?
3) what is shlc ?

Regards,
Arun

On Thu, Jun 24, 2010 at 12:53 PM, James Cameron <quozl@laptop.org> wrote:
> On Thu, Jun 24, 2010 at 10:31:27AM +0530, arun b wrote:
>> Below are the logs, obtained I can see there is CCP-protocol
>> negotiation initiated and got rejected.
>
> Yes, according to your log, the peer (not the host) rejected CCP. =A0That
> probably means the peer is not capable of processing CCP.
>
> To prevent the host from trying CCP, add the noccp option to the host
> pppd configuration.
>
> According to manual page for pppd, noccp means "Disable CCP (Compression
> Control Protocol) negotiation. =A0This option should only be required if
> the peer is buggy and gets confused by requests from pppd for CCP
> negotiation."
>
>> Well I need to bring up the setup for both data and header
>> compression..
>
> You will need to fix the peer then. =A0On the evidence provided, it does
> not support this.
>
> --
> James Cameron
> http://quozl.linux.org.au/
>
