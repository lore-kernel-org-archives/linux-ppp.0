From: Paul Mackerras <paulus@samba.org>
Date: Fri, 16 Jan 2004 23:18:24 +0000
Subject: Re: ppp-2.4.2 released
Message-Id: <16392.28992.180189.928280@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
In-Reply-To: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Pasi K=E4rkk=E4inen writes:

> There's still the MTU bug (with MPPE) left..

Well, somehow we have to allow for the extra 4 bytes that MPPE adds -
and it is reasonable and valid to have the network interface MTU be
smaller than the PPP mtu/mru values.  Arguably the code that reduces
the MTU isn't expressed as well as it could be, but I'm not yet
convinced it's actually wrong.

Frank, what is your opinion?

Paul.
