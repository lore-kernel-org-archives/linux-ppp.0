From: "Gilles Espinasse" <g.esp@free.fr>
Date: Tue, 14 Sep 2004 21:18:07 +0000
Subject: Re: pppd Filtering
Message-Id: <079601c49aa0$54f0d250$f9b5a8c0@PII350>
List-Id: <linux-ppp.vger.kernel.org>
References: <0bb901c49715$f4272510$0300a8c0@neilw>
In-Reply-To: <0bb901c49715$f4272510$0300a8c0@neilw>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

> >I have also tried using different syntax's, including adding "inbound" or
> > "outbound", and I get the following error. "pppd: error in active-filter
> > expression: inbound/outbound not supported on linktype 0"

If your distrib use libpcap0.8.3, you may need to patch libpcap with this
one line patch
http://cvs.sourceforge.net/viewcvs.py/ipcop/ipcop/src/patches/Attic/libpcap-0.8.3-ppp.patch?rev=1.1.2.1&only_with_tag=IPCOP_v1_4_0&view=markup

To set active-filter rules, you could use the rule like in this subject
http://marc.theaimsgroup.com/?l=ipcop-user&m5289571806648&w=2
and adjust to 445

