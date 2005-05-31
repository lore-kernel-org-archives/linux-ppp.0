From: "Alexey A. Kiritchun" <kaa@nightmail.ru>
Date: Tue, 31 May 2005 08:29:32 +0000
Subject: persist and pty problems: any pathes to test?
Message-Id: <200505311229.32688.kaa@nightmail.ru>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello.

Can anyone tell me, is any work being done to make 'persist' work?
As of 2.4.3, as far as I can see, pppd behaves strangely with 'persist'. For 
me, it does not restart the pty script, in case the script has terminated 
without really opening conection.

strace shows, that pppd gets stuck select(2)ing on an empty set of fds, and 
the only way to reinitiate connection is to send a signal to it.

If some patches do exist to fix this, I'll be glad to test them.

Thanks.
-- 
Alexey A. Kiritchun
