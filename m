From: Paul Mackerras <paulus@samba.org>
Date: Wed, 28 Jun 2006 08:44:11 +0000
Subject: ppp-2.4.4 released
Message-Id: <17570.16731.506369.109070@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Version 2.4.4 of ppp is now on samba.org; you can get it from:

ftp://ftp.samba.org/pub/ppp/ppp-2.4.4.tar.gz

or

http://www.samba.org/ftp/ppp/ppp-2.4.4.tar.gz

There aren't a lot of new features in this release, but quite a few
bugs have been fixed.

What's new in ppp-2.4.4.
************************

* Pppd will now run /etc/ppp/ip-pre-up, if it exists, after creating
  the ppp interface and configuring its IP addresses but before
  bringing it up.  This can be used, for example, for adding firewall
  rules for the interface.

* Lots of bugs fixed, particularly in the area of demand-dialled and
  persistent connections.

* The rp-pppoe plugin now accepts any interface name (that isn't an
  existing pppd option name) without putting "nic-" on the front of
  it, not just eth*, nas*, tap* and br*.

Paul.
