From: arun b <arun.s.bailur@gmail.com>
Date: Thu, 03 Jun 2010 07:56:25 +0000
Subject: Re: PPPoA server setup how to?
Message-Id: <AANLkTinYREDO-67MlnGEzNWm_9O8h17SWXVTp6oQTIG3@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTikV_j1ajMThiB8B6DoaZpZ4fhlIRVVk2jK30-h8@mail.gmail.com>
In-Reply-To: <AANLkTikV_j1ajMThiB8B6DoaZpZ4fhlIRVVk2jK30-h8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Hi,

Ans to Question: Yes my box has DSL interface. (h/w connecter is a RJ11).

Now I have 3 types of test setup to configure and verify..
1)DSLAM box configured to terminate a PPPoA VC-muxed connection if it
has that capability.
2)Configure the DSLAM to switch the ATM (PPP) traffic from the DSL
ingress interface to a regular ATM (fiber / coax) uplink which goes to
a Linux server equipped with a compatible ATM NIC
3) Connecting similar 2 linux boxes back over the DSL interface one is
Server(test device) other is client.


Below is the test (3) result(logs) and how I executed those..

AT Server:
=3D=3D=3D=3D=3D
#pppd plugin pppoatm.so 8.35 192.168.42.42:192.168.42.43 passive
logfile ./log.txt

Arun: In PPP: start_link ,  FD =3D 7
Using interface ppp0
Connect: ppp0 <--> 8.35
LCP: timeout sending Config-Requests

AT Client:
=3D=3D=3D=3D=3D
#pppd plugin pppoatm.so 8.35 user user1 password pass  debug  logfile ./log=
.txt
Arun: In PPP: start_link ,  FD =3D 7
using channel 1
Using interface ppp0
Connect: ppp0 <--> 8.35
sent [LCP ConfReq id=3D0x1 <magic 0x3dd022c9>]
sent [LCP ConfReq id=3D0x1 <magic 0x3dd022c9>]
sent [LCP ConfReq id=3D0x1 <magic 0x3dd022c9>]
sent [LCP ConfReq id=3D0x1 <magic 0x3dd022c9>]
sent [LCP ConfReq id=3D0x1 <magic 0x3dd022c9>]
sent [LCP ConfReq id=3D0x1 <magic 0x3dd022c9>]
sent [LCP ConfReq id=3D0x1 <magic 0x3dd022c9>]
sent [LCP ConfReq id=3D0x1 <magic 0x3dd022c9>]
sent [LCP ConfReq id=3D0x1 <magic 0x3dd022c9>]
sent [LCP ConfReq id=3D0x1 <magic 0x3dd022c9>]
LCP: timeout sending Config-Requests
Connection terminated.
Modem hangup

The conclusion is that, the two linx-boxes are not able to
communicate. This may be due to similar NIC type ATU-R. I guess it is
a hardware-mode.  cannot change to ATR-C ...!

Next is,  I need to explore the DLSAM possibilities.. (1) & (2).  In
point 2 you have mentioned, "Dslam ATM uplink which goes to a Linux
server equipped with a compatible ATM NIC". You mean it is client ? if
server , I didn't got the point...!
How is the test-setup ? , what all devices does it has..?

-Arun





