From: "Rana, Gaurav (STP)" <Gaurav.Rana@guidant.com>
Date: Thu, 11 Nov 2004 16:03:34 +0000
Subject: PPP Timeout
Message-Id: <AB78549255EA7A4683F64803C159436D02EE4F47@stpmse02.stp.guidant.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I have a question about the PPPD timeout.

I am using PPPD 2.4.2 on Linux (embedded system)

I successfully establish a connection with a ISP, get an IP address, and then for testing purposes I plug out the modem wire. Subsequently, any application writing (I use write() ) to the pppd socket just hangs and then after 15 minutes or so write() returns with an error. Is there anyway I could reduce this timeout to 5 minutes or so?

Thanks,
Gaurav

