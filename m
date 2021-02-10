From: =?UTF-8?B?QmrDtnJu?= Kirchner <bjkit89@gmail.com>
Date: Wed, 10 Feb 2021 09:17:40 +0000
Subject: Problem with M2M PPP connection
Message-Id: <20210210101740.1bae8b93@w530>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

Dear list readers,

I am stuck with the following problem and I hope you can give me some
hints or advice. It looks to me like a configuration or routing error.

I have an Olimex NB-IoT-DevKit with a Quectel BC66 LTE-NB1 chip which
is connected to a RaspberryPI 3B+ via UART connection. I try to make a
connection via PPP protocol to the ISP, but that is only “half”
working. The LTE modem can dial to the ISP and gets a connection. Both
sides exchange LCP configuration messages and IPCP configuration
messages. I receive the private static IP address assigned to the SIM
card and I also retrieve an IP address for the remote side. The ppp0
interface comes up and is configured with the private static IP address
and the P-t-P’s address. My problem is, that I cannot reach anything
via that connection. I cannot ping the P-t-P, I cannot ping other
addresses. The ISP’s support confirmed that PPP was a viable option to
connect and they told me to try the SIM card in a smartphone and to
ping 8.8.8.8, so I put the SIM card in an old Android tablet with a SIM
card slot and it connected to the remote and I could ping 8.8.8.8
successfully. The only surprising thing I noticed was the fact that the
ifconfig command for the dial-up interface on the Android tablet didn’t
have a P-t-P remote peer.

Apparently the LTE modem is working and the SIM seems to work, too. So
I am afraid that I did something wrong with the PPPD configuration.

I used pppd version 2.4.7 and the latest version from git’s master
branch (5191399f5266bb595f03f5c4fee13153092e2baf). The problem is the
same with both versions.

Output from pppd (git version):
/root/sandbox/pppd/sbin/pppd call quectel-ppp
root@raspberrypi:/etc/ppp/peers# /root/sandbox/pppd/sbin/pppd call quectel-ppp
pppd options in effect:
debug           # (from /etc/ppp/peers/quectel-ppp)
nodetach                # (from /etc/ppp/peers/quectel-ppp)
ktune           # (from /etc/ppp/peers/quectel-ppp)
dump            # (from /etc/ppp/peers/quectel-ppp)
noauth          # (from /etc/ppp/peers/quectel-ppp)
refuse-chap             # (from /etc/ppp/peers/quectel-ppp)
refuse-mschap           # (from /etc/ppp/peers/quectel-ppp)
refuse-mschap-v2                # (from /etc/ppp/peers/quectel-ppp)
refuse-eap              # (from /etc/ppp/peers/quectel-ppp)
user *          # (from /etc/ppp/peers/quectel-ppp)
password ??????         # (from /etc/ppp/peers/quectel-ppp)
remotename 3gppp                # (from /etc/ppp/peers/quectel-ppp)
/dev/ttyS0              # (from /etc/ppp/peers/quectel-ppp)
115200          # (from /etc/ppp/peers/quectel-ppp)
lock            # (from /etc/ppp/peers/quectel-ppp)
connect /root/sandbox/pppd/sbin/chat -E -s -v -f /etc/chatscripts/quectel-chat-connect          # (from /etc/ppp/peers/quectel-ppp)
disconnect /root/sandbox/pppd/sbin/chat -E -s -v -f /etc/chatscripts/quectel-chat-disconnect            # (from /etc/ppp/peers/quectel-ppp)
record /tmp/quectel.record              # (from /etc/ppp/peers/quectel-ppp)
nocdtrcts               # (from /etc/ppp/peers/quectel-ppp)
local           # (from /etc/ppp/peers/quectel-ppp)
noaccomp                # (from /etc/ppp/peers/quectel-ppp)
nopcomp         # (from /etc/ppp/peers/quectel-ppp)
passive         # (from /etc/ppp/peers/quectel-ppp)
hide-password           # (from /etc/ppp/peers/quectel-ppp)
novj            # (from /etc/ppp/peers/quectel-ppp)
novjccomp               # (from /etc/ppp/peers/quectel-ppp)
ipcp-accept-local               # (from /etc/ppp/peers/quectel-ppp)
ipcp-accept-remote              # (from /etc/ppp/peers/quectel-ppp)
ipparam 3gppp           # (from /etc/ppp/peers/quectel-ppp)
noipdefault             # (from /etc/ppp/peers/quectel-ppp)
nodefaultroute          # (from /etc/ppp/peers/quectel-ppp)
noremoteip              # (from /etc/ppp/peers/quectel-ppp)
noipv6          # (from /etc/ppp/peers/quectel-ppp)
noccp           # (from /etc/ppp/peers/quectel-ppp)
nobsdcomp               # (from /etc/ppp/peers/quectel-ppp)
nopredictor1            # (from /etc/ppp/peers/quectel-ppp)
abort on (BUSY)
abort on (NO CARRIER)
abort on (NO DIALTONE)
abort on (ERROR)
abort on (NO ANSWER)
timeout set to 120 seconds
send (AT^M)
expect (OK)
AT^M^M
OK
 -- got it

