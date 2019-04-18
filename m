From: Al Viro <viro@zeniv.linux.org.uk>
Date: Thu, 18 Apr 2019 05:57:15 +0000
Subject: Re: [PATCH v3 02/26] compat_ioctl: move simple ppp command handling into driver
Message-Id: <20190418055715.GC2217@ZenIV.linux.org.uk>
List-Id: <linux-ppp.vger.kernel.org>
References: <20190416202013.4034148-1-arnd@arndb.de>
 <20190416202013.4034148-3-arnd@arndb.de>
 <20190417211303.GU2217@ZenIV.linux.org.uk>
 <CAK8P3a1tiRew6uqegUXsKbNQG7=sPVFMY3yXf0M7OjJdkxM=_g@mail.gmail.com>
 <20190417235300.GB2217@ZenIV.linux.org.uk>
In-Reply-To: <20190417235300.GB2217@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, y2038 Mailman List <y2038@lists.linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>, Michal Ostrowski <mostrows@earthlink.net>, Dmitry Kozlov <xeb@mail.ru>, James Chapman <jchapman@katalix.com>, linux-ppp@vger.kernel.org, Networking <netdev@vger.kernel.org>

On Thu, Apr 18, 2019 at 12:53:00AM +0100, Al Viro wrote:

> Why would you want to duplicate large chunks of anything?
> The above is not even compile-tested, but...  I can put
> together a patch if you wish.  Or am I missing something
> here?

Actually, there's another broken part - pppox.  And that one
is nastier - you've just lost everything outside of protocol
family ioctls on those sockets.  Try e.g.  SIOCGIFMTU in 32bit
process on those.

We really can't reuse native ->ioctl() there - proto family
->compat_ioctl() *must* return -ENOIOCTLCMD on everything it
doesn't handle.
