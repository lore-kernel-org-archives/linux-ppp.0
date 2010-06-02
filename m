From: arun b <arun.s.bailur@gmail.com>
Date: Wed, 02 Jun 2010 13:58:33 +0000
Subject: Re: PPPoA server setup how to?
Message-Id: <AANLkTil0TRenIoYvQeN7vpw0IPkg90O0wAU-Z4y_jjp-@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTikV_j1ajMThiB8B6DoaZpZ4fhlIRVVk2jK30-h8@mail.gmail.com>
In-Reply-To: <AANLkTikV_j1ajMThiB8B6DoaZpZ4fhlIRVVk2jK30-h8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Wed, Jun 2, 2010 at 6:39 PM, arun b <arun.s.bailur@gmail.com> wrote:
> On Wed, Jun 2, 2010 at 4:27 PM, James Carlson <carlsonj@workingcode.com> =
wrote:
>> On 06/02/10 05:26, James Chapman wrote:
>>> starts a pppd instance on ATM VPI 0, VCI 80 and assigns IP 192.168.1.1
>>> to the local interface and 192.168.1.2 to the peer when the PPPoA peer
>>> connects on VPI 0, VCI 80. If you are building a DSLAM-like box which
>>> accepts connections from many PPPoA clients, you will need to start a
>>> pppd instance for every possible ATM VPI/VCI that clients might use...
>>
>> That's one possibility. =A0Another would be having UNI Q.2931 signaling
>> set up the virtual circuit for you, and launching pppd based on the
>> signaling.
>>
>> I don't think the existing implementation includes the bits required to
>> do that. =A0You'd have to write it yourself. =A0And it (obviously) depen=
ds
>> on what sort of connection you have to the network.
>>
>>>> Well I coated this (PADI, PADO,...) because, wanted to know does PPPoA
>>>> also follows these message sequence or it has new set of sequence ?
>>>
>>> No, they are for PPPoE.
>>
>> The closest equivalent to those messages I can imagine would be the ATM
>> signaling mechanism referenced above.
>>
>> But I think it's probably time to take a step back and ask the obvious
>> question: can you tell us what you've got (in terms of hardware,
>> software, and operational environment) and what you're trying to do (in
>> as much high-level detail as possible)?
>>
>> --
>> James Carlson =A0 =A0 =A0 =A0 42.703N 71.076W =A0 =A0 =A0 =A0 <carlsonj@=
workingcode.com>
>>
>
> NO I am not building it for Dslam-box. well I want to run PPPoA server
> at remote side device where ATM path terminates.
> I am executing this is =A0 "pppd plugin pppoatm.so 0.80
> 192.168.1.1:192.168.1.2 passive" =A0on my client(linux-box).
>
> Just trying to put the diagram to make it clear. (Soory for not clean
> diagram -:) )
> ------------------
> | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |
> | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |
> | PPPoA =A0 =A0 |
> | CLIENT =A0 =A0 |
> | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |
> ------------------
> =A0 =A0 |-| RJ-11 connector =A0 "pppd plugin pppoatm.so 0.80
> 192.168.1.1:192.168.1.2 passive"
> =A0 =A0 =A0|
> =A0 =A0 =A0|
> =A0 =A0 =A0|
> =A0 =A0 =A0|
> =A0 =A0 =A0|
> =A0 =A0 =A0|
> =A0 =A0 =A0|
> =A0 =A0 =A0|
> =A0 =A0 |-| =A0RJ-11 connector =A0 ??????????????
> ---------------------
> | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|
> | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|
> | PPPoA =A0 =A0 =A0 =A0 |
> | Serv =A0 =A0 =A0 =A0 =A0 =A0 |
> | =A0????????? =A0 |
> | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |
> ----------------------
>
> Here the server device and the configuration are unknown to me. Could
> you help in choose the server device (Dslam, iSam like..), and
> enabling it.
>
> James,
> To your question:
> I have MIPS based network device currently with me. And am exploring
> all PPPoX-Client(oe/oa/...) configuration. Where I am already able to
> test pppoe, pppoeonATm, and wanted start on PPPoS. =A0- so that we can
> port this solution to any of the h/w.
> Now got stoped at PPPoA !!!
>
> -Arun
>


We have DSLAM device for test,  now exploring the possbilty of runing
pppoA-server..
also in addition to answer for your question...
We my  to confgiure MLPPP features...

-Arun
