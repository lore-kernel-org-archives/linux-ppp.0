From: Paul Mackerras <paulus@ozlabs.org>
Date: Mon, 27 May 2019 00:35:53 +0000
Subject: Re: [PATCH pppd v4] pppoe: custom host-uniq tag
Message-Id: <20190527003553.GA3380@blackberry>
List-Id: <linux-ppp.vger.kernel.org>
References: <20190504164853.4736-1-mcroce@redhat.com>
In-Reply-To: <20190504164853.4736-1-mcroce@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matteo Croce <mcroce@redhat.com>
Cc: linux-ppp@vger.kernel.org, netdev@vger.kernel.org, Jo-Philipp Wich <jo@mein.io>

On Sat, May 04, 2019 at 06:48:53PM +0200, Matteo Croce wrote:
> Add pppoe 'host-uniq' option to set an arbitrary
> host-uniq tag instead of the pppd pid.
> Some ISPs use such tag to authenticate the CPE,
> so it must be set to a proper value to connect.
> 
> Signed-off-by: Matteo Croce <mcroce@redhat.com>
> Signed-off-by: Jo-Philipp Wich <jo@mein.io>

Thanks, patch applied.

Paul.
