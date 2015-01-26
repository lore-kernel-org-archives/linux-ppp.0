From: Bill Unruh <unruh@physics.ubc.ca>
Date: Mon, 26 Jan 2015 16:57:44 +0000
Subject: Re: multiple pppd instances -- resolv.conf challenges and suggested improvement
Message-Id: <alpine.LMD.2.02.1501260855500.30342@info.physics.ubc.ca>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="1737365482-106911187-1422291464=:30342"
List-Id: <linux-ppp.vger.kernel.org>
References: <68DDEA33-3E3A-456B-BFF4-14209A181864@nowonline.co.uk>
In-Reply-To: <68DDEA33-3E3A-456B-BFF4-14209A181864@nowonline.co.uk>
To: linux-ppp@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1737365482-106911187-1422291464=:30342
Content-Type: TEXT/PLAIN; charset=utf-8; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE

Your proposal already exists. That was why it was made /etc/ppp/resolv.conf=
=2E
You simply do not make a link from /etc/resolv.conf to /etc/ppp/resolv.conf
and your system will not use /etc/ppp/resolv.conf. The system itself always
uses /etc/resolv.conf, so you have to work to make it use
/etc/ppp/resolv.conf.


On Mon, 26 Jan 2015, Lee Essen wrote:

> Hi,
>
> I=E2=80=99ve hit a bit of a challenge with the way that pppd creates the =
resolv.conf file.
>
> Basically if you want to get dns servers from the other side you need =E2=
=80=98usepeerdns=E2=80=99 set.
>
> If you set =E2=80=98usepeerdns=E2=80=99 then pppd will create resolve.con=
f (/etc/ppp/resolv.conf as standard, although changed in many dists)
>
> The challenge is that if you have two pppd=E2=80=99s running, both gettin=
g DNS entries, then there is no way to specify a different file (so that yo=
u can be clever later) and the given file will be overwritten by the most r=
ecent connection. Also, with buiildroot builds the path is set to /etc/reso=
lv.conf which causes even more of a problem since you can=E2=80=99t =E2=80=
=98usepeerdns=E2=80=99 without making your system use the provided resolver=
s.
>
> It does feel wrong that just about every other aspect of pppd supports is=
olated multiple connections, but the resolv.conf file is a single path that=
 will get overwritten by the last connection, and then, of course, if that =
connection drops the file is then incorrect!
>
> Could I suggest a =E2=80=98noresolv=E2=80=99 config option that simply su=
ppresses the creation of the resolve.conf file?  It=E2=80=99s a very simple=
 patch, has no compatibility issues with existing configuration and makes i=
t possible to use ppp-up scripts to do the heavy lifting with no conflictin=
g resolv.conf creations. This would also allow buildroot users to avoid the=
 =E2=80=9Cforced use of peer dns=E2=80=9D.
>
> (The other option would be to have a configurable path for resolv.conf)
>
> Cheers,
>
> Lee.
>
>
> diff -Naur pppd-orig/pppd/ipcp.c pppd-2.4.7/pppd/ipcp.c
> --- pppd-orig/pppd/ipcp.c=092014-08-09 13:31:39.000000000 +0100
> +++ pppd-2.4.7/pppd/ipcp.c=092015-01-26 07:27:04.758264172 +0000
> @@ -91,6 +91,7 @@
> static int default_route_set[NUM_PPP];=09/* Have set up a default route *=
/
> static int proxy_arp_set[NUM_PPP];=09/* Have created proxy arp entry */
> static bool usepeerdns;=09=09=09/* Ask peer for DNS addrs */
> +static bool noresolv;=09=09=09/* Don't write resolv.conf */
> static int ipcp_is_up;=09=09=09/* have called np_up() */
> static int ipcp_is_open;=09=09/* haven't called np_finished() */
> static bool ask_for_local;=09=09/* request our address from peer */
> @@ -209,6 +210,8 @@
>
>     { "usepeerdns", o_bool, &usepeerdns,
>       "Ask peer for DNS address(es)", 1 },
> +    { "noresolv", o_bool, &noresolv,
> +      "disable creation of the resolv.conf file", 1 },
>
>     { "netmask", o_special, (void *)setnetmask,
>       "set netmask", OPT_PRIO | OPT_A2STRVAL | OPT_STATIC, netmask_str },
> @@ -1827,6 +1830,7 @@
> =09script_setenv("DNS2", ip_ntoa(go->dnsaddr[1]), 0);
>     if (usepeerdns && (go->dnsaddr[0] || go->dnsaddr[1])) {
> =09script_setenv("USEPEERDNS", "1", 0);
> +=09if (!noresolv)
> =09create_resolv(go->dnsaddr[0], go->dnsaddr[1]);
>     }
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
--1737365482-106911187-1422291464=:30342--
