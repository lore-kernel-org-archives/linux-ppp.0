From: Florent Capdeville <Florent.capdeville+from@free.fr.invalid>
Date: Sun, 07 Mar 2004 14:51:08 +0000
Subject: Re: active-filter
Message-Id: <871xo4d82r.fsf@athena.flo.fr.invalid>
List-Id: <linux-ppp.vger.kernel.org>
References: <3d9ff3e0e9.3e0e93d9ff@euskalnet.net>
In-Reply-To: <3d9ff3e0e9.3e0e93d9ff@euskalnet.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

tatel@euskalnet.net writes:

> Hi, 

Hello

> I'm trying to set an active-filter expression for on-demand, but I'm
> really stuck with. I can't get effective help from neither from
> documentation neither from user mailing lists.
Same for me, so I used to add:

"active-filter 'not ((port 135) or (port 137))'" 

I think the key for you is "*not*" 

> Problem is people scanning (mostly) netBIOS ports. These packets (I
> think) are holding the link up by resetting idle-timeout to zero.
>
> I'm using woody with ppp 2.4.1 from debs and compiled kernel with
> filtering option enabled
>
> If I set something like "active-filter 'inbound port 135'" I get a parse
> error message. This stucks me since man tcpdump says inbound is for ppp
> connections.

In fact , I think "inbound" is sufficient by itself...

> If I set something like "active-filter 'dst port 135'" there is no parse
> error message, but modem dials nothing
>
> Does anybody know an appropiate active-filter expression?

In order to prevent any unwanted incoming packet to keep the link up
(netbios scan, and as I have a Dial-up I sometimes get a former
P2P-user  IP), I now use:

active-filter 'not (inbound)'

> Thanks a lot

Regards
