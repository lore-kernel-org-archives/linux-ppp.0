From: "Nicolas Olivier" <nolivier@alphalink.fr>
Date: Wed, 10 Nov 2004 09:40:36 +0000
Subject: PPP asynchronous HDLC
Message-Id: <4191E214.2050003@alphalink.fr>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello,

I wanted to know who could it be possible to do PPP asynchronous HDLC.
My idea is to build such circuit:

RTC Modem <---async---> ... <---async---> serial <---> async/sync converter <---sync---> L2TP daemon

I found on PPP sources a Solaris to do such conversion, but how could it be possible under Linux.

Thanks in advance for any suggestion.

Nicolas Olivier

