From: arun b <arun.s.bailur@gmail.com>
Date: Wed, 02 Jun 2010 17:41:18 +0000
Subject: Re: PPPoA server setup how to?
Message-Id: <AANLkTiktFqKOEzSuhJ4leg4us8hG2h31mLp4Pg2vuLay@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTikV_j1ajMThiB8B6DoaZpZ4fhlIRVVk2jK30-h8@mail.gmail.com>
In-Reply-To: <AANLkTikV_j1ajMThiB8B6DoaZpZ4fhlIRVVk2jK30-h8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Thank you for the quick response...

Ok I will have to check if the pppd is available in the remote (server
)device,
Now  the current availabel options for remote device are Alctel-ISAM
or Dslam-Dlink  where my ATM path  terminates.
let me verify this...

Again to clear the  confusion....
yes with above remote devices I have tested  for PPPoE on ATM
can i call this test as PPPoEoA  !!!!!

-Arun



On Wed, Jun 2, 2010 at 10:24 PM, James Chapman <jchapman@katalix.com> wrote:
> arun b wrote:
>> Hi,
>> Thanks for the info
>> First of all let me try to clear your confusion ..
>> 1) at the client side as i already told you its linux-box and i am
>> running pppd (2.4)
>> ie. pppd plugin pppoatm.so 9.45 user xxxxxx password xxxxxx
>>
>> now this box send LCP packets 10 times and the pppd terminates. as
>> there is no responder..
>> 2) Now I need to =A0setup =A0responder (PPPoA-server i belive) my self
>> similar to =A0PPPoE-server in the case of pppoe test linuxPC.
>>
>> so if you know about server =A0pls pass me the =A0info
>
> At the server
>
> pppd plugin pppoatm.so 9.45 192.168.42.42:192.168.42.43 passive
>
> Run this on the server before starting the client. Adjust IP addresses
> as required.
>
>> Also we have alctel-iSAM which has only pppoa-relay and id doesnot
>> have server ......!
>
> What is pppoa-relay? Are you confusing PPPoE and PPPoA?
>
> What role does the Alcatel iSAM box play in your network? Is it between
> the Linux PPPoA client and Linux PPPoA server? If so, how does it map
> ingress/egress ATM VCs? Is it configured to pass the ATM traffic correctl=
y?
>
>>
>>
>> -Arun
>>
>>
>>
>>
>>
>>
>> On Wed, Jun 2, 2010 at 7:56 PM, James Carlson <carlsonj@workingcode.com>=
 wrote:
>>> arun b wrote:
>>>> On Wed, Jun 2, 2010 at 4:27 PM, James Carlson <carlsonj@workingcode.co=
m> wrote:
>>>>> But I think it's probably time to take a step back and ask the obvious
>>>>> question: can you tell us what you've got (in terms of hardware,
>>>>> software, and operational environment) and what you're trying to do (=
in
>>>>> as much high-level detail as possible)?
>>>> NO I am not building it for Dslam-box. well I want to run PPPoA server
>>>> at remote side device where ATM path terminates.
>>>> I am executing this is =A0 "pppd plugin pppoatm.so 0.80
>>>> 192.168.1.1:192.168.1.2 passive" =A0on my client(linux-box).
>>> "passive" is a slightly surprising option to see on the "client" side of
>>> the connection. =A0Are you sure that's what you want? =A0And are you su=
re
>>> that 0.80 are the right VPI/VCI pair for the connection?
>>>
>>> There are two broad classes of problems that show up here: either the
>>> ATM link isn't working, or the PPP link on top is misconfigured. =A0What
>>> do you actually see when you run pppd? =A0Have you tried running with t=
he
>>> "debug" option enabled? =A0What log messages are produced?
>>>
>>> If pppd is timing out in LCP with "too many" Configure-Request messages,
>>> then the likely culprit is the ATM configuration. =A0Otherwise, PPP mig=
ht
>>> be involved; possibly missing authentication or L3 address information.
>>>
>>>> =A0 =A0 =A0|-| RJ-11 connector =A0 "pppd plugin pppoatm.so 0.80
>>>> 192.168.1.1:192.168.1.2 passive"
>>> It should be obvious, but the connection between these two machines
>>> _must_ be ATM, and _not_ Ethernet.
>>>
>>>> Here the server device and the configuration are unknown to me. Could
>>>> you help in choose the server device (Dslam, iSam like..), and
>>>> enabling it.
>>> If you're not the administrator for the remote end, then I have no idea
>>> how you might go about enabling it. =A0Won't you have to drive down to
>>> your ISP's offices and break in first?
>>>
>>> Or are you planning to set up your own PPPoA server ... ?
>>>
>>> I'm confused by what you're saying here.
>>>
>>>> James,
>>>> To your question:
>>>> I have MIPS based network device currently with me. And am exploring
>>>> all PPPoX-Client(oe/oa/...) configuration. Where I am already able to
>>>> test pppoe, pppoeonATm, and wanted start on PPPoS. =A0- so that we can
>>>> port this solution to any of the h/w.
>>>> Now got stoped at PPPoA !!!
>>> Do you have an ATM link to a system that runs PPPoA? =A0If so, then do =
you
>>> have configuration information (particularly VPI/VCI) for that link? =
=A0Is
>>> it a nailed-up VPI/VCI pair or is it "dialed" using UNI signaling?
>>>
>>> --
>>> James Carlson =A0 =A0 =A0 =A0 42.703N 71.076W =A0 =A0 =A0 =A0 <carlsonj=
@workingcode.com>
>>>
>>
>
>
> --
> James Chapman
> Katalix Systems Ltd
> http://www.katalix.com
> Catalysts for your Embedded Linux software development
>
>
