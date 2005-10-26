From: Gregory Colpart <gcolpart@evolix.net>
Date: Wed, 26 Oct 2005 22:36:53 +0000
Subject: Re: Error message with persist option
Message-Id: <20051026223653.GB26094@test-scsi>
List-Id: <linux-ppp.vger.kernel.org>
References: <20051026194149.GA17341@test-scsi>
In-Reply-To: <20051026194149.GA17341@test-scsi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, Oct 26, 2005 at 10:18:18PM +0200, Gilles Espinasse wrote:
> with ppp-2.4.3 version, is it the debian package or standard ppp-2.4.3
> There is numerous ppp-2.4.3 flavour including some patches wich may help.
> You should try with the debian package or with ppp-2.4.4b1 wich should
> include all those fixes.

Yes, I use debian package then debian patches and this doesn't
fix my bug. I will try with version 2.4.4b1.

> > 21:00:03 pppd[29191]: Couldn't increase MTU to 1500. Using 1492
> > 21:00:03 pppd[29191]: Couldn't increase MRU to 1500. Using 1492
> I don't know for ipv6 but with ipv4,you could remove MTU/MRU92
> This is only necessary with PPPoE and not PPPoA

Yes, no problem with IPv4. I use MTU/MRU92 for IPv6 because I have
a problem with PMTU Discovery. PMTU Discovery works fine when I use
tracepath6 util but with real IPv6 connection, it seems broken...
I have no time to investigate this problem yet. 

Thanks,
-- 
Gregory Colpart <reg@evolix.fr>  GnuPG:1024D/C1027A0E
Evolix - Informatique et Logiciels Libres http://www.evolix.fr
