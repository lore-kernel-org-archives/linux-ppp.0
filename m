From: Dmitry Vereschaka <dmitry@rsl.ru>
Date: Wed, 29 Sep 2004 05:20:29 +0000
Subject: counters overflow
Message-Id: <262655318.20040929092029@rsl.ru>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello linux-ppp,

  The problem is that counters for 'bytes in' and 'bytes out' are 32 bit integers, which
  is enough for counting data while connected via modem, but really small while using
  pppoe or pptpd-based solutions deployed over 100/1000mbit network.

-- 
Best regards,
 Dmitry                          mailto:dmitry@rsl.ru

