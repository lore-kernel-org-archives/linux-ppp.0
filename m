From: Matteo Croce <mcroce@redhat.com>
Date: Tue, 07 May 2019 09:32:27 +0000
Subject: Re: [PATCH pppd v4] pppoe: custom host-uniq tag
Message-Id: <CAGnkfhwVvF4qcqoU6wC8tCb6vrvNipP0UG4MxqAd1--5fLmjQg@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20190504164853.4736-1-mcroce@redhat.com> <20190507091034.GA3561@jackdaw>
In-Reply-To: <20190507091034.GA3561@jackdaw>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Parkin <tparkin@katalix.com>
Cc: linux-ppp@vger.kernel.org, netdev <netdev@vger.kernel.org>, Paul Mackerras <paulus@ozlabs.org>, Jo-Philipp Wich <jo@mein.io>

On Tue, May 7, 2019 at 11:10 AM Tom Parkin <tparkin@katalix.com> wrote:
>
> Hi Matteo,
>
> On Sat, May 04, 2019 at 06:48:53PM +0200, Matteo Croce wrote:
> > Add pppoe 'host-uniq' option to set an arbitrary
> > host-uniq tag instead of the pppd pid.
> > Some ISPs use such tag to authenticate the CPE,
> > so it must be set to a proper value to connect.
> >
> > Signed-off-by: Matteo Croce <mcroce@redhat.com>
> > Signed-off-by: Jo-Philipp Wich <jo@mein.io>
> > ---
> >  pppd/plugins/rp-pppoe/common.c          | 14 +++----
> >  pppd/plugins/rp-pppoe/discovery.c       | 52 ++++++++++---------------
> >  pppd/plugins/rp-pppoe/plugin.c          | 15 ++++++-
> >  pppd/plugins/rp-pppoe/pppoe-discovery.c | 41 ++++++++++++-------
> >  pppd/plugins/rp-pppoe/pppoe.h           | 30 +++++++++++++-
> >  5 files changed, 96 insertions(+), 56 deletions(-)
> >

Hi Tom,

this was a known bug of the v3 patch, I've fixed it in the v4.

Regards,
-- 
Matteo Croce
per aspera ad upstream
