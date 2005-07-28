From: Ramses van Pinxteren <ramses@niob.knaw.nl>
Date: Thu, 28 Jul 2005 10:27:45 +0000
Subject: Error 737: loopback detected
Message-Id: <f06200735bf0e633de939@[195.169.144.222]>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Never forget to change a subjectline. Keeps things simpler. Forget 
the last message I send, Better reply this one to keep the archives 
clean hihi

Hi,
I am setting up a VPN server and I am running into a wierd problem. 
On mac i can connect most of the time, but on windows I get 99% of 
the times an error that there is a loopback detected. (error 737) I 
have the funny feeling it is ppp related...

I am using the following software versions:
dkms-2.0.5.2-4.fc4
kernel_ppp_mppe-0.0.5-5dkms
pptpd-1.2.1-2
ppp-2.4.3-5.fc4
kernel_ppp_mppe-0.0.5-5dkms
radiusclient-0.3.2-0.1.fc3.rf
freeradius-1.0.4-1.FC4.1


As much as possible come from the yum repository of pptpd/pptpclient 
at sourceforge

I am using Fedore core 4 btw.

I hope someone can make heads or tails from this. I cant :(

this is the dump of the logfile:
Jul 28 12:21:42 h222 pptpd[21757]: CTRL: Client 192.87.138.220 
control connection started
Jul 28 12:21:42 h222 pptpd[21757]: CTRL: Starting call (launching 
pppd, opening GRE)
Jul 28 12:21:42 h222 pppd[21758]: Plugin radius.so loaded.
Jul 28 12:21:42 h222 pptpd[21757]: GRE: Bad checksum from pppd.
Jul 28 12:21:42 h222 pptpd[21757]: GRE: Received too short packet from pppd.
Jul 28 12:21:42 h222 pppd[21758]: RADIUS plugin initialized.
Jul 28 12:21:42 h222 pptpd[21757]: GRE: Bad checksum from pppd.
Jul 28 12:21:42 h222 pppd[21758]: Plugin 
/usr/lib/pptpd/pptpd-logwtmp.so loaded.Jul 28 12:21:42 h222 
pptpd[21757]: GRE: Bad checksum from pppd.
Jul 28 12:21:42 h222 pppd[21758]: pptpd-logwtmp: $Version$
Jul 28 12:21:42 h222 pptpd[21757]: GRE: Bad checksum from pppd.
Jul 28 12:21:42 h222 pppd[21758]: pppd options in effect:
Jul 28 12:21:42 h222 pppd[21758]: debug         # (from /etc/ppp/options.pptpd)
Jul 28 12:21:42 h222 pppd[21758]: dump          # (from /etc/ppp/options.pptpd)
Jul 28 12:21:42 h222 pppd[21758]: plugin radius.so              # 
(from command line)
Jul 28 12:21:42 h222 pppd[21758]: plugin 
/usr/lib/pptpd/pptpd-logwtmp.so       # (from command line)
Jul 28 12:21:42 h222 pppd[21758]: +mschap-v2            # (from 
/etc/ppp/options.pptpd)
Jul 28 12:21:42 h222 pppd[21758]: -chap         # (from /etc/ppp/options.pptpd)
Jul 28 12:21:42 h222 pppd[21758]: -mschap               # (from 
/etc/ppp/options.pptpd)
Jul 28 12:21:42 h222 pppd[21758]: name pptpd            # (from 
/etc/ppp/options.pptpd)
Jul 28 12:21:42 h222 pppd[21758]: pptpd-original-ip 192.87.138.220 # 
(from command line)
Jul 28 12:21:42 h222 pppd[21758]: 115200                # (from command line)
Jul 28 12:21:42 h222 pppd[21758]: lock          # (from /etc/ppp/options.pptpd)
Jul 28 12:21:42 h222 pppd[21758]: local         # (from command line)
Jul 28 12:21:42 h222 pppd[21758]: asyncmap 0            # (from 
/etc/ppp/options.pptpd)
Jul 28 12:21:42 h222 pppd[21758]: lcp-echo-failure 30           # 
(from /etc/ppp/options.pptpd)
Jul 28 12:21:42 h222 pppd[21758]: lcp-echo-interval 5           # 
(from /etc/ppp/options.pptpd)
Jul 28 12:21:42 h222 pppd[21758]: ipcp-accept-local             # 
(from /etc/ppp/options.pptpd)
Jul 28 12:21:42 h222 pppd[21758]: ipcp-accept-remote            # 
(from /etc/ppp/options.pptpd)
Jul 28 12:21:42 h222 pppd[21758]: ipparam 192.87.138.220 # (from command line)
Jul 28 12:21:42 h222 pppd[21758]: ms-dns xxx # [don't know how to 
print value] # (from /etc/ppp/options.pptpd)
Jul 28 12:21:42 h222 pppd[21758]: proxyarp              # (from 
/etc/ppp/options.pptpd)
Jul 28 12:21:42 h222 pppd[21758]: 192.168.0.1:192.168.0.21 # (from 
command line)
Jul 28 12:21:43 h222 pppd[21758]: require-mppe-128              # 
(from /etc/ppp/options.pptpd)
Jul 28 12:21:43 h222 pppd[21758]: pppd 2.4.3 started by root, uid 0
Jul 28 12:21:43 h222 pppd[21758]: Using interface ppp0
Jul 28 12:21:43 h222 pppd[21758]: Connect: ppp0 <--> /dev/pts/5
Jul 28 12:21:43 h222 pppd[21758]: Modem hangup
Jul 28 12:21:43 h222 pppd[21758]: Connection terminated.
Jul 28 12:21:43 h222 pppd[21758]: Exit.
Jul 28 12:21:43 h222 pptpd[21757]: CTRL: Client 192.87.138.220 
control connection finished


Here is my options.pptpd
lock
debug
dump
name pptpd
proxyarp
asyncmap 0
-chap
-mschap
+mschap-v2
require-mppe-128
#require-mppe
lcp-echo-failure 30
lcp-echo-interval 5
ipcp-accept-local
ipcp-accept-remote
ms-dns 192.87.138.99
#plugin radius.so

My pptpd.conf
#ppp /usr/sbin/pppd
option /etc/ppp/options.pptpd
debug
dump
# stimeout 10
#noipparam
logwtmp
#bcrelay eth1
# (Recommended)
localip 192.168.0.1
remoteip 192.168.0.20-238,192.168.0.245
# or
#localip 192.168.10.224-238,192.168.10.245
#remoteip 192.168.11.224-238,192.168.11.245
# CED



-
To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