send (ATE0^M)
expect (OK)
^M
ATE0^M^M
OK
 -- got it

send (ATI^M)
expect (OK)
^M
^M
Quectel_Ltd^M
Quectel_BC66^M
Revision: BC66NBR01A10^M
^M
OK
 -- got it

send (AT+CSQ^M)
expect (OK)
^M
^M
+CSQ: 8,0^M
^M
OK
 -- got it

send (AT+CPIN?^M)
expect (OK)
^M
^M
+CPIN: READY^M
^M
OK
 -- got it

send (AT+COPS?^M)
expect (OK)
^M
^M
+COPS: 0,2,"26201",9^M
^M
OK
 -- got it

send (AT+CGREG?^M)
expect (OK)
^M
^M
+CGREG: 0,5^M
^M
OK
 -- got it

send (ATZ^M)
expect (OK)
^M
^M
OK
 -- got it

send (AT+CGDCONT=1,"IP","iot.1nce.net",,0,0^M)
expect (OK)
^M
AT+CGDCONT=1,"IP","iot.1nce.net",,0,0^M^M
OK
 -- got it

send (ATDT*99#^M)
expect (CONNECT)
^M
ATDT*99#^M^M
CONNECT
 -- got it

Script /root/sandbox/pppd/sbin/chat -E -s -v -f /etc/chatscripts/quectel-chat-connect finished (pid 671), status = 0x0
Serial connection established.
using channel 2
Using interface ppp0
Connect: ppp0 <--> /dev/pts/3
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xd514deb5>]
rcvd [LCP ConfReq id=0x1 <mru 1600> <magic 0x85704a90> <asyncmap 0x0> <pcomp> <accomp>]
sent [LCP ConfRej id=0x1 <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xd514deb5>]
rcvd [LCP ConfReq id=0x2 <mru 1600> <magic 0x85704a90> <asyncmap 0x0>]
sent [LCP ConfAck id=0x2 <mru 1600> <magic 0x85704a90> <asyncmap 0x0>]
sent [IPCP ConfReq id=0x1 <addr 0.0.0.0>]
rcvd [IPCP ConfNak id=0x1 <addr 10.43.124.1>]
sent [IPCP ConfReq id=0x2 <addr 10.43.124.1>]
rcvd [IPCP ConfReq id=0x1 <addr 10.0.0.1>]
sent [IPCP ConfAck id=0x1 <addr 10.0.0.1>]
rcvd [IPCP ConfAck id=0x2 <addr 10.43.124.1>]
local  IP address 10.43.124.1
remote IP address 10.0.0.1
Script /etc/ppp/ip-up started (pid 677)
Script /etc/ppp/ip-up finished (pid 677), status = 0x0
Terminating on signal 2
Connect time 14.3 minutes.
Sent 3152 bytes, received 0 bytes.
Script /etc/ppp/ip-down started (pid 710)
sent [LCP TermReq id=0x2 "User request"]
Script /etc/ppp/ip-down finished (pid 710), status = 0x0
sent [LCP TermReq id=0x3 "User request"]
Connection terminated.
abort on (ERROR)
abort on (NO DIALTONE)
\send (+++ATH^M)

Good bye
Script /root/sandbox/pppd/sbin/chat -E -s -v -f /etc/chatscripts/quectel-chat-disconnect finished (pid 731), status = 0x0
Serial link disconnected.
Modem hangup
Waiting for 1 child processes...
  script pppd (charshunt), pid 670
Child process pppd (charshunt) (pid 670) terminated with signal 15

