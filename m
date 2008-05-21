From: "cyx_mail" <cyx_mail@foxmail.com>
Date: Wed, 21 May 2008 13:31:20 +0000
Subject: issue about PIDs ?
Message-Id: <200805212131204066521@foxmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,all!                                     

	I got some kill PID issue. I think the data struct "ClientSessionStruct" connecting pppoe-server process and pppd process. So , when the server get a PADT, it can kill the child pppd process by according to the ClientSessionStruct's member pid.
	my problem:
	I modified the pppoe-server code ,and let pppoe-server spawn a pppd. then let the server send SIGTEM to pppd(using kill(pppd 2's pid , SIGTEM)) not using the normal way(such as stopsession as the code written). the pppoe-server and pppd die both, why?

	

2008-05-21 



