From: arun b <arun.s.bailur@gmail.com>
Date: Wed, 02 Jun 2010 07:58:35 +0000
Subject: Re: PPPoA server setup how to?
Message-Id: <AANLkTimzp_HdiasOUPnBqY35xa_wjOQr5qFP8bqRmPlz@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTikV_j1ajMThiB8B6DoaZpZ4fhlIRVVk2jK30-h8@mail.gmail.com>
In-Reply-To: <AANLkTikV_j1ajMThiB8B6DoaZpZ4fhlIRVVk2jK30-h8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Tue, Jun 1, 2010 at 8:40 PM, James Carlson <carlsonj@workingcode.com> wr=
ote:
> arun b wrote:
>> All,
>> How to we test PPPoA using pppd deemon...
>> I mean to understand the remote-server setup ?
>> what devie has the pppoa server and =A0how is the iintial hannd shake ?
>> =A0does this go with sequence of PADI, PADO,PADS .....etc... sequec?
>
> Are you looking for PPPoA or PPPoE? =A0What hardware do you have?
>
> PPP over ATM just uses ATM-related drivers and runs regular PPP.
>
> PPPoE is quite different. =A0It runs over Ethernet and uses a separate
> protocol to set up the point-to-point virtual link. =A0The messages you're
> referring to (PADI, and so on) are parts of the PPPoE protocol.
>
> --

Hi James,
Thanks for the info ..
Well I am looking for PPPoA explicitly, which basically uses
pppoatm.ko-driver module and pppoatm.so-lib along with pppd-deamon.
As explained above is being my client setup which I execute on, Now my
trouble/doubts is How/where to run PPPoA-server and on what device, Is
there a standard device/software available (Such as DSLAM, ISAM..etc).
Which can respond to the PPPoA-client (linux-box) packet and establish
the ppp-interface.

Pls do let me know any possible info related to this. Secondly also
any means of server configuration details.

Well I coated this (PADI, PADO,...) because, wanted to know does PPPoA
also follows these message sequence or it has new set of sequence ?

Thanks again,
Arun
