From: Paul Mackerras <paulus@samba.org>
Date: Tue, 20 Sep 2005 10:39:40 +0000
Subject: Re: ppp-2.4.4b1 released
Message-Id: <17199.59116.912970.744868@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <17170.31900.251643.605643@cargo.ozlabs.ibm.com>
In-Reply-To: <17170.31900.251643.605643@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Pasi K=E4rkk=E4inen writes:

> I wonder if I am in some kind of blocklist or so..=20

No, it's just that ppp is a lower priority for me than some of the
other things I have to do.

> please comment about this
> patch!

I don't like the gratuitous and incorrect whitespace changes.

You are calling the dns and wins hooks in ipcp_resetci, which means
they will get called every time ipcp negotiation is started - is this
what you meant?  Surely they only need to get called once, after the
user is authenticated?

In radius_set_dns and radius_set_wins you compute a return value which
is then never used - why do you bother?

Paul.
