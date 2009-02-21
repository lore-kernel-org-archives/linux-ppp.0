From: Kapil Upadhayay <kupadhay@gmail.com>
Date: Sat, 21 Feb 2009 13:19:02 +0000
Subject: linux box dropping LCP packet from win2k3 PPTP server.
Message-Id: <e60c88480902210507h2d24627dhe24a044f3ca9dfc0@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello,

i  am using pppd 2.4.4b1 on client side on linux-2.6.10 kernel with
mppe support enabled. My scenario is like, from my linux box I am
trying to connect to a win2k3 server host connected locally in my
subnet.  After repeated trials I  am unable to do so, though i  am
able to connect to linux pptp server (with mppe enabled).  Can you
please help me  out where exactly things are going wrong. On network
sniffer i  can see that the LCP Conf-Req.  packet is being sent
through the windows host to my linux box and my linux box's firewall
is not dropping it.

I  tried to get to the root cause of the issue and  i see read_packet(
) repeatedly calling  read( ) which in turn tries to read from
/dev/ppp. Read always returns -1 to read_packet(). Is it because the
driver is not writing anything to /dev/ppp and the daemon is not able
to read it?.  On the driver side i.e ppp_generic.c and ppp_async.c I
do not see  ppp_input( ) being called.  Please correct me if  I am
wrong as I am new to PPP.  Is it the right place to see or the issue
is in GRE.

please have a look on the logs below

pppd logs:
----------
[pppd] pppd 2.4.4b1 started by root, uid 0
[pppd] Starting connection
[pppd] using channel 566
[pppd] Using interface ppp0
[pppd] Connect: ppp0 <--> /dev/ttyp0
[pptp] anon log[main:pptp.c:267]: The synchronous pptp option is NOT activated_
[pptp] anon log[ctrlp_rep:pptp_ctrl.c:251]: Sent control packet type
is 1 'Start-Control-Connection-Request'_
[pptp] anon log[ctrlp_disp:pptp_ctrl.c:738]: Received Start Control
Connection Reply
[pptp] anon log[ctrlp_disp:pptp_ctrl.c:772]: Client connection established.
[pppd] sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x9c77b516>
<pcomp> <accomp>]
[pptp] anon log[ctrlp_rep:pptp_ctrl.c:251]: Sent control packet type
is 7 'Outgoing-Call-Request'_
[pptp] anon log[ctrlp_disp:pptp_ctrl.c:857]: Received Outgoing Call Reply.
[pptp] anon log[ctrlp_disp:pptp_ctrl.c:896]: Outgoing call established
(call ID 0, peer's call ID 28336)._
[pppd] sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x9c77b516>
<pcomp> <accomp>]
[pppd] sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x9c77b516>
<pcomp> <accomp>]
[pppd] Child process pptp 192.168.3.2 --nolaunchpppd (pid 12728)
terminated with signal 15
[pppd] Child process pppd (charshunt) (pid 12730) terminated with signal 15
[pptp] anon log[callmgr_main:pptp_callmgr.c:255]: Closing connection (shutdown)
[pptp] anon log[ctrlp_rep:pptp_ctrl.c:251]: Sent control packet type
is 12 'Call-Clear-Request'_
[pptp] anon log[ctrlp_disp:pptp_ctrl.c:928]: Call disconnect
notification received (call id 0)
[pptp] anon log[ctrlp_error:pptp_ctrl.c:199]: Result code is 0
'Unknown Result Code'. Error code is 0, Cause code
[pptp] anon log[call_callback:pptp_callmgr.c:78]: Closing connection
(call state)
[pppd] Modem hangup
[pppd] Connection terminated.
[pppd] Exit.

here is the output of pppdump -p
--------------------------------
time  1.7s
sent  ff 03 c0 21 01 01 00 14 02 06 00 00 00 00 05 06  ...!............
      2d db f3 6e 07 02 08 02                                      -..n....
time  3.0s
sent  ff 03 c0 21 01 01 00 14 02 06 00 00 00 00 05 06  ...!............
      2d db f3 6e 07 02 08 02                                       -..n....

here is the command used to invoke pppd/pptp:
---------------------------------------------
pppd 0.0.0.0:0 lcp-echo-failure 10 lcp-echo-interval 5 noauth
nobsdcomp nodeflate defaultroute user pptp password aesgs123 mtu 1492
linkname 0 idle 0  pty 'pptp 192.168.3.2 --nolaunchpppd record
/var/pppRecOut require-mppe-128

PS: Also can you please point me where is the starting point the where
the LCP packet is received by the  PPP driver, if that is the case. OR
ppp driver comes into picture only when link negotiation had has
successfully completed and actuall PPP packets can be transmitted over
the link.

Thanks,
kapil
