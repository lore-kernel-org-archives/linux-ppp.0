From: =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date: Mon, 27 Apr 2020 23:34:01 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <CAPJ9Yc_kHZKCSG7o7YtU7YCvAF4+OPm9MJzYK12mmQOg5FQD2w@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Fri, 24 Apr 2020 at 17:55, Guillaume Nault <gnault@redhat.com> wrote:
> You can monitor the evolution of you network devices with rtmon:
> $ rtmon file ./some/file.log link
>
> Then read it with ip monitor:
> $ ip monitor file ./some/file.log
>
> That should tell if eth1.3902 is ever passed down or even deleted.

rtmon does not seem to be available on openwrt. It is part of iproute2, right?

Are there any alternatives?
(until I find or compile it myself...)

Regards,
David
