From: Jelle de Jong <jelledejong@powercraft.nl>
Date: Tue, 29 Jun 2010 20:46:52 +0000
Subject: syslog pppd and pptp usefulness of log information
Message-Id: <4C2A5BBC.4020105@powercraft.nl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------020700060702040109010700"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org

This is a multi-part message in MIME format.
--------------020700060702040109010700
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello everybody,

I occasionally study my syslogs and also use tools like logcheck and 
fail2ban to monitor my servers.

I often get output form the pppd en pptp daemons on my debian gnu/linux 
systems that provide almost no useful information to me what really 
happens.

- successful connections?
- repeating failed attempts?
- connected user?
- login names used
..and so on?

I comment out all debug stanza's in de config files of pppd and pptp, so 
it should run on its default settings regarding its logging.

I am not asking for more output, the lesser the better, but more useful 
information.

I attached some examples of the log messages I have in my syslog.

I would appreciate it if somebody can explain why am I having this 
information and how the quality vs quantity is configured?

Thanks in advance,

With kind regards,

Jelle de Jong

--------------020700060702040109010700
Content-Type: text/plain;
 name="pptp-debug-logs-2010-06-29.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="pptp-debug-logs-2010-06-29.txt"

Jun 29 16:19:16 sammy pptpd[22449]: CTRL: Client 62.140.123.45 control connection started
Jun 29 16:19:17 sammy pptpd[22449]: CTRL: Starting call (launching pppd, opening GRE)
Jun 29 16:19:17 sammy pppd[22451]: Plugin /usr/lib/pptpd/pptpd-logwtmp.so loaded.
Jun 29 16:19:17 sammy pppd[22451]: pppd 2.4.4 started by root, uid 0
Jun 29 16:19:17 sammy pppd[22451]: Using interface ppp1
Jun 29 16:19:17 sammy pppd[22451]: Connect: ppp1 <--> /dev/pts/1
Jun 29 16:19:17 sammy pptpd[22449]: GRE: Bad checksum from pppd.
Jun 29 16:19:20 sammy pptpd[22449]: CTRL: Ignored a SET LINK INFO packet with real ACCMs!
Jun 29 16:19:20 sammy pppd[22451]: MPPE 128-bit stateless compression enabled
Jun 29 16:19:22 sammy pppd[22451]: found interface br0 for proxy arp
Jun 29 16:19:22 sammy pppd[22451]: local  IP address 10.10.210.11
Jun 29 16:19:22 sammy pppd[22451]: remote IP address 10.10.220.11
Jun 29 16:19:22 sammy named[22315]: received control channel command 'reconfig'
Jun 29 16:19:22 sammy named[22315]: loading configuration from '/etc/bind/named.conf'
Jun 29 16:19:22 sammy named[22315]: using default UDP/IPv4 port range: [1024, 65535]
Jun 29 16:19:22 sammy named[22315]: using default UDP/IPv6 port range: [1024, 65535]
Jun 29 16:19:22 sammy named[22315]: listening on IPv4 interface ppp1, 10.10.210.11#53
Jun 29 16:19:22 sammy named[22315]: reloading configuration succeeded
Jun 29 16:19:22 sammy named[22315]: any newly configured zones are now loaded
Jun 29 16:19:22 sammy postfix/master[4589]: reload configuration /etc/postfix

Jun 29 16:21:24 sammy pptpd[22449]: CTRL: Reaping child PPP[22451]
Jun 29 16:21:24 sammy pppd[22451]: Modem hangup
Jun 29 16:21:24 sammy pppd[22451]: Connect time 2.1 minutes.
Jun 29 16:21:24 sammy pppd[22451]: Sent 84611 bytes, received 128161 bytes.
Jun 29 16:21:24 sammy pppd[22451]: MPPE disabled
Jun 29 16:21:24 sammy pppd[22451]: Connection terminated.
Jun 29 16:21:24 sammy named[22315]: received control channel command 'reconfig'
Jun 29 16:21:24 sammy named[22315]: loading configuration from '/etc/bind/named.conf'
Jun 29 16:21:24 sammy named[22315]: using default UDP/IPv4 port range: [1024, 65535]
Jun 29 16:21:24 sammy named[22315]: using default UDP/IPv6 port range: [1024, 65535]
Jun 29 16:21:24 sammy named[22315]: no longer listening on 10.10.210.11#53
Jun 29 16:21:24 sammy named[22315]: reloading configuration succeeded
Jun 29 16:21:24 sammy named[22315]: any newly configured zones are now loaded
Jun 29 16:21:24 sammy postfix/master[4589]: reload configuration /etc/postfix
Jun 29 16:21:24 sammy pppd[22451]: Exit.
Jun 29 16:21:24 sammy pptpd[22449]: CTRL: Client 62.140.123.45 control connection finished

