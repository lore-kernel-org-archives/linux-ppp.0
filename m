From: Marco Gaiarin <gaio@sv.lnf.it>
Date: Thu, 20 Jul 2006 16:43:49 +0000
Subject: Trouble with ppp and pam_ldap...
Message-Id: <20060720164349.GW8193@sv.lnf.it>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org


[I'm not subscribed to this list, so please put me on CC, thanks]

I've setup a couple of debian servers, acting as PDC/BDC with samba,
and using smbldap-tools, openldap, and clearly libnss-ldap and libpam-ldap.
I've a dozen of similar setup around, and i've no other trouble at all.

Some versions:
ii  libnss-ldap    238-1          NSS module for using LDAP as a naming ser=
vic
ii  libpam-ldap    178-1sarge1    Pluggable Authentication Module allowing =
LDA
ii  slapd          2.2.23-8       OpenLDAP server (slapd)
ii  ppp            2.4.3-20050321 Point-to-Point Protocol (PPP) daemon

In this box i've setup Hylafax, mgetty and ppp to act as fax server,
and dialin server for modem client.

If i try the right password i got:

        Jul 13 10:36:55 marta pppd[28591]: PAM no modules loaded for `ppp' =
service
        Jul 13 10:36:55 marta pppd[28591]: PAP peer authentication failed f=
or massimo

and if i intentionally put wrong password:

        Jul 13 10:35:30 marta pppd[28509]: pam_ldap: error trying to bind a=
s user "uid=3Dmassimo,ou=3DPeople,dc=3Dcn,dc=3Dlnf,dc=3Dit" (Invalid creden=
tials)
        Jul 13 10:35:30 marta pppd[28509]: PAP peer authentication failed f=
or massimo

so seems that the underlying pam layer work, but still something
misses.

Note that the same server authenticate correctly services as ssh,
postgres, cups, dovecot, ... and i've not touched any file in
/etc/pam.d/*, apart adding to default-* ones what sayed on
/usr/share/doc/libpam-ldap/README.Debian .


Before starting to tackle with /etc/pam.d/ppp, probably in random way
;), have something to say to me?

Many thanks.

--=20
dott. Marco Gaiarin				    GNUPG Key ID: 240A3D66
  Associazione ``La Nostra Famiglia''                http://www.sv.lnf.it/
  Polo FVG  -  Via della Bont=E0, 7 - 33078  -  San Vito al Tagliamento (PN)
  marco.gaiarin(at)sv.lnf.it	  tel +39-0434-842711  fax +39-0434-842797
