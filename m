From: Richard Hartmann <richih.mailinglist@gmail.com>
Date: Tue, 01 Jun 2010 11:28:59 +0000
Subject: Re: [Patch] fix packet loss and massive ping spikes with PPP
Message-Id: <AANLkTinpsIs7qMSpQ78fWCTHh03iLBIwRlsU7sqJau08@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <2d460de71003260850x7f90d04cy79ac853464108182@mail.gmail.com>
	<20100326160226.0159ac3b@lxorguk.ukuu.org.uk>
	<4BACE827.4070006@gmail.com>
	<20100326170428.6c1ad66c@lxorguk.ukuu.org.uk>
	<4BB31E00.8060204@netservers.co.uk>
	<20100529021624.GA2538@brick.ozlabs.ibm.com>
	<AANLkTil7fk_ikrSPiZnqcJSLGCrzcCrCwbeuUMY5Yu5v@mail.gmail.com>
	<4C04ECA3.1080905@netservers.co.uk>
In-Reply-To: <4C04ECA3.1080905@netservers.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Ben McKeegan <ben@netservers.co.uk>
Cc: Paul Mackerras <paulus@samba.org>, netdev@vger.kernel.org, linux-ppp@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>, "Alexander E. Patrakov" <patrakov@gmail.com>, linux-kernel@vger.kernel.org

On Tue, Jun 1, 2010 at 13:18, Ben McKeegan <ben@netservers.co.uk> wrote:

> This isn't really a bug fix. =C2=A0Its a behavioural change to work aroun=
d poor
> quality/mismatched underlying PPP channels.

Maybe not a bug in the Linux kernel itself, but certainly in the real world
that exists around Linux. Similar to how a change to a device driver that
is needed to work around broken hardware is a bug fix, imo.


RIchard