Jun 29 16:40:28 sammy pppd[19926]: LCP terminated by peer (^@^Z|0^@<M-Mt^@^@^@^@)
Jun 29 16:40:28 sammy pppd[19926]: Connect time 37.0 minutes.
Jun 29 16:40:28 sammy pppd[19926]: Sent 505449 bytes, received 83140 bytes.
Jun 29 16:40:28 sammy named[22315]: received control channel command 'reconfig'
Jun 29 16:40:28 sammy named[22315]: loading configuration from '/etc/bind/named.conf'
Jun 29 16:40:28 sammy named[22315]: using default UDP/IPv4 port range: [1024, 65535]
Jun 29 16:40:28 sammy named[22315]: using default UDP/IPv6 port range: [1024, 65535]
Jun 29 16:40:28 sammy named[22315]: no longer listening on 10.10.210.10#53
Jun 29 16:40:28 sammy named[22315]: reloading configuration succeeded
Jun 29 16:40:28 sammy named[22315]: any newly configured zones are now loaded
Jun 29 16:40:29 sammy postfix/master[4589]: reload configuration /etc/postfix
Jun 29 16:40:29 sammy pptpd[19924]: CTRL: Reaping child PPP[19926]
Jun 29 16:40:29 sammy pppd[19926]: Modem hangup
Jun 29 16:40:29 sammy pppd[19926]: Connection terminated.
Jun 29 16:40:29 sammy pppd[19926]: Exit.
Jun 29 16:40:29 sammy pptpd[19924]: CTRL: Client 86.94.12.34 control connection finished

Jun 29 17:09:16 sammy pptpd[31783]: CTRL: Client 86.94.12.34 control connection started
Jun 29 17:09:16 sammy pptpd[31783]: CTRL: Starting call (launching pppd, opening GRE)
Jun 29 17:09:16 sammy pppd[31784]: Plugin /usr/lib/pptpd/pptpd-logwtmp.so loaded.
Jun 29 17:09:16 sammy pppd[31784]: pppd 2.4.4 started by root, uid 0
Jun 29 17:09:16 sammy pppd[31784]: Using interface ppp0
Jun 29 17:09:16 sammy pppd[31784]: Connect: ppp0 <--> /dev/pts/0
Jun 29 17:09:16 sammy pptpd[31783]: GRE: Bad checksum from pppd.
Jun 29 17:09:19 sammy pptpd[31783]: CTRL: Ignored a SET LINK INFO packet with real ACCMs!
Jun 29 17:09:19 sammy pppd[31784]: MPPE 128-bit stateless compression enabled
Jun 29 17:09:21 sammy pppd[31784]: found interface br0 for proxy arp
Jun 29 17:09:21 sammy pppd[31784]: local  IP address 10.10.210.10
Jun 29 17:09:21 sammy pppd[31784]: remote IP address 10.10.220.10
Jun 29 17:09:21 sammy named[22315]: received control channel command 'reconfig'
Jun 29 17:09:21 sammy named[22315]: loading configuration from '/etc/bind/named.conf'
Jun 29 17:09:21 sammy named[22315]: using default UDP/IPv4 port range: [1024, 65535]
Jun 29 17:09:21 sammy named[22315]: using default UDP/IPv6 port range: [1024, 65535]
Jun 29 17:09:21 sammy named[22315]: listening on IPv4 interface ppp0, 10.10.210.10#53
Jun 29 17:09:21 sammy named[22315]: reloading configuration succeeded
Jun 29 17:09:21 sammy named[22315]: any newly configured zones are now loaded
Jun 29 17:09:22 sammy postfix/master[4589]: reload configuration /etc/postfix

