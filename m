From: arun b <arun.s.bailur@gmail.com>
Date: Wed, 02 Jun 2010 16:35:28 +0000
Subject: Re: PPPoA server setup how to?
Message-Id: <AANLkTilILf0ZSNs6hBs1b_2saiLWaq-UThKuHbK_Jx7C@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTikV_j1ajMThiB8B6DoaZpZ4fhlIRVVk2jK30-h8@mail.gmail.com>
In-Reply-To: <AANLkTikV_j1ajMThiB8B6DoaZpZ4fhlIRVVk2jK30-h8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Hi,
Thanks for the info
First of all let me try to clear your confusion ..
1) at the client side as i already told you its linux-box and i am
running pppd (2.4)
ie. pppd plugin pppoatm.so 9.45 user xxxxxx password xxxxxx

now this box send LCP packets 10 times and the pppd terminates. as
there is no responder..
2) Now I need to  setup  responder (PPPoA-server i belive) my self
similar to  PPPoE-server in the case of pppoe test linuxPC.

so if you know about server  pls pass me the  info
Also we have alctel-iSAM which has only pppoa-relay and id doesnot
have server ......!


-Arun






On Wed, Jun 2, 2010 at 7:56 PM, James Carlson <carlsonj@workingcode.com> wr=
ote:
> arun b wrote:
>> On Wed, Jun 2, 2010 at 4:27 PM, James Carlson <carlsonj@workingcode.com>=
 wrote:
>>> But I think it's probably time to take a step back and ask the obvious
>>> question: can you tell us what you've got (in terms of hardware,
>>> software, and operational environment) and what you're trying to do (in
>>> as much high-level detail as possible)?
>>
>> NO I am not building it for Dslam-box. well I want to run PPPoA server
>> at remote side device where ATM path terminates.
>> I am executing this is =A0 "pppd plugin pppoatm.so 0.80
>> 192.168.1.1:192.168.1.2 passive" =A0on my client(linux-box).
>
> "passive" is a slightly surprising option to see on the "client" side of
> the connection. =A0Are you sure that's what you want? =A0And are you sure
> that 0.80 are the right VPI/VCI pair for the connection?
>
> There are two broad classes of problems that show up here: either the
> ATM link isn't working, or the PPP link on top is misconfigured. =A0What
> do you actually see when you run pppd? =A0Have you tried running with the
> "debug" option enabled? =A0What log messages are produced?
>
> If pppd is timing out in LCP with "too many" Configure-Request messages,
> then the likely culprit is the ATM configuration. =A0Otherwise, PPP might
> be involved; possibly missing authentication or L3 address information.
>
>> =A0 =A0 =A0|-| RJ-11 connector =A0 "pppd plugin pppoatm.so 0.80
>> 192.168.1.1:192.168.1.2 passive"
>
> It should be obvious, but the connection between these two machines
> _must_ be ATM, and _not_ Ethernet.
>
>> Here the server device and the configuration are unknown to me. Could
>> you help in choose the server device (Dslam, iSam like..), and
>> enabling it.
>
> If you're not the administrator for the remote end, then I have no idea
> how you might go about enabling it. =A0Won't you have to drive down to
> your ISP's offices and break in first?
>
> Or are you planning to set up your own PPPoA server ... ?
>
> I'm confused by what you're saying here.
>
>> James,
>> To your question:
>> I have MIPS based network device currently with me. And am exploring
>> all PPPoX-Client(oe/oa/...) configuration. Where I am already able to
>> test pppoe, pppoeonATm, and wanted start on PPPoS. =A0- so that we can
>> port this solution to any of the h/w.
>> Now got stoped at PPPoA !!!
>
> Do you have an ATM link to a system that runs PPPoA? =A0If so, then do you
> have configuration information (particularly VPI/VCI) for that link? =A0Is
> it a nailed-up VPI/VCI pair or is it "dialed" using UNI signaling?
>
> --
> James Carlson =A0 =A0 =A0 =A0 42.703N 71.076W =A0 =A0 =A0 =A0 <carlsonj@w=
orkingcode.com>
>
