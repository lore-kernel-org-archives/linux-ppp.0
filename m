From: "cyx_mail@foxmail.com" <cyx_mail@foxmail.com>
Date: Sun, 04 May 2008 12:01:19 +0000
Subject: Help! It seems that pppd can't work properly when syslogd running on background
Message-Id: <200805042001189395244@foxmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

the syslog messege below:


Jan  1 00:03:09 (none) daemon.err pppoe-server[802]: PADT: Generic-Error: RP-PPPoE: System call error: Input/or
Jan  1 00:03:09 (none) daemon.info pppoe-server[802]: Sent PADT
Jan  1 00:03:09 (none) daemon.info pppd[814]: Terminating on signal 15
Jan  1 00:03:09 (none) user.notice Terminating on signal 15
Jan  1 00:03:09 (none) user.notice  
Jan  1 00:03:09 (none) daemon.warn pppd[814]: Child process /sbin/pppoe -n -I br0 -e 2:00:50:ba:fa:6d:e1 -S ''5
Jan  1 00:03:09 (none) user.notice Child process /sbin/pppoe -n -I br0 -e 2:00:50:ba:fa:6d:e1 -S '' (pid 815) 5
Jan  1 00:03:09 (none) user.notice  
Jan  1 00:03:14 (none) daemon.info pppoe-server[819]: Session 3 created for client 00:50:ba:fa:6d:e1 (192.168.'
Jan  1 00:03:14 (none) daemon.notice pppd[819]: pppd 2.4.3 started by root, uid 0
Jan  1 00:03:14 (none) daemon.info pppd[819]: Using interface ppp0
Jan  1 00:03:14 (none) user.notice Using interface ppp0
Jan  1 00:03:14 (none) user.notice  
Jan  1 00:03:14 (none) daemon.notice pppd[819]: Connect: ppp0 <--> /dev/pts/0
Jan  1 00:03:14 (none) user.notice Connect: ppp0 <--> /dev/pts/0
Jan  1 00:03:14 (none) user.notice  
Jan  1 00:03:15 (none) daemon.notice pppd[814]: Connection terminated.
Jan  1 00:03:15 (none) user.notice Connection terminated.
Jan  1 00:03:15 (none) user.notice  
Jan  1 00:03:15 (none) daemon.warn pppd[819]: Warning - secret file /etc/ppp/pap-secrets has world and/or grous
Jan  1 00:03:15 (none) user.notice Warning - secret file /etc/ppp/pap-secrets has world and/or group access
Jan  1 00:03:15 (none) user.notice  
Jan  1 00:03:15 (none) daemon.notice pppd[814]: Modem hangup
Jan  1 00:03:15 (none) user.notice Modem hangup
Jan  1 00:03:15 (none) user.notice  
Jan  1 00:03:15 (none) daemon.info pppd[814]: Exit.
Jan  1 00:03:15 (none) user.notice pppoe: 
Jan  1 00:03:15 (none) user.notice read (asyncReadFromPPP): Session 2: Input/output error
Jan  1 00:03:15 (none) user.notice  
Jan  1 00:03:15 (none) daemon.err pppoe[817]: read (asyncReadFromPPP): Session 2: Input/output error
Jan  1 00:03:15 (none) daemon.info pppoe-server[802]: Session 2 closed for client 00:50:ba:fa:6d:e1 (192.168.10
Jan  1 00:03:45 (none) daemon.err pppoe-server[802]: PADT: Generic-Error: RP-PPPoE: System call error: Input/or
Jan  1 00:03:45 (none) daemon.info pppoe-server[802]: Sent PADT
Jan  1 00:03:45 (none) daemon.info pppd[819]: Terminating on signal 15
Jan  1 00:03:45 (none) user.notice Terminating on signal 15
Jan  1 00:03:45 (none) user.notice  
Jan  1 00:03:45 (none) daemon.warn pppd[819]: Child process /sbin/pppoe -n -I br0 -e 3:00:50:ba:fa:6d:e1 -S ''5
Jan  1 00:03:45 (none) user.notice Child process /sbin/pppoe -n -I br0 -e 3:00:50:ba:fa:6d:e1 -S '' (pid 820) 5
Jan  1 00:03:45 (none) user.notice  
Jan  1 00:03:50 (none) daemon.info pppoe-server[824]: Session 4 created for client 00:50:ba:fa:6d:e1 (192.168.'
Jan  1 00:03:50 (none) daemon.notice pppd[824]: pppd 2.4.3 started by root, uid 0
Jan  1 00:03:50 (none) daemon.info pppd[824]: Using interface ppp1
Jan  1 00:03:50 (none) user.notice Using interface ppp1
Jan  1 00:03:50 (none) user.notice  
Jan  1 00:03:50 (none) daemon.notice pppd[824]: Connect: ppp1 <--> /dev/pts/1
Jan  1 00:03:50 (none) user.notice Connect: ppp1 <--> /dev/pts/1
Jan  1 00:03:50 (none) user.notice  
Jan  1 00:03:51 (none) daemon.notice pppd[819]: Connection terminated.
Jan  1 00:03:51 (none) user.notice Connection terminated.
Jan  1 00:03:51 (none) user.notice  
Jan  1 00:03:51 (none) daemon.warn pppd[824]: Warning - secret file /etc/ppp/pap-secrets has world and/or grous
Jan  1 00:03:51 (none) user.notice Warning - secret file /etc/ppp/pap-secrets has world and/or group access
Jan  1 00:03:51 (none) user.notice  
Jan  1 00:03:51 (none) daemon.notice pppd[819]: Modem hangup
Jan  1 00:03:51 (none) user.notice Modem hangup
Jan  1 00:03:51 (none) user.notice  
Jan  1 00:03:51 (none) user.notice pppoe: 
Jan  1 00:03:51 (none) user.notice read (asyncReadFromPPP): Session 3: Input/output error
Jan  1 00:03:51 (none) user.notice  
Jan  1 00:03:51 (none) daemon.err pppoe[822]: read (asyncReadFromPPP): Session 3: Input/output error
Jan  1 00:03:51 (none) daemon.info pppd[819]: Exit.
Jan  1 00:03:51 (none) daemon.info pppoe-server[802]: Session 3 closed for client 00:50:ba:fa:6d:e1 (192.168.10

but I can get a successful connection when I kill syslogd ,Why?

2008-05-04 


