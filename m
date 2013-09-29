From: James Carlson <carlsonj@workingcode.com>
Date: Sun, 29 Sep 2013 22:07:52 +0000
Subject: Re: Wrong remote IP, bug or feature?
Message-Id: <5248A4B8.7090201@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <5247FC26.8040200@perfect-privacy.com>
In-Reply-To: <5247FC26.8040200@perfect-privacy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 9/29/2013 6:08 AM, Lars Mueller wrote:


Another poster suggested "ipcp-accept-remote."  I don't believe that
answer to be correct.  That option actually *allows* the peer to
change the address.  The default is that if the address is specified,
then the peer cannot change it, but can refuse it outright.

The usual way to specify a required IP address is via the
/etc/ppp/chap-secrets file.  For example:

remoteuser * userpassword ip.user.com

where "remoteuser" is the remote user's name, "userpassword" is the
user's password or quoted passphrase, and "ip.user.com" is a symbolic
or numeric (dotted quad) IP address.  The IP addresses allowed for a
given peer can be specified as a space separated list, prefixed with
"!" to exclude an address, or as a subnet range n.n.n.n/m.  The range
form can optionally include a "+" sign to indicate that the local
device unit number (the "X" in "pppX") plus 1 is added to the address,
so each user gets a unique address within the specified range.  A
typical configuration on an access server looks like:

joeuser * "Joe's Passphrase" 10.14.15.1/24

You can also include special pppd options to apply to a given peer by
appending "--" and then the options desired.  Obviously, as you must
get through both LCP and authentication to get to the point of setting
those options, the only useful options here are ones that apply to the
NCPs (e.g., "novj").

See the pppd man page for details.  There's a lot you can control
here.  If you want to get really fancy, you can write your own plug-in
for pppd that sets the allowed_address_hook pointer, and you can do
any arbitrary sort of validation you like there.

One caveat: I know pppd well, but I don't know squat about pptpd.  The
options it provides look a little odd to me, given that the normal way
to restrict IP address selection is with the authentication files.

Another caveat: the restrictions here necessarily apply ONLY to the
address negotiated and then configured on the local IP interface.
There's no way you can ever "force" a peer to use any particular
address, no matter how much you may want to.  At best, the addresses
negotiated constitute advice to the peer.  You can do slightly better
by setting up packet filters to get rid of "spoofed" source addresses
- -- using, of course, your own configuration data and not bits supplied
by the (untrusted?) peer.  Of course, doing so will break many
multi-homed systems and simple load balancing schemes, so it's up to
you to determine how much to inconvenience the user.

About the options you have configured:



This one may be a mistake.  It's possible you may need this if the
peer has known implementation bugs, but I strongly suggest omitting
this first and setting it *only* if absolutely required for a broken peer.

I doubt it's needed here, as the AHDLC "peer" is entirely internal to
the pptp implementation.  If the "peer" is broken, it means that your
local pptpd is broken.



This is very likely wrong for an access server.  You don't want to
treat your remote user as your default route to connect to the
Internet, do you?  Ordinarily, a remote user connecting to an access
server doesn't play the role of default route.

If you were hoping that this option would *supply* a default route to
the peer, it does not.  There's (quite intentionally) no way to do
that in PPP.



That combination is a little weird.  You're telling pppd to use an MRU
that's less than the default of 1500 but also not to bother telling
the peer about the restriction.  I don't think that makes sense.  I
suggest setting *either* "mru 1450" if you really want the peer to
send smaller packets (by telling it to do so) *or* setting just
"default-mru" if you don't want to tell the peer anything about the
MRU setting (allowing it to assume whatever it wants), and not both.



These probably don't do what you expect.  All of the "refuse-*"
authentication options control the how the local system (i.e., this
access server) identifies itself to its peer.  By specifying these,
you're saying that you don't want to use any of those protocols if the
peer demands authentication from you.

But the remote system isn't going to do that, and if it did, it
wouldn't find any compatible secrets in any of the /etc/ppp/*-secrets
files, so what you're specifying here is actually already the default.



That doesn't seem useful on a virtual link, such as pptp.  The point
of the "lock" option is to control access to a physical serial port
that might be used for both dial-in and dial-out access.  The UUCP
lock file provides a way that applications can detect that the serial
port is in use, and either wait for it to become idle or return an
error to the user.  Clearly, physical serial ports are not in use
here.  See the man page for details.



No need to specify both of these; "novj" is more than enough.  If
you're going to do this, I'd suggest adding "nopcomp" and "noaccomp"
as well.  Those options mean something for a serial link, but not much
for a virtual link.



That's not really needed.  You're not logging on stdout here.  I
suppose it's harmless, although I do recommend that specifying as
*FEW* options as possible (and accepting the default for the rest) is
really the right way to go.  The code is written so that good defaults
are intentionally chosen.  As new options are added (and old ones
retired), you don't want to be put in the position of playing "catch
up" with each change.

Finally, note that for the "proxyarp" function to work here, you're
going to need an Ethernet (or other broadcast-type) interface
configured with an IP address somewhere in the 10.14.15.0/24 range
(perhaps .1?).  If you don't have that, then the option will be ignored.

- -- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (MingW32)

iEYEARECAAYFAlJIpLIACgkQ6TIHA1NkzvD/nACdF3kT3pc5aFeXv9lhtJvhDsQy
+AUAni5cFLmYiOXtLJ5ZMMQVF+q4/HCT
=/3+k
-----END PGP SIGNATURE-----
