From: Nicholas Humfrey <njh@aelius.com>
Date: Thu, 18 Feb 2021 00:18:17 +0000
Subject: Re: Configuring pppd to accept link-local IPv6 interface id from remote peer
Message-Id: <105ed7cd-8245-37ba-2018-ed7e947026e9@aelius.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
In-Reply-To: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org


On 16/02/2021 10:04, Benjamin Cama wrote:
> Hi Nicholas,
>
> [Cc'ing the list if I may, as it may be useful]

Whoops. I had meant to CC the list.


> It seems it keeps sending ConfReq for the zero identifier=E2=80=A6 strang=
e.
> Here is the output with the patched version from last june when I wrote
> it, latest git at the time (some time after 2.4.8), which works

Hm! I will try testing against an older version in git...


Now that I know that it isn't just that I haven't found the right=20
option, I decided to raise a Github issue here:

https://github.com/paulusmack/ppp/issues/256


nick.

