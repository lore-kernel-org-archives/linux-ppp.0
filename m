From: Paul Mackerras <paulus@samba.org>
Date: Fri, 16 Jan 2004 06:28:25 +0000
Subject: ppp-2.4.2 released
Message-Id: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I have just released ppp-2.4.2, available at either:

ftp://ftp.samba.org/pub/ppp/ppp-2.4.2.tar.gz

or

http://ftp.samba.org/ftp/ppp/ppp-2.4.2.tar.gz

It's been a long time since the last release.  Hopefully the next
release won't take as long.  This release fixes a lot of bugs and adds
several new features.

From the README:

What's new in ppp-2.4.2.
************************

* The CHAP code has been rewritten.  Pppd now has support for MS-CHAP
  V1 and V2 authentication, both as server and client.  The new CHAP
  code is cleaner than the old code and avoids some copyright problems
  that existed in the old code.

* MPPE (Microsoft Point-to-Point Encryption) support has been added,
  although the current implementation shouldn't be considered
  completely secure.  (There is no assurance that the current code
  won't ever transmit an unencrypted packet.)

* James Carlson's implementation of the Extensible Authentication
  Protocol (EAP) has been added.

* Support for the Encryption Control Protocol (ECP) has been added.

* Some new plug-ins have been included:
  - A plug-in for kernel-mode PPPoE (PPP over Ethernet)
  - A plug-in for supplying the PAP password over a pipe from another
    process
  - A plug-in for authenticating using a Radius server.

* Updates and bug-fixes for the Solaris port.

* The CBCP (Call Back Control Protocol) code has been updated.  There
  are new options `remotenumber' and `allow-number'.

* Extra hooks for plugins to use have been added.

* There is now a `maxoctets' option, which causes pppd to terminate
  the link once the number of bytes passed on the link exceeds a given
  value.

* There are now options to control whether pppd can use the IPCP
  IP-Address and IP-Addresses options: `ipcp-no-address' and
  `ipcp-no-addresses'.

* Fixed several bugs, including potential buffer overflows in chat.

Paul.
