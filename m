From: "Miguel-Munoz" <miguelmunoz@sepsa.es>
Date: Thu, 11 Nov 2004 16:14:54 +0000
Subject: RE: PPP Timeout
Message-Id: <IOEHIKKJIFJJGEGCNCDJKEBKCBAA.miguelmunoz@sepsa.es>
List-Id: <linux-ppp.vger.kernel.org>
References: <AB78549255EA7A4683F64803C159436D02EE4F47@stpmse02.stp.guidant.com>
In-Reply-To: <AB78549255EA7A4683F64803C159436D02EE4F47@stpmse02.stp.guidant.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I think (you sould test it) that when this occurs, the program receives
a signal, I think a SIGPIPE (the pipe is broken).
You could use that signal to close de socket and return from the loop.

I hope it?ll work

-----Mensaje original-----
De: linux-ppp-owner@vger.kernel.org
[mailto:linux-ppp-owner@vger.kernel.org]En nombre de Rana, Gaurav (STP)
Enviado el: jueves, 11 de noviembre de 2004 17:04
Para: PPP mailing list
Asunto: PPP Timeout


I have a question about the PPPD timeout.

I am using PPPD 2.4.2 on Linux (embedded system)

I successfully establish a connection with a ISP, get an IP address, and
then for testing purposes I plug out the modem wire. Subsequently, any
application writing (I use write() ) to the pppd socket just hangs and then
after 15 minutes or so write() returns with an error. Is there anyway I
could reduce this timeout to 5 minutes or so?

Thanks,
Gaurav

-
To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

