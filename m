From: Bill Unruh <unruh@physics.ubc.ca>
Date: Thu, 28 Jul 2005 12:28:18 +0000
Subject: Re: Current size of PPP transmit queue
Message-Id: <Pine.LNX.4.61.0507280524170.13575@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <87ABB5B9BD11A240B9CBB3F0485AEC89236138@IMCSRV4.MITRE.ORG>
In-Reply-To: <87ABB5B9BD11A240B9CBB3F0485AEC89236138@IMCSRV4.MITRE.ORG>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, 28 Jul 2005, Ramses van Pinxteren wrote:

> Hi,
> I am setting up a VPN server and I am running into a wierd problem. On mac i 
> can connect most of the time, but on windows I get 99% of the times an error 
> that there is a loopback detected. (error 737) I have the funny feeling it is 
> ppp related...
>
> I am using the following software versions:
> dkms-2.0.5.2-4.fc4
> kernel_ppp_mppe-0.0.5-5dkms
> pptpd-1.2.1-2
> ppp-2.4.3-5.fc4
> kernel_ppp_mppe-0.0.5-5dkms
> radiusclient-0.3.2-0.1.fc3.rf
> freeradius-1.0.4-1.FC4.1
>
Unfortunately although you have the 
debug
option for pppd , I think y ou forgot to put a line like
local2.*;daemon.*     /var/log/ppplog
into /etc/syslog.conf
and then do 
killall -1 syslogd

YOu are not getting any of the pppd negotiation messages, which would be
needed to analyse your problem.


>
> this is the dump of the logfile:
...
> Jul 28 12:21:43 h222 pppd[21758]: pppd 2.4.3 started by root, uid 0
> Jul 28 12:21:43 h222 pppd[21758]: Using interface ppp0
> Jul 28 12:21:43 h222 pppd[21758]: Connect: ppp0 <--> /dev/pts/5
> Jul 28 12:21:43 h222 pppd[21758]: Modem hangup

Note no negotiation messages.

> Jul 28 12:21:43 h222 pppd[21758]: Connection terminated.
> Jul 28 12:21:43 h222 pppd[21758]: Exit.
> Jul 28 12:21:43 h222 pptpd[21757]: CTRL: Client 192.87.138.220 control 
> connection finished
>
