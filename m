From: "Mondal Atanu (IFIN DC COM)" <Atanu.Mondal@infineon.com>
Date: Wed, 14 Jan 2004 15:54:40 +0000
Subject: running pppd-2.4.2b3 with pppoatm plugin
Message-Id: <0C674B14EAEBD61196D900B0D03DB49FD21E28@blrw502w.blr.infineon.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,
I am trying to run pppd with pppoatm plugin. The setdevname* function in the
pppoatm.c(user space) is called twice
while parsing the option file.. once with doit value as 0 and next time with
doit value as 1. Can somebody
tell me any reason why it is so.. There is no check on the doit variable as
such in the function. So in the
first call itself the dev gets set, and in the next call of the function it
returns an error. So now I have put a check and
returning a 1 without doing anything if doit value is zero... and entering
the function if doit value is 1.

I have other problems facing in terms of setting the mtu value etc. Can
somebody give any patch or a link which says
how to run this correctly.

Thanking in advance..

Regards
Atanu Mondal