On Thu, Jun 3, 2010 at 1:26 AM, James Chapman <jchapman@katalix.com> wrote:
> arun b wrote:
>> Well my ultimate aim is to test my client (linux-box ) i need
>> responder =A0i don't care what it is as long as it responds ...
>>
>> NOw just thought came to me that, =A0what if i use 2 of linux-box one as
>> server and other as client ...
>> i don't know how to configure VCI/VPI on my server ..
>> thses values where 9.45 =A0as this are confiugred in our by the admin DS=
LAM/ ISAM.
>
> What physical interface is used on the PPPoA client?
>
> It sounds like your PPPoA client is a DSL modem. If not, ignore the
> below. :-)
>
> If the client is a DSL modem, you would need a DSL interface on the
> Linux server box in order to connect them directly together. But you
> can't use a regular DSL NIC at the server - the server and client sides
> of a DSL link aren't the same - client is ATU-R and server is ATU-C. I
> don't know of a DSL ATU-C NIC that Linux would be able to configure. So
> you will probably have to use a DSLAM. Your best bet then is to have
> your DSLAM box configured to terminate a PPPoA VC-muxed connection if it
> has that capability. If not, configure the DSLAM to switch the ATM (PPP)
> traffic from the DSL ingress interface to a regular ATM (fibre / coax)
> uplink which goes to a Linux server equipped with a compatible ATM NIC
> and run pppd there as previously described. There are many variants of
> ATM physical interface (coax, single-mode fibre, multi-mode fibre,
> 25Mbps, 155Mbps etc), so you would need to use whatever your DSLAM boxes
> have as their ATM uplink. In any case, you will need to configure your
> DSLAM to match the client setup - bridged PPPoE, VC-muxed PPPoA or
> perhaps even LLC-muxed PPPoA.
>
>> pls know me if it can be configured.
>>
>> -Arun
>>
>>
>> On Wed, Jun 2, 2010 at 11:11 PM, James Chapman <jchapman@katalix.com> wr=
ote:
>>> arun b wrote:
>>>> Thank you for the quick response...
>>>>
>>>> Ok I will have to check if the pppd is available in the remote (server
>>>> )device,
>>>> Now =A0the current availabel options for remote device are Alctel-ISAM
>>>> or Dslam-Dlink =A0where my ATM path =A0terminates.
>>>> let me verify this...
>>> Oh, I assumed your server was a Linux box with pppd etc. If not, we
>>> won't be able to help you with server config here.
>>>
>>>> Again to clear the =A0confusion....
>>>> yes with above remote devices I have tested =A0for PPPoE on ATM
>>>> can i call this test as PPPoEoA =A0!!!!!
>>> Perhaps you mean PPPoE over an RFC1483 bridged encap ATM link? And now
>>> you're trying to get PPP working over a VC-muxed ATM connection.
>>>
>>>> -Arun
>>>>
>>>>
>>>>
>>>> On Wed, Jun 2, 2010 at 10:24 PM, James Chapman <jchapman@katalix.com> =
wrote:
>>>>> arun b wrote:
>>>>>> Hi,
>>>>>> Thanks for the info
>>>>>> First of all let me try to clear your confusion ..
>>>>>> 1) at the client side as i already told you its linux-box and i am
>>>>>> running pppd (2.4)
>>>>>> ie. pppd plugin pppoatm.so 9.45 user xxxxxx password xxxxxx
>>>>>>
>>>>>> now this box send LCP packets 10 times and the pppd terminates. as
>>>>>> there is no responder..
>>>>>> 2) Now I need to =A0setup =A0responder (PPPoA-server i belive) my se=
lf
>>>>>> similar to =A0PPPoE-server in the case of pppoe test linuxPC.
>>>>>>
>>>>>> so if you know about server =A0pls pass me the =A0info
>>>>> At the server
>>>>>
>>>>> pppd plugin pppoatm.so 9.45 192.168.42.42:192.168.42.43 passive
>>>>>
>>>>> Run this on the server before starting the client. Adjust IP addresses
>>>>> as required.
>>>>>
>>>>>> Also we have alctel-iSAM which has only pppoa-relay and id doesnot
>>>>>> have server ......!
>>>>> What is pppoa-relay? Are you confusing PPPoE and PPPoA?
>>>>>
>>>>> What role does the Alcatel iSAM box play in your network? Is it betwe=
en
>>>>> the Linux PPPoA client and Linux PPPoA server? If so, how does it map
>>>>> ingress/egress ATM VCs? Is it configured to pass the ATM traffic corr=
ectly?
>>>>>
>>>>>> -Arun
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> On Wed, Jun 2, 2010 at 7:56 PM, James Carlson <carlsonj@workingcode.=
com> wrote:
>>>>>>> arun b wrote:
>>>>>>>> On Wed, Jun 2, 2010 at 4:27 PM, James Carlson <carlsonj@workingcod=
e.com> wrote:
>>>>>>>>> But I think it's probably time to take a step back and ask the ob=
vious
>>>>>>>>> question: can you tell us what you've got (in terms of hardware,
>>>>>>>>> software, and operational environment) and what you're trying to =
do (in
>>>>>>>>> as much high-level detail as possible)?
>>>>>>>> NO I am not building it for Dslam-box. well I want to run PPPoA se=
rver
>>>>>>>> at remote side device where ATM path terminates.
>>>>>>>> I am executing this is =A0 "pppd plugin pppoatm.so 0.80
>>>>>>>> 192.168.1.1:192.168.1.2 passive" =A0on my client(linux-box).
>>>>>>> "passive" is a slightly surprising option to see on the "client" si=
de of
>>>>>>> the connection. =A0Are you sure that's what you want? =A0And are yo=
u sure
>>>>>>> that 0.80 are the right VPI/VCI pair for the connection?
>>>>>>>
>>>>>>> There are two broad classes of problems that show up here: either t=
he
>>>>>>> ATM link isn't working, or the PPP link on top is misconfigured. =
=A0What
>>>>>>> do you actually see when you run pppd? =A0Have you tried running wi=
th the
>>>>>>> "debug" option enabled? =A0What log messages are produced?
>>>>>>>
>>>>>>> If pppd is timing out in LCP with "too many" Configure-Request mess=
ages,
>>>>>>> then the likely culprit is the ATM configuration. =A0Otherwise, PPP=
 might
