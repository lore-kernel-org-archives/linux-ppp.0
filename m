From: =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date: Mon, 08 Jun 2020 21:32:16 +0000
Subject: Re: PPP cycling between UP and DOWN
Message-Id: <CAPJ9Yc8JBJ+x4L2B=Mo6HFSm3q5YHBrG256Czpqx0WAKB0hQbw@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <f44e7e14-1621-7141-66a3-3a2218e8db86@mahan.org>
In-Reply-To: <f44e7e14-1621-7141-66a3-3a2218e8db86@mahan.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, 8 Jun 2020 at 19:16, James Carlson <carlsonj@workingcode.com> wrote:
> "Modem hangup" means that PPPoE, not PPP, shut down this link.  It would
> be a completely wild guess -- I know the pppd code fairly well, but I
> don't know the separate rp-pppoe code too well at all -- but it's
> possible that this user was bit by the same stray PADT problem that
> someone reported earlier on this list.  Or maybe not.

RP-PPPOE has that bug fixed for quite a while.

(I reported that PADT problem)

Regards,
David
