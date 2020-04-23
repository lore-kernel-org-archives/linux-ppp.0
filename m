From: Michael Richardson <mcr@sandelman.ca>
Date: Thu, 23 Apr 2020 15:59:55 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <7221.1587657595@localhost>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org


David Bala=C5=BEic <xerces9@gmail.com> wrote:
    > Also: the IPv6 address (the part derived from hwaddr) starts with c6
    > instead of c4 like the actual hw address. Is that normal?

There is a bit in the IPv6 IID (bit 2), which is the L/G bit, and says if t=
he
IID is considered globally unique.

--
]               Never tell me the odds!                 | ipv6 mesh network=
s [
]   Michael Richardson, Sandelman Software Works        |    IoT architect =
  [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails  =
  [
