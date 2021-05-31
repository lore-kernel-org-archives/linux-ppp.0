From: Artem Mygaiev <joculator@gmail.com>
Date: Mon, 31 May 2021 18:36:58 +0000
Subject: PPP ECP (RFC1968) support
Message-Id: <CAJwc6KsAwMXDcw8LH6s9JUDLPyBOsaohReG4kt4r0q8bR86D4A@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello

Going through the pppd and drivers/net/ppp/* code I cannot find a finished
implementation of ECP encryption. The only relevant commit in pppd I can see
is adding ECP patches from Frank Cusack including beginnings of ecp.c which,
as it seems, was never finished. On a kernel side I can only see MPPE
compressor and nothing related to ECP.

Am I missing something? Maybe there is some repo with unfinished work?

Appreciate any pointers

Best regards,
Artem Mygaiev
