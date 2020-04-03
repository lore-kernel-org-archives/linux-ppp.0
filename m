From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 03 Apr 2020 15:27:22 +0000
Subject: Re: [PATCH] Adding EAP-MSCHAPv2 support
Message-Id: <f8639224-8bc6-dc08-f6f9-fff5caa3e148@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAKuzOkiM0Z9DV9LofTtgAi3bEfxzqk0BLm-QpQq0CLHVdT5aAw@mail.gmail.com>
In-Reply-To: <CAKuzOkiM0Z9DV9LofTtgAi3bEfxzqk0BLm-QpQq0CLHVdT5aAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 2020-04-03 11:09, Eivind Naess wrote:
> Implementation based on the RFC: draft-kamath-pppext-eap-mschapv2-02.
> Adding support for MSCHAPv2 inside the extensible authentication protocol (EAP).
> 
> Author: Thomas Omerzu <thomas@omerzu.de>
> Origin: https://w3logistics.com/blog/archives/438-EAP-MSCHAPv2-for-pppd-2-4-7.html
> Bug: https://github.com/paulusmack/ppp/issues/138
> Bug-Ubuntu: https://bugs.launchpad.net/ubuntu/+source/ppp/+bug/1858349
> Pull Request: https://github.com/paulusmack/ppp/pull/139
> Last-Update: 2020-02-24
> Signed-off-by: Thomas Omerzu <thomas@omerzu.de>.

This all seems ok to me, but I do have one nit: that document referenced
is a long-expired Internet Draft, not an RFC.  As far as I know, there
are no RFCs that cover Microsoft's foray into this area.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
