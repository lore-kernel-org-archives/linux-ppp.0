From: Edwardo Garcia <wdgarc88@gmail.com>
Date: Mon, 07 Sep 2015 06:46:36 +0000
Subject: Re: pppd, pptpd and radius DNS assigns
Message-Id: <CANso6eEW3=v2Bs08KG_gyRagwpL3ArxW+wArZT+OFpP731uA3Q@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CANso6eGvSYC8WdCD5d7ZXVqb+RQhS4BXz69ZxQX2QQ8YuQ1Yew@mail.gmail.com>
In-Reply-To: <CANso6eGvSYC8WdCD5d7ZXVqb+RQhS4BXz69ZxQX2QQ8YuQ1Yew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Nobody?


On 9/3/15, Edwardo Garcia <wdgarc88@gmail.com> wrote:
> Hello,
>
> Trying to get DNS assignments from radius for remote users, I have verified
> that
> freeradius is sending the MS-Primary/Secondary-DNS-Server attributes
> along with all other attributes so I satisfy not a freeradius
> problem.
>
> I have include dictionary.microsoft and dictionary.merit in
> radiusclient from freeradius-client 1.1.7, pptpd v1.4 and pppd 2.4.7,
>
> if I use ms-dns in options file it assigns DNS servers, but for our
> new network project we need radius to assign them for project reasons,
> but the poptop client/pppd ignores, so not sure how to get ppptd/pppd
> to accept this value and send it to remote userrs, apparently pppd
> source code shows it know these attributes but does not take/use?
>
> I try strace but it not too helpful, maybe  I miss an option to make
> pppd do this?
>
> /etc/ppp/options.ppptd contain:
> name pptpd
> lock
> refuse-pap
> refuse-chap
> refuse-mschap
> require-mschap-v2
> require-mppe-128
> proxyarp
> nobsdcomp
> novj
> novjccomp
> nologfd
> mtu 1300
> mru 1300
> plugin radius.so
> plugin radattr.so
>
>
> and /etc/pptpd.conf
> localip x.x.x.x
> option /etc/ppp/options.pptpd
> ppp /usr/sbin/pppd
> noipparam
> delegate
> connections 2000
>
>
> Willy
>
