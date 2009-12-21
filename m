From: Jelle de Jong <jelledejong@powercraft.nl>
Date: Mon, 21 Dec 2009 13:15:08 +0000
Subject: pppoe uplink goes down several times a day, what is wrong
Message-Id: <4B2F74DC.4040204@powercraft.nl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090001070609030801090606"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org

This is a multi-part message in MIME format.
--------------090001070609030801090606
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello everybody,

I got a PPPoE uplink to a big Dutch internet service provider, and I
am having stability issues. My uplink is going down for very short
times but it happens several times a day.

I just had major network move and the physical copper line changed so
I think I can rule out bad coper connections now. I had the same
issues on the old location though.

The modem I use is a DrayTek Vigor 3100V (latest firmware) in PPPoE
bridge mode (1) it behaves complete transparent, so I let the Linux
server do as much as possible.

I am wondering what I am doing wrong, is there something I should
change on the software side? Should I change the modem configuration?
Stop using PPPoE?

Please see the attachment for the configuration and debug information.

1) http://imagebin.ca/img/aSt5Wc-c.png

Any help is appreciated,

Best regards,

Jelle


--------------090001070609030801090606
Content-Type: text/plain;
 name="setup-sammy-pppoe-debug01.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="setup-sammy-pppoe-debug01.txt"

------------------------------------------------------------------------

# pppoe uplink goes down several times a day, what is going wrong?

------------------------------------------------------------------------

# grep -i pppd /var/log/syslog
Dec 21 06:37:24 sammy pppd[2954]: No response to 4 echo-requests
Dec 21 06:37:24 sammy pppd[2954]: Serial link appears to be disconnected.
Dec 21 06:37:24 sammy pppd[2954]: Connect time 2681.4 minutes.
Dec 21 06:37:24 sammy pppd[2954]: Sent 198282561 bytes, received 314194095 bytes.
Dec 21 06:37:30 sammy pppd[2954]: Connection terminated.
Dec 21 06:37:30 sammy pppd[2954]: Modem hangup
Dec 21 06:37:50 sammy pppd[2954]: PPP session is 6
Dec 21 06:37:50 sammy pppd[2954]: Using interface ppp0
Dec 21 06:37:50 sammy pppd[2954]: Connect: ppp0 <--> eth5
Dec 21 06:37:54 sammy pppd[2954]: PAP authentication succeeded
Dec 21 06:37:54 sammy pppd[2954]: peer from calling number 00:50:7F:DB:D3:48 authorized
Dec 21 06:37:54 sammy pppd[2954]: Cannot determine ethernet address for proxy ARP
Dec 21 06:37:54 sammy pppd[2954]: local  IP address 188.201.xxx.xxx
Dec 21 06:37:54 sammy pppd[2954]: remote IP address 62.12.4.28
Dec 21 06:37:54 sammy pppd[2954]: primary   DNS address 213.75.63.36
Dec 21 06:37:54 sammy pppd[2954]: secondary DNS address 213.75.63.70
Dec 21 08:32:56 sammy pppd[2954]: No response to 4 echo-requests
Dec 21 08:32:56 sammy pppd[2954]: Serial link appears to be disconnected.
Dec 21 08:32:56 sammy pppd[2954]: Connect time 115.1 minutes.
Dec 21 08:32:56 sammy pppd[2954]: Sent 10170461 bytes, received 28994956 bytes.
Dec 21 08:33:02 sammy pppd[2954]: Connection terminated.
Dec 21 08:33:02 sammy pppd[2954]: Modem hangup
Dec 21 08:33:22 sammy pppd[2954]: PPP session is 6
Dec 21 08:33:22 sammy pppd[2954]: Using interface ppp0
Dec 21 08:33:22 sammy pppd[2954]: Connect: ppp0 <--> eth5
Dec 21 08:33:27 sammy pppd[2954]: PAP authentication succeeded
Dec 21 08:33:27 sammy pppd[2954]: peer from calling number 00:50:7F:DB:D3:48 authorized
Dec 21 08:33:27 sammy pppd[2954]: Cannot determine ethernet address for proxy ARP
Dec 21 08:33:27 sammy pppd[2954]: local  IP address 188.201.xxx.xxx
Dec 21 08:33:27 sammy pppd[2954]: remote IP address 62.12.4.28
Dec 21 08:33:27 sammy pppd[2954]: primary   DNS address 213.75.63.36
Dec 21 08:33:27 sammy pppd[2954]: secondary DNS address 213.75.63.70

------------------------------------------------------------------------

# grep -i e1000 /var/log/syslog
Dec 21 06:35:19 sammy kernel: [557976.760139] e1000: eth5 NIC Link is Down
Dec 21 06:35:21 sammy kernel: [557978.616469] e1000: eth5 NIC Link is Up 100 Mbps Full Duplex, Flow Control: RX/TX
Dec 21 06:35:24 sammy kernel: [557982.236149] e1000: eth5 NIC Link is Down
Dec 21 06:35:27 sammy kernel: [557984.468468] e1000: eth5 NIC Link is Up 100 Mbps Full Duplex, Flow Control: RX/TX
Dec 21 08:30:41 sammy kernel: [564898.420139] e1000: eth5 NIC Link is Down
Dec 21 08:30:42 sammy kernel: [564900.372459] e1000: eth5 NIC Link is Up 100 Mbps Full Duplex, Flow Control: RX/TX
Dec 21 08:30:46 sammy kernel: [564903.892134] e1000: eth5 NIC Link is Down
Dec 21 08:30:48 sammy kernel: [564906.156460] e1000: eth5 NIC Link is Up 100 Mbps Full Duplex, Flow Control: RX/TX

------------------------------------------------------------------------

# cat /etc/ppp/peers/dsl-provider
# Minimalistic default options file for DSL/PPPoE connections

noipdefault
defaultroute
replacedefaultroute
hide-password
#lcp-echo-interval 30
#lcp-echo-failure 4
noauth
persist
#mtu 1492
maxfail 0
holdoff 20
plugin rp-pppoe.so eth5
usepeerdns
user "KPN1"

------------------------------------------------------------------------

# ifconfig -a ppp
ppp0      Link encap:Point-to-Point Protocol
          inet addr:188.201.124.57  P-t-P:62.12.4.28  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1492  Metric:1
          RX packets:614021 errors:0 dropped:0 overruns:0 frame:0
          TX packets:502294 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:3
          RX bytes:691562515 (659.5 MiB)  TX bytes:67199257 (64.0 MiB)

------------------------------------------------------------------------

# cat /etc/network/interfaces
auto dsl-provider
  iface dsl-provider inet ppp
  pre-up /sbin/ifconfig eth5 up
  provider dsl-provider

------------------------------------------------------------------------


--------------090001070609030801090606--
