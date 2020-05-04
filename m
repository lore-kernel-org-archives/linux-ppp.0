From: =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date: Mon, 04 May 2020 16:36:48 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <CAPJ9Yc_kvqAD5d1XJGQmzVC5d8_HXtp5aH-4OSyqBXDLu1Na8g@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, 4 May 2020 at 15:01, Guillaume Nault <gnault@redhat.com> wrote:
> You can use "%pM" for printing MAC addresses. Also, it'd be interesting
> to have information about promisc mode:
>   "dev %s, flags: %#x, promiscuity %u",
>   dev->name, dev->flags, dev->promiscuity,

"ifdown wan" triggers a PADT response from the server, and then this
code prints:

 dev eth1.3902, flags: 0x1003, promiscuity 0

I'll report later values printed when a stray PADT appears.

Regards,
David