>>>>>>> be involved; possibly missing authentication or L3 address informat=
ion.
>>>>>>>
>>>>>>>> =A0 =A0 =A0|-| RJ-11 connector =A0 "pppd plugin pppoatm.so 0.80
>>>>>>>> 192.168.1.1:192.168.1.2 passive"
>>>>>>> It should be obvious, but the connection between these two machines
>>>>>>> _must_ be ATM, and _not_ Ethernet.
>>>>>>>
>>>>>>>> Here the server device and the configuration are unknown to me. Co=
uld
>>>>>>>> you help in choose the server device (Dslam, iSam like..), and
>>>>>>>> enabling it.
>>>>>>> If you're not the administrator for the remote end, then I have no =
idea
>>>>>>> how you might go about enabling it. =A0Won't you have to drive down=
 to
>>>>>>> your ISP's offices and break in first?
>>>>>>>
>>>>>>> Or are you planning to set up your own PPPoA server ... ?
>>>>>>>
>>>>>>> I'm confused by what you're saying here.
>>>>>>>
>>>>>>>> James,
>>>>>>>> To your question:
>>>>>>>> I have MIPS based network device currently with me. And am explori=
ng
>>>>>>>> all PPPoX-Client(oe/oa/...) configuration. Where I am already able=
 to
>>>>>>>> test pppoe, pppoeonATm, and wanted start on PPPoS. =A0- so that we=
 can
>>>>>>>> port this solution to any of the h/w.
>>>>>>>> Now got stoped at PPPoA !!!
>>>>>>> Do you have an ATM link to a system that runs PPPoA? =A0If so, then=
 do you
>>>>>>> have configuration information (particularly VPI/VCI) for that link=
? =A0Is
>>>>>>> it a nailed-up VPI/VCI pair or is it "dialed" using UNI signaling?
>>>>>>>
>>>>>>> --
>>>>>>> James Carlson =A0 =A0 =A0 =A0 42.703N 71.076W =A0 =A0 =A0 =A0 <carl=
sonj@workingcode.com>
>>>>>>>
>>>>> --
>
> --
> James Chapman
> Katalix Systems Ltd
> http://www.katalix.com
> Catalysts for your Embedded Linux software development
>
>
