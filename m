From: Chris Jensen <cjensen@gmail.com>
Date: Fri, 16 Jul 2004 03:07:01 +0000
Subject: No more auth succeeded log messages
Message-Id: <fa61edfd04071520071163c16b@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,
Previously, ppp was generating log messages like
> Jul  5 08:52:24 vpntest pppd[15519]: CHAP peer authentication succeeded for username

Which we were grepping out of the logs to see who was logging on and
when. Users are being authenticated via the radius plugin using
MS-CHAPv2.

However, the last couple of days there have been no such messages.
The kernel was upgraded from 2.4.20 to 2.6.7 at the same time this
seems to have started, and ppp was reinstalled, but I'm pretty sure it
remained at the same version (though I did have to download the
tarball again as I'd deleted it from the first install).

Is there a simple way to enable logging of CHAP usernames that I'm missing?

Thanks for any assistance.

Chris
