From: Arvin Schnell <arvin@suse.de>
Date: Fri, 16 Jan 2004 16:21:37 +0000
Subject: Re: ppp-2.4.2 released
Message-Id: <20040116162137.GA24654@suse.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
In-Reply-To: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Sat, Jan 17, 2004 at 01:16:21AM +1300, Clive Nicolson wrote:
> http://ftp.samba.org/ftp/ppp/ppp-2.4.2.tar.gz does not appear to be a valid URL.
> 
> and
> 
> ftp://ftp.samba.org/pub/ppp/ppp-2.4.2.tar.gz will not build "out of the box"
> under linux as <pcap.h> is not found by pcap-int.h .

You need to install libpcap or disable filter support (see
Makefile.linux).

ciao Arvin

-- 
Dipl.-Phys. Arvin Schnell
SuSE Linux AG
Research & Development
email: arvin@suse.de
