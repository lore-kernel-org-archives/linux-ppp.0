From: David Ahern <dsahern@gmail.com>
Date: Mon, 26 Jun 2017 04:08:12 +0000
Subject: Re: [PATCH net-next v2 4/5] net: add netlink_ext_ack argument to rtnl_link_ops.slave_changelink
Message-Id: <dd3f596b-4519-398c-a2ec-afdaf5f2f058@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <cover.1498425679.git.mschiffer@universe-factory.net>
 <498ff06f59d5ce13b2ad3e1c1902c3d348ca3c00.1498425679.git.mschiffer@universe-factory.net>
 <b097a69e-4449-b124-c39e-4dbdbae7c218@gmail.com>
In-Reply-To: <b097a69e-4449-b124-c39e-4dbdbae7c218-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Schiffer <mschiffer-Nyw9WiXk/RKXhJHkyCwd5uTW4wlIGRCZ@public.gmane.org>, dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, j.vosburgh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, vfalico-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, andy-QlMahl40kYEqcZcGjlUOXw@public.gmane.org, wg-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, pablo-Cap9r6Oaw4JrovVCs/uTlw@public.gmane.org, laforge-TgoAw6mPHtdg9hUCZPvPmw@public.gmane.org, paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org, jiri-rHqAuBHg3fBzbRFIqnYvSA@public.gmane.org, dsa-qUQiAmfTcIp+XZJcv9eMoEEOCMrvLtNR@public.gmane.org, shm-qUQiAmfTcIp+XZJcv9eMoEEOCMrvLtNR@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, stephen-OTpzqLSitTUnbdJkjeBofR2eb7JE58TQ@public.gmane.org, arvid.brodin-SVm98a2vdck@public.gmane.org, alex.aring-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, stefan-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, kuznet-v/Mj1YrvjDBInbfyfbPRSQ@public.gmane.org, jmorris-gx6/JNMH7DfYtjvyW6yDsg@public.gmane.org, yoshfuji-VfPWfsRibaP+Ru+s062T9g@public.gmane.org, kaber-dcUjhNyLwpNeoWH0uzbU5w@public.gmane.org, steffen.klassert-opNxpl+3fjRBDgjK7y7TUQ@public.gmane.org, herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org, johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org
Cc: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-can-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-ppp-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wpan-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 6/25/17 10:04 PM, David Ahern wrote:
> On 6/25/17 3:56 PM, Matthias Schiffer wrote:
>> Add support for extended error reporting.
>>
>> Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
>> ---
> 
> 
> Acked-by: David Ahern <dsahern@gmail.com>
> 

Actually, you are missing the chagne to br_port_slave_changelink.
