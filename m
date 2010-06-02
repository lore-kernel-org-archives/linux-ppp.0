From: arun b <arun.s.bailur@gmail.com>
Date: Wed, 02 Jun 2010 18:20:03 +0000
Subject: Re: PPPoA server setup how to?
Message-Id: <AANLkTikl8953Byt269Dy8aH9rO-swz34HzUiTGYR3SDi@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTikV_j1ajMThiB8B6DoaZpZ4fhlIRVVk2jK30-h8@mail.gmail.com>
In-Reply-To: <AANLkTikV_j1ajMThiB8B6DoaZpZ4fhlIRVVk2jK30-h8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

I totally agree with  your concept here..
well me being new bee in PPPworld just spent month time on this and
able to test couple of....

Now the PPPoA server is  the big-catch to me  and goingon. .... :)

-Arun

On Wed, Jun 2, 2010 at 11:26 PM, James Carlson <carlsonj@workingcode.com> w=
rote:
> James Chapman wrote:
>> arun b wrote:
>>> Again to clear the =A0confusion....
>>> yes with above remote devices I have tested =A0for PPPoE on ATM
>>> can i call this test as PPPoEoA =A0!!!!!
>>
>> Perhaps you mean PPPoE over an RFC1483 bridged encap ATM link? And now
>> you're trying to get PPP working over a VC-muxed ATM connection.
>
> You beat me to it.
>
> It's important to note that these are *completely* different animals.
> In the PPPoE with ATM case, the ATM link is really just bridging
> Ethernet. =A0It doesn't really "know" that there's PPP traffic inside, as
> it only "sees" Ethernet.
>
> In fact, you can carry *normal* IP traffic over that same sort of
> bridged ATM link without bothering to use PPPoE at all; some ADSL
> providers in fact did just that -- though most were bitten by the PPPoE
> bug, some were not. =A0It's even easier to do this, provides better
> performance, and avoids the MTU hassles of PPPoE.
>
> In the PPPoA case, the ATM link is carrying PPP frames. =A0The VC is
> normally dedicated to just PPP in that instance. =A0There's no Ethernet
> involved and thus no PPPoE. =A0(And a bit lower overhead than any of the
> above schemes.)
>
> Don't confuse the two of them. =A0Except for potentially using the same
> raw hardware, they're quite different in terms of design. =A0For instance,
> the ATM termination equipment in the bridged case is a "simple" Ethernet
> bridge, and not much else. =A0In the PPPoA case, it _must_ terminate ATM
> and PPP, and then, if there are any other nodes that use the link, it
> must act as a router (or NAT) for the traffic that goes over it. =A0With
> PPPoE, those parts are in the end station that runs PPPoE and PPP.
>
> And, no, I wouldn't call the test "PPPoEoA," though that's more or less
> what you'd see on the ATM link itself. =A0The fact that PPPoE is
> "normally" run over Ethernet that's then bridged over ATM is more a
> monument to Babel than anything else. =A0;-}
>
> --
> James Carlson =A0 =A0 =A0 =A0 42.703N 71.076W =A0 =A0 =A0 =A0 <carlsonj@w=
orkingcode.com>
>
