From: Paul Mackerras <paulus@samba.org>
Date: Fri, 16 Jan 2004 22:57:09 +0000
Subject: Re: ppp-2.4.2 released
Message-Id: <16392.27717.712012.77909@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
In-Reply-To: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Clive Nicolson writes:

> http://ftp.samba.org/ftp/ppp/ppp-2.4.2.tar.gz does not appear to be a valid URL.

Sorry, use www.samba.org instead.

> and
> 
> ftp://ftp.samba.org/pub/ppp/ppp-2.4.2.tar.gz will not build "out of the box"
> under linux as <pcap.h> is not found by pcap-int.h .

It builds out of the box on my Debian sid box - you need the
libpcap-dev package installed though.  If you really don't have
pcap.h, set FILTER=n in pppd/Makefile.linux.

Paul.
