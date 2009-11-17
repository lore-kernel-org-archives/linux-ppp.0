From: Paul Mackerras <paulus@samba.org>
Date: Tue, 17 Nov 2009 10:53:43 +0000
Subject: ppp-2.4.5 released
Message-Id: <19202.32951.859014.67993@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I have released ppp-2.4.5.  The tarball is in the usual place:

ftp://ftp.samba.org/pub/ppp/ppp-2.4.5.tar.gz

or you can get it from git (git://ozlabs.org/~paulus/ppp.git).

The new things in ppp-2.4.5, compared to ppp-2.4.4, are:

* Under Linux, pppd can now operate in a mode where it doesn't request
  the peer's IP address, as some peers refuse to supply an IP address.
  Since Linux supports device routes as well as gateway routes, it's
  possible to have no remote IP address assigned to the ppp interface
  and still route traffic over it.

* Pppd now works better with 3G modems that do strange things such as
  sending IPCP Configure-Naks with the same values over and over again.

* The PPP over L2TP plugin is included, which works with the pppol2tp
  PPP channel code in the Linux kernel.  This allows pppd to be used
  to set up tunnels using the Layer 2 Tunneling Protocol.

* A new 'enable-session' option has been added, which enables session
  accounting via PAM or wtwp/wtmpx, as appropriate.  See the pppd man
  page for details.

* Several bugs have been fixed.

Paul.
