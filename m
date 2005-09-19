From: Mark Yeck <y3k@gti.net>
Date: Mon, 19 Sep 2005 17:34:40 +0000
Subject: mschap-v2 error
Message-Id: <op.sxc1r2gpd76ul5@linux.local>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi. I'm trying to use pptpclient to connect a debian box to a freebsd  
server running poptop
and I'm having some problems. I need to use MSChap-v2 and MPPE. The  
connection fails during
authentication. Here is the log:

rcvd [CHAP Challenge id=0x1 <1c02e335af7199024a4e94c1132afaba>, name = ""]
sent [CHAP Response id=0x1
<47cc3e29f816023c4904e8c424226c50faffbfc92b0c401edcc7bd488d063dca9c1b4e40a0b78d24a2cdc71ba3c03fc89e>,
  name = "marky"]
rcvd [LCP EchoRep id=0x0 magic=0x6e5ade79]
rcvd [CHAP Failure id=0x1 "Ei1 R=0 C02E335AF7199024A4E94C1132AFABA  
V=3 M=Invalid!\000"]
MS-CHAP authentication failed: Invalid!
CHAP authentication failed

more interesting is the log from the server:

Sep 16 12:52:10 fireball ppp[21854]: Phase: Chap Input: RESPONSE (49 bytes  
from
marky)
Sep 16 12:52:10 fireball ppp[21854]: Warning: deflink: Compensating for  
corrupt
(Win98/WinME?) CHAP81 RESPONSE
Sep 16 12:52:10 fireball ppp[21854]: Phase: Chap Output: FAILURE
Sep 16 12:52:10 fireball ppp[21854]: LCP: deflink: LayerDown

 From what I can tell, the "Compensating for corrupt (Win98/WinME?) CHAP81  
RESPONSE" message
occurs when the last byte of the response is non-zero.

Client:
debian 3.1 with kernel 2.6.8 with kernel-patch-mppe v2.4.2+20040216-4  
installed
pptp 1.7.0-2
ppp 2.4.3-20050321+2 also tried with 2.4.4b1

Server:
FreeBSD 5.4-RELEASE
poptop-1.1.4.b4_3 using userland ppp

Thanks in advance!
-mark

-- 
Using Opera's revolutionary e-mail client: http://www.opera.com/mail/
