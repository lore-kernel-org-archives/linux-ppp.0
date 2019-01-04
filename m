From: Matteo Croce <mcroce@redhat.com>
Date: Fri, 04 Jan 2019 21:17:27 +0000
Subject: Re: [PATCH v4] pppoe: custom host-uniq tag
Message-Id: <CAGnkfhwY1QqrNDdcqCyskZhrNmScyFCCS63ko_2dJ2-8_dV9BA@mail.gmail.com>
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
> ---
> changes from v3:
>  fix a buffer overflow
>  document the new option in the help message
>

Ping, any objection to this v4?

-- 
Matteo Croce
per aspera ad upstream
