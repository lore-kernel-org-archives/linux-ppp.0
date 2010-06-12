From: arun b <arun.s.bailur@gmail.com>
Date: Sat, 12 Jun 2010 05:27:26 +0000
Subject: Re: PPPoE mutiple session issue.
Message-Id: <AANLkTimvP5Wt_J8zVuTjcv102yYQhn335ruSOPe0yYQY@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTik_K8aDmuoNjCkKNWoS5bx6kokZCagmzzw5pxcW@mail.gmail.com>
In-Reply-To: <AANLkTik_K8aDmuoNjCkKNWoS5bx6kokZCagmzzw5pxcW@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Thank you for the detaild response....
as I mentioned before..
I want to run multiple pppd sessions which results in interface (ppp0,
ppp1, ppp2......).
well the connectivity is... as below
the hardware I am using is connected to pc with ethernet crosscable.
on pc i run  - pppoe-server
       sudo pppoe-server -I eth0:0 -R 10.0.0.2

on my hardware, which is a client,  pppd is executed.
  pppd eth0 user xxxx passwordd dddd

though i am able to create mutlipel interfaces . i am not be able to
commuicte over all insted..


I guess these is due to same server -IP :(


Regs,
Arun





On Fri, Jun 11, 2010 at 5:33 PM, James Carlson <carlsonj@workingcode.com> w=
rote:
> On 06/11/10 03:53, arun b wrote:
>> All,
>> I am running pppd (PPPoE mode). =A0when i create mutiple
>> session(interfac) (ppp0 /ppp1..). I am unable to communicate over
>> ppp1(ping test) only ppp0 is comunicable..
>>
>> Iis it a valid behaviour =A0or Is this a know issue, if so pls know the =
fix =A0?
>
> There's not a lot of information here, so it's a little hard to guess.
> It would usually help matters to include packet traces on the Ethernet
> (not text, but raw traces) and/or some hints about how the interfaces
> are configured and what routes you have.
>
> There is, though, one possibility that comes immediately to mind. =A0PPPoE
> is not a standards-track protocol, and was not subjected to the sort of
> review that standard protocols are. =A0It has some substantial defects.
>
> One of those defects is that only a single session ID is established for
> a session. =A0Normal tunneling protocols establish a separate ID in each
> direction so that each side can demux properly, but PPPoE does not.
> This means that when packets go from PPPoE access server back to the
> client, there's no real guarantee that the client can successfully
> demultiplex the traffic, because the server chose the ID. =A0The protocol
> just "assumes" that "normal" clients won't run more than one instance of
> PPPoE, so the ID doesn't matter.
>
> On the Solaris implementation of PPPoE that I wrote, I added special
> code to detect conflicting IDs on the client side and then demux based
> on Ethernet address. =A0That makes it work with multiple clients as long
> as the servers have different addresses. =A0That's not specified in the
> RFC, so it's possible that not every implementation is able to do that.
>
> On an implementation lacking that feature, you might be able to get away
> with using multiple Ethernet interfaces.
>
> --
> James Carlson =A0 =A0 =A0 =A0 42.703N 71.076W =A0 =A0 =A0 =A0 <carlsonj@w=
orkingcode.com>
>