Peer file /etc/ppp/peers/quectel-ppp:
#/etc/ppp/peers/quectel-ppp 
# Usage:root>pppd call quectel-ppp 
# Hide password in debug messages 
hide-password 
# The phone is not required to authenticate 
noauth 
# The chat script 
connect '/root/sandbox/pppd/sbin/chat -E -s -v
-f /etc/chatscripts/quectel-chat- connect' 
# The close script 
disconnect '/root/sandbox/pppd/sbin/chat -E -s -v
-f /etc/chatscripts/quectel-ch at-disconnect' 
# Debug info from pppd 
debug 
# Serial Device to which the HSPDA phone is connected 
# Modem path, like /dev/ttyUSB3,/dev/ttyACM0, it depends on your
module. # Exmaple given is with the modem mounted at /dev/ttyUSB3 
/dev/ttyS0 
# Serial port line speed 
115200 
# If you want to use the HSDPA link as your gateway 
nodefaultroute 
# pppd must not propose any IP address to the peer 
noipdefault 
# No ppp compression 
novj 
novjccomp 
noccp 
nobsdcomp 
noaccomp 
ktune 
#nomppe 
#nomppe-40 
#nomppe-128 
#nompshortseq 
#nomultilink 
nopcomp 
nopredictor1 
noremoteip 
ipcp-accept-local 
ipcp-accept-remote 
refuse-chap 
refuse-mschap 
refuse-mschap-v2 
refuse-eap 
local 
nocrtscts 
nocdtrcts 
# For sanity, keep a lock on the serial line 
lock 
dump 
# Keep pppd attached to the terminal 
# Comment this to get daemon mode pppd 
nodetach 
# Network access credenatials.  
# Set LTE_USERNAME and LTE_PASSWORD before executing pppd -C call 
# Check with service provider for required details 
user * 
password * 
remotename 3gppp 
ipparam 3gppp 
record /tmp/quectel.record 
passive 
noipv6

File /etc/chatscripts/quectel-chat-connect
ABORT "BUSY" 
ABORT "NO CARRIER" 
ABORT "NO DIALTONE" 
ABORT "ERROR" 
ABORT "NO ANSWER" 
TIMEOUT 120 
"" AT 
OK ATE0 
OK ATI 
OK AT+CSQ 
OK AT+CPIN? 
OK AT+COPS? 
OK AT+CGREG? 
OK ATZ 
# Connection to the network 
# Set LTE_APN variable before executing chat -E ... 
# Check with service provider for required details 
OK AT+CGDCONT=1,"IP","iot.1nce.net",,0,0 
# Dial the number 
OK ATDT*99# 
CONNECT


File /etc/chatscripts/quectel-chat-disconnect:
ABORT "ERROR" 
ABORT "NO DIALTONE" 
SAY "\NSending break to the modem\n" 
"" +++ATH 
SAY "\nGood bye\n"


Some information about the linux system:
cat /proc/version 
Linux version 5.10.11-v7+ (dom@buildbot) (arm-linux-gnueabihf-gcc-8
(Ubuntu/Linaro 8.4.0-3ubuntu1) 8.4.0, GNU ld (GNU Binutils for Ubuntu)
2.34) #1399 SMP Thu Jan 28 12:06:05 GMT 2021


cat /etc/os-release 
PRETTY_NAME="Raspbian GNU/Linux 10 (buster)"
NAME="Raspbian GNU/Linux"
VERSION_ID="10"
VERSION="10 (buster)"
VERSION_CODENAME=buster
ID=raspbian
ID_LIKE=debian
HOME_URL="http://www.raspbian.org/"
SUPPORT_URL="http://www.raspbian.org/RaspbianForums"
BUG_REPORT_URL="http://www.raspbian.org/RaspbianBugs"


I manually removed the ethernet default route and added a new default
route to the ppp0 device: root@raspberrypi:~# route del default
root@raspberrypi:~# route add default ppp0       
root@raspberrypi:~# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface 0.0.0.0         0.0.0.0         0.0.0.0         U     0
0        0 ppp0 10.0.0.1        0.0.0.0         255.255.255.255 UH
0      0        0 ppp0 192.168.2.0     0.0.0.0         255.255.255.0
U     202    0        0 eth0

Output from ifconfig ppp0:
root@raspberrypi:~# ifconfig ppp0
ppp0: flags=4305<UP,POINTOPOINT,RUNNING,NOARP,MULTICAST>  mtu 1500
        inet 10.43.124.1  netmask 255.255.255.255  destination 10.0.0.1
        ppp  txqueuelen 3  (Point-to-Point Protocol)
        RX packets 3  bytes 30 (30.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 3  bytes 30 (30.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0


If you need more information I am eager to provide those. Do you have any
suggestions how to be able to receive the hosts on the "other" side?


Best regards,

Björn
