From: Bill Unruh <unruh@physics.ubc.ca>
Date: Fri, 16 Jan 2004 23:18:04 +0000
Subject: Re: ppp-2.4.2 released
Message-Id: <Pine.LNX.4.50.0401161516190.1713-100000@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
In-Reply-To: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Sat, 17 Jan 2004, Paul Mackerras wrote:

> Clive Nicolson writes:
> > ftp://ftp.samba.org/pub/ppp/ppp-2.4.2.tar.gz will not build "out of the box"
> > under linux as <pcap.h> is not found by pcap-int.h .
> 
> It builds out of the box on my Debian sid box - you need the
> libpcap-dev package installed though.  If you really don't have
> pcap.h, set FILTER=n in pppd/Makefile.linux.

The rpm 
libpcap0-devel on Mandrake systems (8.1 to 9.1 anyway) and probably
Redhat systems.
