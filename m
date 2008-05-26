From: Paul Mackerras <paulus@samba.org>
Date: Mon, 26 May 2008 22:52:42 +0000
Subject: Re: [PATCH ppp-2.4.4] Introduce L2TP support
Message-Id: <18491.16186.196355.439430@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <483ACA26.8080506@katalix.com>
In-Reply-To: <483ACA26.8080506@katalix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Chapman writes:

> These plugins are being actively used by users of OpenL2TP and other
> L2TP daemons. Please consider for inclusion in the next release of
> pppd.

Looks OK.  I want to do a new release of pppd fairly soon, so this is
timely.

> Index: ppp-2.4.4/pppd/plugins/pppol2tp/l2tp_event.h
> =================================> --- /dev/null
> +++ ppp-2.4.4/pppd/plugins/pppol2tp/l2tp_event.h
> @@ -0,0 +1,104 @@
> +/*****************************************************************************
> + * Copyright (C) 2008 Katalix Systems Ltd
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> + *
> + *****************************************************************************/

Could you add the explicit "you can redistribute it and/or modify it..."
permission statement here please?

> + * Unfortunately, pppd provides no easy way to tell that the new link
> + * successfully attaches to the bundle. We use its new_phase_hook to
> + * watch state changes. If the new interface reaches PHASE_NETWORK,
> + * then it is up. However, pppd sets variables that we need to test
> + * _after_ it reaches PHASE_NETWORK, so we use a timer to check the
> + * variables. This is messy. It would be much easier if pppd exported
> + * a hook for multilink interface up.

So, send me a patch to do that... :)

Paul.
