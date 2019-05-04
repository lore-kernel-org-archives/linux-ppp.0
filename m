From: Matteo Croce <mcroce@redhat.com>
Date: Sat, 04 May 2019 15:19:13 +0000
Subject: Re: [PATCH v4] pppoe: custom host-uniq tag
Message-Id: <CAGnkfhyvakY7cV=qKSrVhoEvWRa855pXJua-042qbjX7GvxXQg@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Fri, Nov 23, 2018 at 7:41 PM Matteo Croce <mcroce@redhat.com> wrote:
>
> Add pppoe 'host-uniq' option to set an arbitrary
> host-uniq tag instead of the pppd pid.
> Some ISPs use such tag to authenticate the CPE,
> so it must be set to a proper value to connect.
>
> Signed-off-by: Matteo Croce <mcroce@redhat.com>
> Signed-off-by: Jo-Philipp Wich <jow@openwrt.org>

Ping, any update? I'm sending this to netdev too, in case this list is outdated

-- 
Matteo Croce
per aspera ad upstream
