From: Marco d'Itri <md@Linux.IT>
Date: Tue, 04 Sep 2018 13:22:26 +0000
Subject: Re: RFC: support setting DNS for systemd-resolved via DBus
Message-Id: <20180904132226.GA8826@bongo.bofh.it>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Q68bSM7Ycu6FN28Q"
List-Id: <linux-ppp.vger.kernel.org>
References: <e5fa9fe1-073c-e9c5-c774-21bc5487fe7e@iam.tj>
In-Reply-To: <e5fa9fe1-073c-e9c5-c774-21bc5487fe7e@iam.tj>
To: linux-ppp@vger.kernel.org


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sep 04, Tj <linux@iam.tj> wrote:

> After some experimentation I've put together a small C helper program
> that reads DNS[12]=3D from the helper environment and uses DBus calls to
> set the per-link nameservers.
Since this is not performance critical maybe you could just call busctl=20
=66rom a shell script?

--=20
ciao,
Marco

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGBsIcS5ipP0URKfyK/WlwSLE96QFAluOhxIACgkQK/WlwSLE
96QnSQv9H30C3skRsjvkAAauAuKpS9OcH1aYoShWpruDCM1S9jirboCJK0MXW5ta
vHjok2l+XC7S5Hva4O4h25rRKTZiGu3qhRDQE9F3B/C2oLko7sZF4j5vOgoUMu7H
1pTOx3FKQ06fQzsDaBcuWtRVQaxcfRIxnF6bU1pvivqLTYJGQbH/g475y+ImGyzg
VvZVHN96Ddcw0DhY6RSNrVrX5QWT6jiITbtp0mMxyaLtUHRR8728+DZrhBWOBQa+
4Ca4NyKv31t/2pdomWS2vxE9VcTgbey48+Z/n2iAqZKzDvfdf7EjrfVCiPCczWUE
sr+edvkQcrT0InAXBGMWYScmew3kfJcW0LlkvpTJXmrXg6IMNXJbqUqyqaG9S43O
Tg9PfH+fJ+MofUgY1KF71m+FIsM/Kdh5cF8d1ldoQikoJhMAkHHbEmzcd7WoMA/F
qQY6vV11GS1FJAML+G6DXZDIKb87o6cG+zNSlS/tiDMRlMazhng7yjfclv64caWa
gs1YHW1x
=eTdh
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
