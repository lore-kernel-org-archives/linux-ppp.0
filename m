From: Paul Mackerras <paulus@samba.org>
Date: Sun, 14 Nov 2004 12:01:25 +0000
Subject: ppp-2.4.3 released
Message-Id: <16791.18709.501023.879758@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I have just released ppp-2.4.3; it is available at:

ftp://ftp.samba.org/pub/ppp/ppp-2.4.3.tar.gz.

There are quite a few changes since 2.4.2.  Apart from fixes for
several bugs, the changes include:

* The configure script now accepts --prefix and --sysconfdir options.
  These default to /usr/local and /etc.  If you want pppd put in
  /usr/sbin as before, use ./configure --prefix=/usr.

* Doing `make install' no longer puts example configuration files in
  /etc/ppp.  Use `make install-etcppp' if you want that.

* The code has been updated to work with version 0.8.3 of libpcap.
  Unfortunately the libpcap maintainers removed support for the
  "inbound" and "outbound" keywords on PPP links, meaning that if you
  link pppd with libpcap-0.8.3, you can't use those keywords in the
  active-filter and pass-filter expressions.  The support has been
  reinstated in the CVS version and should be in future libpcap
  releases.  If you need the in/outbound keywords, use a later release
  than 0.8.3, or get the CVS version from http://www.tcpdump.org.

* There is a new option, child-timeout, which sets the length of time
  that pppd will wait for child processes (such as the command
  specified with the pty option) to exit before exiting itself.  It
  defaults to 5 seconds.  After the timeout, pppd will send a SIGTERM
  to any remaining child processes and exit.  A value of 0 means no
  timeout.

* Various bugs have been fixed, including some CBCP packet parsing
  bugs that could lead to the peer being able to crash pppd if CBCP
  support is enabled.

* Various fixes and enhancements to the radius and rp-pppoe plugins
  have been added.

* There is a new winbind plugin, from Andrew Bartlet of the Samba
  team, which provides the ability to authenticate the peer against an
  NT domain controller using MS-CHAP or MS-CHAPV2.

* There is a new pppoatm plugin, by various authors, sent in by David
  Woodhouse.

* The multilink code has been substantially reworked.  The first pppd
  for a bundle still controls the ppp interface, but it doesn't exit
  until all the links in the bundle have terminated.  If the first
  pppd is signalled to exit, it signals all the other pppds
  controlling links in the bundle.

* The TDB code has been updated to the latest version.  This should
  eliminate the problem that some people have seen where the database
  file (/var/run/pppd.tdb) keeps on growing.  Unfortunately, however,
  the new code uses an incompatible database format.  For this reason,
  pppd now uses /var/run/pppd2.tdb as the database filename.

Paul.
