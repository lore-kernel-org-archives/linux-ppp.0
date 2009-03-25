From: Alexey Mahotkin <squadette@gmail.com>
Date: Wed, 25 Mar 2009 15:52:25 +0000
Subject: Re: [PATCH] three patches from Fedora to current pppd
Message-Id: <bb5b640b0903250852q154f3c01u4d781f687a2e1cfb@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <bb5b640b0903250733s7d8f5b4ewf37b22620bbfcce2@mail.gmail.com>
In-Reply-To: <bb5b640b0903250733s7d8f5b4ewf37b22620bbfcce2@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

Four more patches, three of them documentation only:

commit cba658eac20fd0752aff4fdc260680ce35addd29
Author: Alexey Mahotkin <squadette@gmail.com>
Date:   Wed Mar 25 18:31:37 2009 +0300

    Configuration hints (taken from Debian patch pppoe_readme)

commit f92d3e7ad903e45d103b9a2c9d2d2097b928ff27
Author: Martin Lottermoser <Martin.Lottermoser@t-online.de>
Date:   Wed Mar 25 18:30:18 2009 +0300

    Subject: Bug#308136: Debian bug 308136 (SEGV in pppd)

    The function update_db_entry() may only be called if pppdb is not NULL;
    unfortunately in this situation it is. Other calls to update_db_entry()
    are protected against this, see, e.g., the end of script_setenv().

commit e007f97c2d298302d7ab02ce17edd1dfdd623b64
Author: Alexey Mahotkin <squadette@gmail.com>
Date:   Wed Mar 25 18:10:43 2009 +0300

    Debian patch zzz_man_typos to fix some typos in man pages. By A. Costa.
    (Closes Debian bugs: #301928, #302674)

commit 8024d289266bc1a9f4b911bae6a7cb2d1563a0ca
Author: Alexey Mahotkin <squadette@gmail.com>
Date:   Wed Mar 25 17:50:14 2009 +0300

    Fix formatting

    Reported by Peter Lyall Easthope



On Wed, Mar 25, 2009 at 5:33 PM, Alexey Mahotkin <squadette@gmail.com> wrote:
> hi,
>
> We're working on some updates to Radius plugin, and I think it could
> be useful to incorporate three outstanding patches from Fedora:
>
> commit 4cb4db1ea790357444fd63b68f28e66eed6f8a86
> Author: David Woodhouse <dwmw2@redhat.com>
> Date:   Wed Mar 25 17:11:28 2009 +0300
>
>    Implement ipv6cp-accept-remote, and document ipv6cp-accept-*
>
>    (Taken from Fedora ppp-2.4.3-ipv6-accept-remote.patch)
>
> commit 0a1b2cf863ac90559e1656c947ffae736fd9f61e
> Author: Thomas Woerner <twoerner@redhat.com>
> Date:   Wed Mar 25 17:05:07 2009 +0300
>
>    Fix compilation warnings and unused headers
>
>    (taken from ppp-2.4.3-fix.patch in Fedora RPM)
>
> commit ca8da3bf33f5bce8e1719aca77e69779eb19c97e
> Author: Alexey Mahotkin <squadette@gmail.com>
> Date:   Wed Mar 25 16:57:07 2009 +0300
>
>    Remove unused code
>
>    Fedora even patches this code in ppp-2.4.1-varargs.patch, even
> though it is not used
>
> The tree is available here:
> http://github.com/squadette/pppd/commits/for-upstream/ (for-upstream
> branch in git://github.com/squadette/pppd.git).
>
> Thank you,
>
> --
> Alexey Mahotkin
> http://squadette.ru/
>



-- 
Алексей Махоткин
http://squadette.ru/
