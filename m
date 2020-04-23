From: Michael Richardson <mcr@sandelman.ca>
Date: Thu, 23 Apr 2020 16:01:38 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <7689.1587657698@localhost>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org


David Bala=C5=BEic <xerces9@gmail.com> wrote:
    > tcpdump: pcap_loop: The interface went down
    > 4 packets captured
    > 22 packets received by filter
    > 0 packets dropped by kernel

    > The ifconfig packet counter for the VLAN interface eth1.3902 is reset,
    > compare to values in quested message below, this is th eoutpu a few
    > minutes after the reconnect:

.. your counter reset suggests that somehow your VLAN interface is being
killed and restarted.
That's really weird.

This is openwrt?

--
]               Never tell me the odds!                 | ipv6 mesh network=
s [
]   Michael Richardson, Sandelman Software Works        |    IoT architect =
  [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails  =
  [
