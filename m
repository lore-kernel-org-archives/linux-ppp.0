From: Andy Igoshin <ai@vsu.ru>
Date: Wed, 25 Feb 2004 14:48:09 +0000
Subject: [Fwd: 2.6.x, pppd 2.4.2: Couldn't set pass-filter in kernel]
Message-Id: <403CB5A9.167E80F7@vsu.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------C166AAFDF63578A854153A6B"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org

This is a multi-part message in MIME format.
--------------C166AAFDF63578A854153A6B
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 7bit


-- 
Andy Igoshin <ai@vsu.ru>                 Voronezh State University
Phone: +7 (0732) 522406                  Network Operation Center
Fax:   +7 (0732) 208820                  Voronezh, Russia
--------------C166AAFDF63578A854153A6B
Content-Type: message/rfc822
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Return-Path: <frank@google.com>
X-Spam-Checker-Version: SpamAssassin 2.63 (2004-01-11) on info.vsu.ru
X-Spam-Level: 
X-Spam-Status: No, hits=-9.2 required=5.0 tests=BAYES_00,RCVD_IN_BSP_TRUSTED,
	UPPERCASE_25_50 autolearn=ham version=2.63
Received: from 216-239-45-4.google.com ([216.239.45.4] verified)
  by vsu.ru (CommuniGate Pro SMTP 4.1.8)
  with ESMTP-TLS id 6446729 for ai@vsu.ru; Wed, 25 Feb 2004 03:07:19 +0300
Received: from mother.corp.google.com (mother.corp.google.com [172.24.66.116])
	by 216-239-45-4.google.com (8.12.9/8.12.9) with ESMTP id i1P073Mc011732
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 24 Feb 2004 16:07:03 -0800
Received: from mother.corp.google.com (localhost.localdomain [127.0.0.1])
	by mother.corp.google.com (8.12.8/8.12.8) with ESMTP id i1P073OQ022050;
	Tue, 24 Feb 2004 16:07:03 -0800
Received: (from frank@localhost)
	by mother.corp.google.com (8.12.8/8.12.8/Submit) id i1P072ue022048;
	Tue, 24 Feb 2004 16:07:02 -0800
Date: Tue, 24 Feb 2004 16:07:02 -0800
From: Frank Cusack <fcusack@fcusack.com>
To: ai@vsu.ru
Cc: ppp-bugs@dp.samba.org
Subject: Re: 2.6.x, pppd 2.4.2: Couldn't set pass-filter in kernel
Message-ID: <20040224160701.A22042@google.com>
References: <20040223102205.734F72C04F@lists.samba.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.2.5.1i
In-Reply-To: <20040223102205.734F72C04F@lists.samba.org>; from ai@vsu.ru on Mon, Feb 23, 2004 at 10:22:05AM +0000

Kernel problem.  file a bug with your vendor.

On Mon, Feb 23, 2004 at 10:22:05AM +0000, ai@vsu.ru wrote:
> Full_Name: Andy Igoshin
> Version: 2.4.2
> OS: linux, fedora, kernel 2.6.3
> Submission from: (NULL) (62.76.169.8)
> 
> 
> Hi!
> 
> kernel 2.6.3 (2.6.x) [Linux xx 2.6.3 #1 Wed Feb 18 11:55:26 MSK 2004 i686 i686
> i386 GNU/Linux]
> pppd version 2.4.2
> glibc-kernheaders-2.4-8.43
> glibc-2.3.2-101.4
> libpcap-0.7.2-7.1
> 
> -------------------------------------------------------------------------
> syslog:
> -------
> Feb 23 12:37:09 xx pptpd[19876]: GRE: Discarding duplicate packet
> Feb 23 12:37:12 xx pptpd[19876]: CTRL: Ignored a SET LINK INFO packet with real
> ACCMs!
> 
> problem:
> Feb 23 12:37:12 xx pppd[19877]: Couldn't set pass-filter in kernel: Invalid
> argument
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> Feb 23 12:37:12 xx pppd[19877]: MPPC/MPPE 128-bit stateless compression enabled
> Feb 23 12:37:12 xx pppd[19877]: local  IP address x.x.x.x
> Feb 23 12:37:12 xx pppd[19877]: remote IP address x.x.x.x
> 
> 
> .config:
> --------
> CONFIG_PPP=m
> CONFIG_PPP_MULTILINK=y
> CONFIG_PPP_FILTER=y
> CONFIG_PPP_ASYNC=m
> CONFIG_PPP_SYNC_TTY=m
> CONFIG_PPP_DEFLATE=m
> CONFIG_PPP_BSDCOMP=m
> CONFIG_PPP_MPPE_MPPC=m
> CONFIG_PPPOE=m
> 
> 
> ppp-2.4.2/pppd/Makefile:
> ------------------------
> CHAPMS=y
> USE_CRYPT=y
> MPPE=y
> FILTER=y
> HAVE_MULTILINK=y
> USE_TDB=y
> HAS_SHADOW=y
> PLUGIN=y
> MAXOCTETS=y
> -------------------------------------------------------------------------
> 
> 
> Regards,
> 
> -- 
> Andy Igoshin <ai@vsu.ru>                 Voronezh State University
> Phone: +7 (0732) 522406                  Network Operation Center
> Fax:   +7 (0732) 208820                  Voronezh, Russia
> 

--------------C166AAFDF63578A854153A6B--

