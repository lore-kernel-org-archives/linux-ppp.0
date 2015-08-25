From: Vertical Limit <vertlim@gmail.com>
Date: Tue, 25 Aug 2015 09:09:11 +0000
Subject: HDLC frame timing
Message-Id: <CAHZee8gDhYwwub+cjFF=8RsDZiG=rFwVo7MrwWofvoJSyZrbdA@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi all,

I am currently working on a system using pppd over a special radio
link. Would it be possible to insert a small time break (around 2ms)
between two consecutive HDLC frames? I could imagine compiling a
special customized pppd version for this purpose. I think there is no
pppd option for achieving this. Could someone help me by pointing me
to the right lines of codes or giving a better solution?

Many thanks,
Thomas