Jun 29 17:38:21 sammy pppd[31784]: No response to 4 echo-requests
Jun 29 17:38:21 sammy pppd[31784]: Serial link appears to be disconnected.
Jun 29 17:38:21 sammy pppd[31784]: Connect time 29.0 minutes.
Jun 29 17:38:21 sammy pppd[31784]: Sent 173392 bytes, received 28680 bytes.
Jun 29 17:38:21 sammy pppd[31784]: MPPE disabled
Jun 29 17:38:21 sammy named[22315]: received control channel command 'reconfig'
Jun 29 17:38:21 sammy named[22315]: loading configuration from '/etc/bind/named.conf'
Jun 29 17:38:21 sammy named[22315]: using default UDP/IPv4 port range: [1024, 65535]
Jun 29 17:38:21 sammy named[22315]: using default UDP/IPv6 port range: [1024, 65535]
Jun 29 17:38:21 sammy named[22315]: no longer listening on 10.10.210.10#53
Jun 29 17:38:21 sammy named[22315]: reloading configuration succeeded
Jun 29 17:38:21 sammy named[22315]: any newly configured zones are now loaded
Jun 29 17:38:21 sammy postfix/master[4589]: reload configuration /etc/postfix
Jun 29 17:38:24 sammy pppd[31784]: Connection terminated.
Jun 29 17:38:24 sammy pppd[31784]: Modem hangup
Jun 29 17:38:24 sammy pppd[31784]: Exit.
Jun 29 17:38:24 sammy pptpd[31783]: GRE: read(fd=6,buffer=8058640,len=8196) from PTY failed: status = -1 error = Input/output error, usually caused by unexpected termination of pppd, check option syntax and pppd logs
Jun 29 17:38:24 sammy pptpd[31783]: CTRL: PTY read or GRE write failed (pty,gre)=(6,7)
Jun 29 17:38:24 sammy pptpd[31783]: CTRL: Reaping child PPP[31784]
Jun 29 17:38:24 sammy pptpd[31783]: CTRL: Client 86.94.12.34 control connection finished

Jun 29 18:00:18 sammy pptpd[8179]: CTRL: Client 86.94.12.34 control connection started
Jun 29 18:00:18 sammy pptpd[8179]: CTRL: Starting call (launching pppd, opening GRE)
Jun 29 18:00:18 sammy pppd[8180]: Plugin /usr/lib/pptpd/pptpd-logwtmp.so loaded.
Jun 29 18:00:18 sammy pppd[8180]: pppd 2.4.4 started by root, uid 0
Jun 29 18:00:18 sammy pppd[8180]: Using interface ppp0
Jun 29 18:00:18 sammy pppd[8180]: Connect: ppp0 <--> /dev/pts/0
Jun 29 18:00:18 sammy pptpd[8179]: GRE: Bad checksum from pppd.
Jun 29 18:00:21 sammy pptpd[8179]: CTRL: Ignored a SET LINK INFO packet with real ACCMs!
Jun 29 18:00:22 sammy pppd[8180]: MPPE 128-bit stateless compression enabled
Jun 29 18:00:23 sammy pppd[8180]: found interface br0 for proxy arp
Jun 29 18:00:23 sammy pppd[8180]: local  IP address 10.10.210.10
Jun 29 18:00:23 sammy pppd[8180]: remote IP address 10.10.220.10
Jun 29 18:00:23 sammy named[22315]: received control channel command 'reconfig'
Jun 29 18:00:23 sammy named[22315]: loading configuration from '/etc/bind/named.conf'
Jun 29 18:00:23 sammy named[22315]: using default UDP/IPv4 port range: [1024, 65535]
Jun 29 18:00:23 sammy named[22315]: using default UDP/IPv6 port range: [1024, 65535]
Jun 29 18:00:23 sammy named[22315]: listening on IPv4 interface ppp0, 10.10.210.10#53
Jun 29 18:00:23 sammy named[22315]: reloading configuration succeeded
Jun 29 18:00:23 sammy named[22315]: any newly configured zones are now loaded
Jun 29 18:00:23 sammy postfix/master[4589]: reload configuration /etc/postfix
Jun 29 18:01:44 sammy pptpd[8179]: CTRL: Reaping child PPP[8180]
Jun 29 18:01:44 sammy pppd[8180]: Modem hangup
Jun 29 18:01:44 sammy pppd[8180]: Connect time 1.4 minutes.
Jun 29 18:01:44 sammy pppd[8180]: Sent 170745 bytes, received 18753 bytes.
Jun 29 18:01:44 sammy pppd[8180]: MPPE disabled
Jun 29 18:01:44 sammy pppd[8180]: Connection terminated.
Jun 29 18:01:44 sammy named[22315]: received control channel command 'reconfig'
Jun 29 18:01:44 sammy named[22315]: loading configuration from '/etc/bind/named.conf'
Jun 29 18:01:44 sammy named[22315]: using default UDP/IPv4 port range: [1024, 65535]
Jun 29 18:01:44 sammy named[22315]: using default UDP/IPv6 port range: [1024, 65535]
Jun 29 18:01:44 sammy named[22315]: no longer listening on 10.10.210.10#53
Jun 29 18:01:44 sammy named[22315]: reloading configuration succeeded
Jun 29 18:01:44 sammy named[22315]: any newly configured zones are now loaded
Jun 29 18:01:44 sammy postfix/master[4589]: reload configuration /etc/postfix
Jun 29 18:01:44 sammy pppd[8180]: Exit.
Jun 29 18:01:44 sammy pptpd[8179]: CTRL: Client 86.94.12.34 control connection finished

--------------020700060702040109010700--
