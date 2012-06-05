From: Daniel Golle <dgolle@allnet.de>
Date: Tue, 05 Jun 2012 17:02:39 +0000
Subject: Re: Upcoming 2.4.6 release
Message-Id: <4FCE3BAF.10604@allnet.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <20120602100037.GE17089@pale.ozlabs.ibm.com>
In-Reply-To: <20120602100037.GE17089@pale.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi everyone,

I guess you are aware of
https://dev.openwrt.org/browser/trunk/package/ppp/patches

Just as I haven't encountered any of them on git://ozlabs.org/~paulus/ppp.git

Most of them make sense and apply cleanly, few are OpenWrt-specific.

I'd suggest importing:
100-debian_ip-ip_option.patch
101-debian_close_dev_ppp.patch
103-debian_fix_link_pidfile.patch
105-debian_demand.patch
106-debian_stripMSdomain.patch
107-debian_pppatm_cleanup.patch
110-debian_defaultroute.patch
120-debian_ipv6_updown_option.patch
202-no_strip.patch
203-opt_flags.patch
204-radius_config.patch
205-no_exponential_timeout.patch
206-compensate_time_change.patch
207-lcp_mtu_max.patch
208-fix_status_code.patch
300-filter-pcap-includes-lib.patch
310-precompile_filter.patch
320-custom_iface_names.patch
330-retain_foreign_default_routes.patch
340-populate_default_gateway.patch
400-simplify_kernel_checks.patch
404-remove_obsolete_protocol_names.patch
430-pppol2tpv3-struct.patch


Cheers

Daniel
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJPzjuvAAoJEDy9cKN/1Et0Y80P+gJS7HmAvkh5cMc2dgmF87X5
jVMu4irWuymoZBRY+526fdQeQTWozfyFgzsFWX009XA/XbYW6pJHC9lPFSlWWNnp
Ps5pCpNNWOxHQiOw3beLfwycwRxXFTGyRXMnvBGVa4pQrEMh6O+wKAGDnQkHWSLk
2bsZ8I4o1fVFhx1udwFvhLDTvltttBp1Bgglb54r4cHPBb6wuFvGIhzF713zrwdA
OpwCp1cn1aqBAP3ChFJJyu7x/nKXX2VAyYDOKaYpPvXd4GA8cqzcOLgpQrNdcKD1
+KSS8Ujx61E+TdBO7Yfi895L395B2hXh8HApLxuG5i63IVBS9F0i15wcQaAxnlaI
2YaxdPVzl2YPtakAqsklasgEHNmc8MwVoMFCqgRK8rfe6UcyoBuRv5LgkHTJ2ia4
P+sQxV9BvzoqwWEndvaWADZ5hyVkeurqKLJ+ZvotZ1mE+Q8YcJ+jc2Y/FCq1MEdN
0CNKYwstV1jFjYIrwbv6UHu+P3z8C+ASKeo4N2FUZ+nJt0hBNhm9DPUD3zGTgNd0
Lexc8hi1aQ9XPcoFPHtI5F6Pzd8YQcA5B+0LrlXnlCJI2f7WJ4Qdmph4DwEBaatY
3tibO7FYY/S9vszkxbrGnSmj67zxcxRf1iLl/WWbd3beDnziLyjnI6gJ5o2sRwgV
zI4pSOrP2VlxDnIlkB//
=qcTl
-----END PGP SIGNATURE-----
