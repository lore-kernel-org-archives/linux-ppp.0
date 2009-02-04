From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 04 Feb 2009 17:14:44 +0000
Subject: Re: IFF_RUNNING support for ppp interfaces?
Message-Id: <18825.52484.575457.272416@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <OF25BF4B49.1E3AF8FD-ONC1257551.0047CFD6-C1257551.00493095@transmode.se>
In-Reply-To: <OF25BF4B49.1E3AF8FD-ONC1257551.0047CFD6-C1257551.00493095@transmode.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Joakim Tjernlund writes:
> I wonder how IFF_RUNNING is managed in recent pppd version(s). I very much 
> like  to
> use IFF_RUNNING to see if the link working in both ends.

For most implementations, IFF_RUNNING cannot be controlled by anything
in user space (such as pppd).  Instead, it's set/cleared by the
kernel's PPP driver.

Defining "working" is difficult.  Usually, the IFF_RUNNING flag is set
if the link is either a demand link waiting for activity or if there's
an active serial link underneath the connection, and IFF_UP is set
when IPCP successfully negotiates addresses.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
