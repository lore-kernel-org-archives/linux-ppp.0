From: Baolin Wang <baolin.wang@linaro.org>
Date: Fri, 06 Sep 2019 06:13:02 +0000
Subject: Re: [BACKPORT 4.14.y v2 5/6] ppp: mppe: Revert "ppp: mppe: Add softdep to arc4"
Message-Id: <CAMz4kuJem-H4pPKSTDAy3vmWmYhAf-tdjH-HmZ_aN7VYXJN6mw@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <cover.1567649728.git.baolin.wang@linaro.org> <c24710bae9098ba971a2778a1a44627d5fa3ddc0.1567649729.git.baolin.wang@linaro.org>
 <20190905161642.GA5659@google.com>
In-Reply-To: <20190905161642.GA5659@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Baolin Wang <baolin.wang@linaro.org>, "# 3.4.x" <stable@vger.kernel.org>, paulus@samba.org, linux-ppp@vger.kernel.org, Networking <netdev@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Orson Zhai <orsonzhai@gmail.com>, Vincent Guittot <vincent.guittot@linaro.org>, LKML <linux-kernel@vger.kernel.org>

On Fri, 6 Sep 2019 at 00:16, Eric Biggers <ebiggers@google.com> wrote:
>
> On Thu, Sep 05, 2019 at 11:10:45AM +0800, Baolin Wang wrote:
> > From: Eric Biggers <ebiggers@google.com>
> >
> > [Upstream commit 25a09ce79639a8775244808c17282c491cff89cf]
> >
> > Commit 0e5a610b5ca5 ("ppp: mppe: switch to RC4 library interface"),
> > which was merged through the crypto tree for v5.3, changed ppp_mppe.c to
> > use the new arc4_crypt() library function rather than access RC4 through
> > the dynamic crypto_skcipher API.
> >
> > Meanwhile commit aad1dcc4f011 ("ppp: mppe: Add softdep to arc4") was
> > merged through the net tree and added a module soft-dependency on "arc4".
> >
> > The latter commit no longer makes sense because the code now uses the
> > "libarc4" module rather than "arc4", and also due to the direct use of
> > arc4_crypt(), no module soft-dependency is required.
> >
> > So revert the latter commit.
> >
> > Cc: Takashi Iwai <tiwai@suse.de>
> > Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > Signed-off-by: David S. Miller <davem@davemloft.net>
> > Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> > ---
> >  drivers/net/ppp/ppp_mppe.c |    1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/net/ppp/ppp_mppe.c b/drivers/net/ppp/ppp_mppe.c
> > index d9eda7c..6c7fd98 100644
> > --- a/drivers/net/ppp/ppp_mppe.c
> > +++ b/drivers/net/ppp/ppp_mppe.c
> > @@ -63,7 +63,6 @@
> >  MODULE_DESCRIPTION("Point-to-Point Protocol Microsoft Point-to-Point Encryption support");
> >  MODULE_LICENSE("Dual BSD/GPL");
> >  MODULE_ALIAS("ppp-compress-" __stringify(CI_MPPE));
> > -MODULE_SOFTDEP("pre: arc4");
>
> Why is this being backported?  This revert was only needed because of a
> different patch that was merged in v5.3, as I explained in the commit message.

Sorry I missed this. I should remove this patch from our product kernel too.

-- 
Baolin Wang
Best Regards
