From: tony.chamberlain@lemko.com
Date: Wed, 24 Feb 2010 13:10:50 +0000
Subject: pppd pty =?utf-8?Q?=22ad hoc=22?= ppp connection -- two questions
Message-Id: <W1630912826253691267017050@webmail40>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Somebody sent me this which I didn't know before (see below the "=").
This message I guess is two-fold:

  1 - to see if anyone has an answer for Pete (below)

  2 - for me to ask on a related question in that I did the pppd comman
      below to several machines (one at a time).  Some readily set up
      the ppp connection, but others never did.  Either the pppd on the
      far end timed out doing LCP request or I never seemed to get output
      in the ppp log (I defined in an options file), though sometimes I
      did see. Since we use 10 network I changed the IPs to like 172.21.32.
      Here is output from a machine which worked (CentOS 4.5 and 5.4)

   This is from /var/log/messages.
   kernel: PPP generic driver version 2.4.2
   pppd[14547]: pppd 2.4.2 started by root, uid 0
   pppd[14547]: Using interface ppp0
   pppd[14547]: Connect: ppp0 <--> /dev/pts/6
   kernel: PPP Deflate Compression module registered
   pppd[14547]: Deflate (15) compression enabled
   pppd[14547]: local  IP address 172.21.32.2
   pppd[14547]: remote IP address 172.21.32.1
 
     and a failed one (different machine):
     pppd[21454]: pppd 2.4.4 started by root, uid 0
     pppd[21454]: Using interface ppp0
     pppd[21454]: Connect: ppp0 <--> /dev/pts/4
     pppd[21454]: Hangup (SIGHUP)
     pppd[21454]: Modem hangup
     pppd[21454]: Connection terminated.
     pppd[21454]: Exit.

     ppp log:
    using channel 3
    Using interface ppp0
    Connect: ppp0 <--> /dev/pts/4
    sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xf7cf130e> <pcomp> <accomp>]
    sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xf7cf130e> <pcomp> <accomp>]
    Hangup (SIGHUP)
    Modem hangup

I do not know the difference.  I do know that the machines that seem to
have a problem are accessed behind routers with public IP addresses that
direct to the machines in the gateway (209.11.123.2 eg (not the real address)
is what you ssh to but the machine IP is like 192.168.20.7.  I don't know 
whether that makes a difference or not?

Anyone have any ideas why the difference?







=
Given two systems with IP address A.B.C.D and W.X.Y.Z, you can set
up a ppp link between them using ssh:

On A.B.C.D, run:

  pppd pty 'ssh -t W.X.Y.Z /usr/sbin/pppd 10.10.10.2:10.10.10.1' 10.10.10.1:10.10.10.2

(You need to run this command as root, and you need to be configured so
that you can ssh to W.X.Y.Z without a password.  If it works properly,
there will be a ppp0 device created on both systems.  10.10.10.1 will be
the near end on A.B.C.D and 10.10.10.2 will be the far end)

Once the ppp connection has been established you can run a ping command
with the -I option to specify the ppp interface.

Up through Fedora 11 both of these commands will work when run on
A.B.C.D (we've tried Fedora 4, 7, 8, and 11):

    ping -I ppp0 10.10.10.2
    ping -I ppp0 W.X.Y.Z

But, STARTING WITH FEDORA 12, only the first command (ping -I ppp0 10.10.10.2)
will work.  The second command does not receive a response and the
ping times out, but tcpdump DOES show the ICMP packet being sent AND
the response being received.  The response is just not being delivered
by the network stack to the ping application!  There are no firewall
rules, and selinux is disabled.

All we can figure is the something changed between Fedora 11 (kernel
2.6.30.10) and Fedora 12 (2.6.31.12), but I can't find anything google
or bugzilla that might explain what's going on.

I'm curious whether other anyone has any ideas, and I would also like
to know if folks running recent kernels can reproduce this.  (Is it
something that changed in the stock kernel, around 2.6.31, or is it
something specific to Fedora?)

Thanks for listening, and for any suggestions!

Pete


