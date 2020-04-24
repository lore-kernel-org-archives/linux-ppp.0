From: =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date: Fri, 24 Apr 2020 13:47:34 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <CAPJ9Yc_iOxyDzrL9cs_ERSEjnVttYgk4JFqhO7T=yg03420LMA@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Thu, 23 Apr 2020 at 21:36, David Bala=C5=BEic <xerces9@gmail.com> wrote:
>
> OK, more data:
> I started tcpdump with the -e option as suggested on openwrt forum:
> tcpdump -e -v -i eth1.3902 pppoed
>
> on disconnect, this was logged (times are UTC):
>
>
> tcpdump: listening on eth1.3902, link-type EN10MB (Ethernet), capture
> size 262144 bytes
> 18:23:09.204991 a4:7b:2c:9e:c7:44 (oui Unknown) > 44:4e:6d:fd:c7:39
> (oui Unknown), ethertype PPPoE D (0x8863), length 97: PPPoE PADO
> [Service-Name] [AC-Name "SIMB_TABOR_BNG1"] [Host-Uniq
> 0x44************long_number******************************AA]
> [AC-Cookie ".5b************v"]

Isnt this strange? The dst addr is not my router or any other known.
Also the Host-Uniq value is different.
As if is traffic meant for someone else.
