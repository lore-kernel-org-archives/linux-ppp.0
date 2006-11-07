From: Kenneth Kassing <kassing@patton.com>
Date: Tue, 07 Nov 2006 16:44:11 +0000
Subject: Multilink PPP Problem
Message-Id: <4550B7DB.7010207@patton.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I am trying to use pppd 2.4.4 to do MLPPP over several hdlc interfaces. 
For my test case, I have two identical units connected back to back. The 
link establishes correctly and will pass data.  If the master link is 
reset for any reason, the master will fail to reestablish a connection.

For a test case, I manually disable the link from the remote side, and 
then re-enable it.  I tail the syslog for the link I did not reset to 
wach the output from pppd.  I see that pppd is rejecting the configure 
requests for multilink.  Here is the error message I see:


sent [IPCP ConfReq id=0x1 <addr 192.168.254.1>]
rcvd [proto=0x3d] 80 00 00 07 80 21 02 01 00 0a
Unsupported protocol 'Multi-Link' (0x3d) received
sent [LCP ProtRej id=0x6 00 3d 80 00 00 07 80 21 02 01 00 0a]
rcvd [proto=0x3d] 40 00 00 08 03 06 c0 a8 fe 01
Unsupported protocol 'Multi-Link' (0x3d) received
sent [LCP ProtRej id=0x8 00 3d 40 00 00 08 03 06 c0 a8 fe 01]
rcvd [proto=0x3d] 40 00 00 0a 03 06 c0 a8 fe 00



I have looked into the code, and found that pppd is looking to match 
protocols in "struct protent *protocols[]" table (in main.c).  Multilink 
does not have an entry in this table, and therefore will never link 
correctly.  (The line which prints the 'Unsupported protocol' message is 
shortly after the code which loops this table, in the function 'get_input'.)

Any suggestions here?

Thanks

Ken Kassing
