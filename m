From: Eivind Naess <enaess@gmail.com>
Date: Fri, 17 Apr 2020 20:50:36 +0000
Subject: Re: [PATCH] Adding EAP-MSCHAPv2 support
Message-Id: <CAKuzOkgM7Zrx35bOrKzDCefxXY3M4EdOuCYhx1Ot-wciJAjYWA@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAKuzOkiM0Z9DV9LofTtgAi3bEfxzqk0BLm-QpQq0CLHVdT5aAw@mail.gmail.com>
In-Reply-To: <CAKuzOkiM0Z9DV9LofTtgAi3bEfxzqk0BLm-QpQq0CLHVdT5aAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

The RFC draft maybe long expired, but Microsoft still has EAP-MSCHAPv2
enabled by default settings. The problem is that if EAP gets
negotiated (because the client supports it), EAP-MSCHAPv2 will
typically be selected. A workaround would be to disable EAP
negotiation on the client side to allow MSCHAPv2 to be selected and
that be only if the Microsoft server is configured to allow that. It's
mostly a compatibility problem for end-users, especially when using
SSTP.

Regards,
- Eivind


On Fri, Apr 3, 2020 at 8:27 AM James Carlson <carlsonj@workingcode.com> wrote:
>
> On 2020-04-03 11:09, Eivind Naess wrote:
> > Implementation based on the RFC: draft-kamath-pppext-eap-mschapv2-02.
> > Adding support for MSCHAPv2 inside the extensible authentication protocol (EAP).
> >
> > Author: Thomas Omerzu <thomas@omerzu.de>
> > Origin: https://w3logistics.com/blog/archives/438-EAP-MSCHAPv2-for-pppd-2-4-7.html
> > Bug: https://github.com/paulusmack/ppp/issues/138
> > Bug-Ubuntu: https://bugs.launchpad.net/ubuntu/+source/ppp/+bug/1858349
> > Pull Request: https://github.com/paulusmack/ppp/pull/139
> > Last-Update: 2020-02-24
> > Signed-off-by: Thomas Omerzu <thomas@omerzu.de>.
>
> This all seems ok to me, but I do have one nit: that document referenced
> is a long-expired Internet Draft, not an RFC.  As far as I know, there
> are no RFCs that cover Microsoft's foray into this area.
>
> --
> James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>



-- 
Cheers,
- Eivind
