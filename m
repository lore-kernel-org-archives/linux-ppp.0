From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Sun, 14 Feb 2021 17:07:28 +0000
Subject: Re: Configuring pppd to accept link-local IPv6 interface id from remote peer
Message-Id: <AA84019B-59D5-4A14-A113-EA4A3D0B7FED@vandijck-laurijssen.be>
List-Id: <linux-ppp.vger.kernel.org>
References: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
In-Reply-To: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org



On 14 February 2021 02:03:28 GMT+01:00, Nicholas Humfrey <njh@aelius.com> w=
rote:
>Hi,
>pppd. I am trying to use static addresses so I know the link-local IP=20
>address of the remote peer.
>
>On the 'server' I am running:
> =C2=A0 pppd file ./ppp-options ipv6 ::1,::2 /dev/ttyAMA0 115200

::1 is not a link-local ip.
::1 is 'localhost', i would advise not to use it elsewhere
Sent from a small mobile device
