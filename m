From: Antony J Mee <A.J.Mee@ncl.ac.uk>
Date: Tue, 22 Nov 2005 16:06:19 +0000
Subject: pppd and NetworkManager - 3 issues
Message-Id: <438341FB.70709@ncl.ac.uk>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Firstly the standard apologies for cross posting.  However, this mail 
concerns both lists and may require a solution from both communities.

I have just created a PPTP VPN plugin for NetworkManager:  
http://www.students.ncl.ac.uk/a.j.mee/blog/index.php/2005/11/21/networkmanager-pptp-vpn-support/

This uses the Linux PPTP client which in turn is heavily dependent upon 
pppd.
There are two methods for establishing a connection (currently I'm using 
the first of the following:

  pptp <hostname> [<pptp options>] [[--] <pppd options>]
or using pppd's pty option:
  pppd pty "pptp <hostname> --nolaunchpppd <pptp options>"

Two issues involve getting information about the connection back to 
NetworkManager.
The information I require is:
    a) The IP of the VPN server
    b) The local IP of the PPP tunnel
    c) USEPEERDNS information

Presently I am obtaining most of this by having a doctored version of 
/etc/ppp/ip-up
which passes the second two pieces of information to the 
NetworkManager-pptp helper
process which in turn, via DBUS passes the information to NetworkManager 
so that it may configure routing tables etc.

So this brings me to issue 1.  It appears the only way to get the any of 
this information
is via environment variables and parameters passed to the /etc/ppp/ip-up 
scripts on connect.  While the use of environment variables is not 
uncommon I cannot find a way to ask pppd/pptp to run my own 
script/binary (the NM helper) to process this information.
Doctoring /etc/ip-up is not a very good solution since /etc/ip-up is 
often heavily distro dependent already.  Other tunnel clients eg. 
OpenVPN and vpnc (Cisco VPN) also use environment variables BUT provide 
a --script option to allow the execution of arbitrary scripts.  Is such 
behaviour possible?

Issue 2. Worse still it appears that item a) is simply unavailable.  But 
you say... You must know what it is before you execute pppd/pptp. Not 
so. If the target host is actually a pool of IPs in the DNS then one 
must be able to ask pptp/pppd what it resolved the hostname to be. For 
example, our wireless access is via PPTP vpn in Newcastle served via a 
pool of machines:

mee ~> host ivpn.ncl.ac.uk
ivpn.ncl.ac.uk has address 128.240.231.4
ivpn.ncl.ac.uk has address 128.240.231.5
ivpn.ncl.ac.uk has address 128.240.231.20
ivpn.ncl.ac.uk has address 128.240.231.21
ivpn.ncl.ac.uk has address 128.240.231.36
ivpn.ncl.ac.uk has address 128.240.231.53

Finally issue 3.
I wish to have NetworkManager provide the authentication information for 
MS-CHAP.  There appears to be no way to do so other than via the 
chap-secrets file. Or can I get pptp/ppp to ask for them on the standard 
input perhaps?

Kind regards,

tOnY
