From: "mohammed shareef" <mdshareef@gmail.com>
Date: Mon, 16 Jun 2008 12:48:16 +0000
Subject: ppp on 2.6.18
Message-Id: <a1d91fa0806160536r646577e2n7099431aa934a556@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: omap <linux-omap@vger.kernel.org>, linux-ppp@vger.kernel.org

Dear all,

i have enabled ppp services when configuring the kernel 2.6.18.

the kernel bootup  of omap5912 osk says this:

PPP generic driver version 2.4.2
PPP Deflate Compression module registered
PPP BSD Compression module registered

but when i type "pppd -h" in the osk console i get:

# pppd -h
-sh: pppd: not found

please help me in configuring ppp.
thank you,
Shareef
