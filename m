From: "Gilles Espinasse" <g.esp@free.fr>
Date: Thu, 11 Nov 2004 16:16:08 +0000
Subject: Re: PPP Timeout
Message-Id: <023301c4c809$c120f540$f9b5a8c0@PII350>
List-Id: <linux-ppp.vger.kernel.org>
References: <AB78549255EA7A4683F64803C159436D02EE4F47@stpmse02.stp.guidant.com>
In-Reply-To: <AB78549255EA7A4683F64803C159436D02EE4F47@stpmse02.stp.guidant.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


----- Original Message ----- 
From: "Rana, Gaurav (STP)" <Gaurav.Rana@guidant.com>
To: "PPP mailing list" <linux-ppp@vger.kernel.org>
Sent: Thursday, November 11, 2004 5:03 PM
Subject: PPP Timeout


> I have a question about the PPPD timeout.
>
> I am using PPPD 2.4.2 on Linux (embedded system)
>
> I successfully establish a connection with a ISP, get an IP address, and
then for testing purposes I plug out the modem wire. Subsequently, any
application writing (I use write() ) to the pppd socket just hangs and then
after 15 minutes or so write() returns with an error. Is there anyway I
could reduce this timeout to 5 minutes or so?
>
> Thanks,
> Gaurav
>
Using
lcp-echo-interval 20
lcp-echo-failure 3
give a timeout after 20*3s

